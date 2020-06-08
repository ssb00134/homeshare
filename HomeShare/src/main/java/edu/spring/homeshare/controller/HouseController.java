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

	// TODO : 삭제된 값이 리스트에 남아있음
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst(Model model, Integer page, Integer prePage, HttpServletRequest req) {
		logger.info("houselist get 실행");

		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);

		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}

		/* 파라미터 지정 */
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		String maxCapacity = req.getParameter("maxCapacity");
		logger.info("maxCapacity : " + maxCapacity);

		/* hash맵에 정보 넣기 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		logger.info("maptostring : " + map.toString());

		List<HouseVO> list = houseService.multySelect(map);
		logger.info("list 정보 : " + list.toString());
		model.addAttribute("houseList", list);

		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		

		logger.info("전체 하우스 수 : " + maker.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
		logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
	}

	/* location 검색 실행 */

	/* house-detail 메핑 */
	@RequestMapping(value = "/house-detail", method = RequestMethod.GET)
	public void readHouse(int houseNo, Model model, @ModelAttribute("criteria") PageCriteria criteria) {
		logger.info("house-detail 실행 " + houseNo);
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
		model.addAttribute("houseVO", vo);
	}

	/* 호스팅 메핑 */
	@RequestMapping(value = "/host", method = RequestMethod.POST)
	public void Housting(Model model, HttpServletRequest req) {
		logger.info("hosting 실행 ");

		// 세션에서 아이디, memNo 가져오기
		HttpSession session = req.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		if (sessionMemId != null) {
			int memNo = (int) session.getAttribute("memNo");
			List<HouseVO> list = houseService.selectAllByMemNO(memNo);
			logger.info("list : " + list.toString());
			model.addAttribute("list", list);

		} else {
			logger.info("세션이 없습니다. 로그인 해주세요");
		}
	}

	/* list all 모든 정보 보기 */
	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	public void listAll(Model model) {
		List<HouseVO> list = houseService.selectAll();
		model.addAttribute("list", list);
		logger.info("list : " + list.toString());
	}

	/* insert 메핑 */
	// 숙소등록
	@RequestMapping(value = "/house-insert", method = RequestMethod.GET)
	public void houseInsertGet(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionMemNo = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		logger.info("세션 아이디 : " + sessionMemNo);
		logger.info("house-insert get 실행");
	}

	@RequestMapping(value = "/house-insert-post", method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo, MultipartFile[] files, RedirectAttributes reAttr) throws IOException {
		logger.info("house-insert-post 실행");
		logger.info(vo.toString());

		if (files.length > 0 || files.length < 11) {
			logger.info("inset 실행");
			logger.info("파일 갯수 : " + files.length);
			
			

			int result = houseService.create(vo);
			if (result == 0) {
				logger.info("insert 실패");
				return "/";
			} else {
				// TODO : 시퀸스가 같은 폴더가 있을때 예외처리 할것
				logger.info("insert 성공");
				logger.info("insert 결과 houseNo : " + result);
				String fileResult = null;
				logger.info("파일업로드 시작");
				for (MultipartFile f : files) {
					// 업로드하기
					fileResult = FileUploadUtil.saveUploadedFile(uploadPath, "houseno" + result,
							f.getOriginalFilename(), f.getBytes());
					logger.info("업로드 결과 fileResult : " + fileResult);
				}
				// 디렉토리 읽어오기
				String path = uploadPath + File.separator + "houseno" + result;
				String filePath = FileUploadUtil.readDirectory(path);

				logger.info("filePath" + filePath);

				// vo에 파일패스 업데이트하기
				logger.info("result (houseno) : " + result);
				String[] sep = filePath.split(",");
				String totalPath = "";
				for (int i = 0; i < sep.length; i++) {
					totalPath += "houseno" + result + File.separator + sep[i] + ",";
				}

				vo.setImage(totalPath); // 경로 + 파일
				vo.setHouseNo(result); // result == 현재 시퀸스값
				logger.info("업데이트전 vo : " + vo.toString());

				int updateResult = houseService.update(vo);
				if (updateResult == 1) {
					logger.info("업데이트 후 vo : " + vo.toString());
					logger.info("사진주소를 업데이트 하였습니다.");
				} else {
					logger.info("사진주소 업데이트에 실패 하였습니다.");
				}

				return "/";
			}
		} else if (files.length == 0) {
			logger.info("전송된 파일이 없습니다. insert 실패");
			return "/";
		} else {
			logger.info("최대 10개 파일. insert 실패");
			return "/";
		}
	}

	/* 삭제 메핑 */
	// TODO : 삭제시 해당 아이디의 모든 데이터가 삭제됨
	@RequestMapping(value = "/house-delete", method = RequestMethod.POST)
	public String delete(int houseNo, int memNo, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		logger.info("전송받은 houseNo : " + houseNo);
		logger.info("전송받은 memNo : " + memNo);
		
		// 세션 설정
		HttpSession session = req.getSession();
		int sessionMemNo = (int) session.getAttribute("memNo"); // 세션에서 아이디 가져오기
		logger.info("세션값 : " + sessionMemNo);


		if (sessionMemNo == memNo) {// 전송받은 memno와 세션에서의 memno가 일치하면 delete를 실행한다. 
			logger.info("세션 일치 삭제 실행");
			int result = houseService.delete(houseNo);
			if (result == 1) {
				logger.info("삭제성공");
				//TODO : 폴더 삭제
				try {
					String path = uploadPath + File.separator + "houseno" + houseNo;
					FileUploadUtil.delete(path);					
				} catch (Exception e) {
					e.printStackTrace();
					logger.info("mybatis 삭제 성공했으나, 폴더 삭제엔 실패하였습니다.");
				}
			} else {
				logger.info("mybatis 삭제실패");
			}
			return "/";
		} else {
			logger.info("세션이 일치하지 않습니다.");
			return "/";
		}
	}

	
	@RequestMapping(value = "/display/{houseno}/{fileno:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(
			@PathVariable("houseno")  String houseno,
			@PathVariable("fileno")  String fileno)throws IOException {
		logger.info("display() houseno fileno 호출");
		logger.info("houseno : " + houseno);
		logger.info("fileno : " + fileno);
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + houseno + File.separator + fileno;
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		if(houseno != null) {
			 logger.info("filePath : " + filePath);
			in = new FileInputStream(filePath); // 경로가 null이 아니면 정상 작업			
		}else {
			logger.info("houseno 없음");
			 filePath = uploadPath + File.separator + "noimage.jpg";
			in = new FileInputStream(filePath); // 		
		}
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}
	
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display() throws IOException {
		logger.info("display() noimage 호출");
		
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + "noimage.jpg";
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
				
		
			logger.info("houseno 없음");
			 
			in = new FileInputStream(filePath); // 		
		
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}
	@RequestMapping(value = "/display/{file:.+}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(
			@PathVariable("file") String file) throws IOException {
		logger.info("display() file 호출");
		
		ResponseEntity<byte[]> entity = null;
		InputStream in = null;
		String  filePath = uploadPath + File.separator + file;
		
		
		// 파일 확장자
				String extension = 
						filePath.substring(filePath.lastIndexOf(".") + 1);
	
			 
			in = new FileInputStream(filePath); // 		
		
		
		// 응답 헤더(response header)에 Content-Type 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaUtil.geMediaType(extension));

		// 데이터 전송
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), // 파일에서 읽은 데이터
					httpHeaders, // 응답 헤더
					HttpStatus.OK // 응답 코드
				);
		
		return entity;
	}
	
	

}
