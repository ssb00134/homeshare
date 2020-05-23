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
		
		/* 현재 시퀀스 보기*/
		int seqence = houseService.seqence();
		logger.info("현재 시퀀스 : "  +seqence);

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

	/* insert 메핑 */

	// 숙소등록
	@RequestMapping(value = "/house-insert", method = RequestMethod.GET)
	public void houseInsertGet() {
		logger.info("house-insert get 실행");
	}

	@RequestMapping(value = "/house-insert-post", method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo,MultipartFile[] files, RedirectAttributes reAttr) throws IOException {
		logger.info("house-insert-post 실행");
		logger.info(vo.toString());
		
		String result= null; // 업로드 실행 결과 초기값 실패
		
		result = Integer.toString(houseService.create(vo));
		//시퀀스 테스트
		logger.info("result : " + result);
		return result;
		
		
		
		
		
//		//파일 업로드
//		String fileResult=null;	
//		String NextHouseNo = Integer.toString(houseService.seqence()+1); //houseNo의 최대값 -> 시퀸스
//		logger.info("다음 시퀀스 : " + NextHouseNo);
//		for (MultipartFile f : files) {
//			fileResult =  FileUploadUtil.saveUploadedFile(
//					uploadPath, "houseno" + NextHouseNo,
//					f.getOriginalFilename(), 
//					f.getBytes());
//			logger.info("fileResult : " + fileResult);
//		}
//		
//		if(FileUploadUtil.countFile(uploadPath, "houseno" + NextHouseNo)<20) {
//			//만약 저장된 파일의 갯수가 10개 이하일 경우 create실행
//			result = houseService.create(vo);
//		}
//		
//		//end 파일업로드
//		
//		if(files.length==0) {
//			logger.info("전송된 파일이 없습니다.");
//			result =0;
//		}
//		
//		if (result == 1) { // insert 성공
//			logger.info("insert 성공");
//			//TODO : 다음시퀀스 폴더를 생성한다.
//			reAttr.addFlashAttribute("insert_result", "success");
//			return "/";
//		} else {
//			logger.info("insert 실패");
//			reAttr.addFlashAttribute("insert_result", "fail");
//			//TODO : 실패시 폴더 지워야함
//			return "/mail";
//		}
	}
	
	
	

	/* 삭제 메핑 */
	@RequestMapping(value = "/house-delete", method = RequestMethod.POST)
	public String delete(int houseNo, int memNo, HttpServletRequest req, HttpServletResponse res) throws IOException {

		// 세션 설정
		HttpSession session = req.getSession();
		int sessionMemNo = (int) session.getAttribute("memNo"); // 세션에서 아이디 가져오기
		logger.info("세션값 : " + sessionMemNo);
		
		PrintWriter out = res.getWriter();
		
		if (sessionMemNo == memNo) {// 세션이 일치하면
			logger.info("삭제 실행");
			int result = houseService.delete(houseNo);
			if (result == 1) {
				logger.info("삭제성공");
			} else {
				logger.info("삭제실패");
			}
			return "/";
		} else {
			logger.info("세션이 일치하지 않습니다.");
			return "/";
		}
	}

}
