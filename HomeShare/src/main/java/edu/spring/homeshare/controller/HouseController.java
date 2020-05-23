package edu.spring.homeshare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.FileUploadUtil;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value = "house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst(Model model, Integer page, Integer prePage, HttpServletRequest req) {
		logger.info("houselist get ����");

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
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		logger.info("maptostring : " + map.toString());

		List<HouseVO> list = houseService.multySelect(map);
		logger.info("list ���� : " + list.toString());
		model.addAttribute("houseList", list);

		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		/* ���� ������ ���� */
		int seqence = houseService.seqence();
		logger.info("���� ������ : " + seqence);

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

	/* insert ���� */

	// ���ҵ��
	@RequestMapping(value = "/house-insert", method = RequestMethod.GET)
	public void houseInsertGet() {
		logger.info("house-insert get ����");
	}

	@RequestMapping(value = "/house-insert-post", method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo, MultipartFile[] files, RedirectAttributes reAttr) throws IOException {
		logger.info("house-insert-post ����");
		logger.info(vo.toString());

		if (files.length > 0 || files.length < 11) {
			logger.info("inset ����");
			int result = 0;
			result = houseService.create(vo);
			if (result == 0) {
				logger.info("insert ����");
				return "/";
			} else {
				//TODO : �������� ���� ������ ������ ����ó�� �Ұ�
				logger.info("insert ����");
				logger.info("insert ��� houseNo : " + result);
				String fileResult = null;
				logger.info("���Ͼ��ε� ����");
				for (MultipartFile f : files) {
					fileResult = FileUploadUtil.saveUploadedFile(uploadPath, "houseno" + result,
							f.getOriginalFilename(), f.getBytes());
					logger.info("���ε� ��� fileResult : " + fileResult);
					return "/";
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

		// ���� ����
		HttpSession session = req.getSession();
		int sessionMemNo = (int) session.getAttribute("memNo"); // ���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " + sessionMemNo);

		PrintWriter out = res.getWriter();

		if (sessionMemNo == memNo) {// ������ ��ġ�ϸ�
			logger.info("���� ����");
			int result = houseService.delete(houseNo);
			if (result == 1) {
				logger.info("��������");
			} else {
				logger.info("��������");
			}
			return "/";
		} else {
			logger.info("������ ��ġ���� �ʽ��ϴ�.");
			return "/";
		}
	}

}
