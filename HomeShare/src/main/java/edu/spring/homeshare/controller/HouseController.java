package edu.spring.homeshare.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.MediaUtil;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value = "house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;

	@Autowired
	private BookService bookService;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void search(HttpServletRequest req, Model model, Integer page, Integer prePage) {

		/* ����¡ ó�� */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}

		/* �Ķ���� ���� */
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		String maxCapacity = req.getParameter("maxCapacity");
		logger.info("maxCapacity : " + maxCapacity);

		/* hash�ʿ� ���� �ֱ� */
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		logger.info("maptostring : " + map.toString());

	
		
		List<HouseVO> list = houseService.multySelect(map);
		
		/* score�� ���� ��հ� �ֱ�*/
		int[] score =  new int[list.size()];
		
		//test
		logger.info("list 1���� �� : " + list.get(0).getHouseNo());
		
		for(int i=0; i<list.size(); i++) {
			logger.info("list���� ���� houseNo : " + list.get(i).getHouseNo());
			logger.info("list : " + list.toString());
		}
		logger.info("list ���� : " + list.toString());
		logger.info("list ���� : " + list.size());
		model.addAttribute("houseList",list);
		
		
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords(map));
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		
		logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
		logger.info("���� ���õ� ������ : " + c.getPage());
		logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
		logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
		logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());


	}

	/* location �˻� ���� */

	/* house-detail ���� */
	@RequestMapping(value = "/house-detail", method = RequestMethod.GET)
	public void readHouse(int houseNo, Model model, @ModelAttribute("criteria") PageCriteria criteria) {
		logger.info("house-detail ���� " + houseNo);
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
		model.addAttribute("houseVO", vo);
	}

	/* ȣ���� ���� */
	@RequestMapping(value = "/host", method = RequestMethod.POST)
	public void Housting(Model model, HttpServletRequest req) {
		logger.info("hosting ���� ");

		// ���ǿ��� ���̵�, memNo ��������
		HttpSession session = req.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		if (sessionMemId != null) {
			int memNo = (int) session.getAttribute("memNo");
			List<HouseVO> list = houseService.selectAllByMemNO(memNo);
			logger.info("list : " + list.toString());
			model.addAttribute("list", list);

		} else {
			logger.info("������ �����ϴ�. �α��� ���ּ���");
		}
	}

	/* list all ��� ���� ���� */
	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	public void listAll(Model model) {
		List<HouseVO> list = houseService.selectAll();
		model.addAttribute("list", list);
		logger.info("list : " + list.toString());
	}

	/* insert ���� */
	// ���ҵ��
	@RequestMapping(value = "/house-insert", method = RequestMethod.GET)
	public void houseInsertGet(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionMemNo = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		logger.info("���� ���̵� : " + sessionMemNo);
		logger.info("house-insert get ����");
	}

	@RequestMapping(value = "/house-insert-post", method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo, MultipartFile[] files, RedirectAttributes reAttr) throws IOException {
		logger.info("house-insert-post ����");
		logger.info(vo.toString());

		if (files.length > 0 || files.length < 11) {
			logger.info("inset ����");
			logger.info("���� ���� : " + files.length);
			
			

			int result = houseService.create(vo);
			if (result == 0) {
				logger.info("insert ����");
				return "/";
			} else {
				// TODO : �������� ���� ������ ������ ����ó�� �Ұ�
				logger.info("insert ����");
				logger.info("insert ��� houseNo : " + result);
				String fileResult = null;
				logger.info("���Ͼ��ε� ����");
				for (MultipartFile f : files) {
					// ���ε��ϱ�
					fileResult = FileUploadUtil.saveUploadedFile(uploadPath, "houseno" + result,
							f.getOriginalFilename(), f.getBytes());
					logger.info("���ε� ��� fileResult : " + fileResult);
				}
				// ���丮 �о����
				String path = uploadPath + File.separator + "houseno" + result;
				String filePath = FileUploadUtil.readDirectory(path);

				logger.info("filePath" + filePath);

				// vo�� �����н� ������Ʈ�ϱ�
				logger.info("result (houseno) : " + result);
				String[] sep = filePath.split(",");
				String totalPath = "";
				for (int i = 0; i < sep.length; i++) {
					totalPath += "houseno" + result + File.separator + sep[i] + ",";
				}

				vo.setImage(totalPath); // ��� + ����
				vo.setHouseNo(result); // result == ���� ��������
				logger.info("������Ʈ�� vo : " + vo.toString());

				int updateResult = houseService.update(vo);
				if (updateResult == 1) {
					logger.info("������Ʈ �� vo : " + vo.toString());
					logger.info("�����ּҸ� ������Ʈ �Ͽ����ϴ�.");
				} else {
					logger.info("�����ּ� ������Ʈ�� ���� �Ͽ����ϴ�.");
				}

				return "/";
			}
		} else if (files.length == 0) {
			logger.info("���۵� ������ �����ϴ�. insert ����");
			return "/";
		} else {
			logger.info("�ִ� 10�� ����. insert ����");
			return "/";
		}
	}

	/* ���� ���� */
	// TODO : ������ �ش� ���̵��� ��� �����Ͱ� ������
	@RequestMapping(value = "/house-delete", method = RequestMethod.POST)
	public String delete(int houseNo, int memNo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		logger.info("���۹��� houseNo : " + houseNo);
		logger.info("���۹��� memNo : " + memNo);
		
		// ���� ����
		HttpSession session = req.getSession();
		int sessionMemNo = (int) session.getAttribute("memNo"); // ���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + sessionMemNo);


		if (sessionMemNo == memNo) {// ���۹��� memno�� ���ǿ����� memno�� ��ġ�ϸ� delete�� �����Ѵ�. 
			logger.info("���� ��ġ ���� ����");
			int result = houseService.delete(houseNo);
			if (result == 1) {
				logger.info("��������");
				//TODO : ���� ����
				try {
					String path = uploadPath + File.separator + "houseno" + houseNo;
					FileUploadUtil.delete(path);					
				} catch (Exception e) {
					e.printStackTrace();
					logger.info("mybatis ���� ����������, ���� ������ �����Ͽ����ϴ�.");
				}
			} else {
				logger.info("mybatis ��������");
			}
			return "/";
		} else {
			logger.info("������ ��ġ���� �ʽ��ϴ�.");
			return "/";
		}
	}

	
	@RequestMapping(value = "/display/{houseno}/{fileno:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(
			@PathVariable("houseno")  String houseno,
			@PathVariable("fileno")  String fileno)throws IOException {
		logger.info("display() houseno fileno ȣ��");
		logger.info("houseno : " + houseno);
		logger.info("fileno : " + fileno);
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + houseno + File.separator + fileno;
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		if(houseno != null) {
			 logger.info("filePath : " + filePath);
			in = new FileInputStream(filePath); // ��ΰ� null�� �ƴϸ� ���� �۾�			
		}else {
			logger.info("houseno ����");
			 filePath = uploadPath + File.separator + "noimage.jpg";
			in = new FileInputStream(filePath); // 		
		}
		
		// ���� ���(response header)�� Content-Type ����
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// ������ ����
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
				);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display() throws IOException {
		logger.info("display() noimage ȣ��");
		
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + "noimage.jpg";
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		
			logger.info("houseno ����");
			 
			in = new FileInputStream(filePath); // 		
		
		
		// ���� ���(response header)�� Content-Type ����
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// ������ ����
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
				);
		
		return entity;
	}
	@RequestMapping(value = "/display/{file:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@PathVariable("file") String file) throws IOException {
		logger.info("display() file ȣ��");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + file;
		
		
		// ���� Ȯ����
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
	
			 
			in = new FileInputStream(filePath); // 		
		
		
		// ���� ���(response header)�� Content-Type ����
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// ������ ����
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // ���Ͽ��� ���� ������
					httpHeaders, // ���� ���
					HttpStatus.OK // ���� �ڵ�
				);
		
		return entity;
	}
	
	

}
