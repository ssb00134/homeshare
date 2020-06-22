package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;
import edu.spring.homeshare.service.ReportService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HouseService houseService;

	@Autowired
	private BookService bookService;

	@Autowired
	private MemberService memberSeervice;
	
	@Autowired
	private ReportService reportService;

	@RequestMapping(value = "/main")
	public void adminMain() {
		logger.info("admin main 실행");
		
	}

	

	@RequestMapping(value = "/housemanagement")
	public void hostManagement() {
		logger.info("hostmanagement  실행");
	}
	/* 단일검색 */
	@RequestMapping(value = "/housemanagement_result/{option}/{number}")
	public void hostManagementResult(
			Model model, Integer page, Integer prePage, HttpServletRequest req,
			@RequestParam("option") String option,
			@RequestParam(value = "number", defaultValue ="0") Integer number) {
		logger.info("hostmanagement_result  실행");
		
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
		logger.info("option : " + option);
		logger.info("number : " + number);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		map.put("number", number);
		logger.info("maptostring : " + map.toString());

		List<HouseVO> houseList = houseService.readSingle(map);
		logger.info("list 정보 : " + houseList.toString());
		model.addAttribute("houseList", houseList);
	}
	
	@RequestMapping(value = "/housemanagement_result")
	public void housemanagement_result(
			Model model, 
			Integer page, 
			Integer prePage,
			HttpServletRequest req
			) {
		logger.info("관리자 페이지 다중 검색 실행");
		
		
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
		String bookableDateBegin = req.getParameter("bookableDateBegin");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("bookableDateEnd");
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
	
	
	
	@RequestMapping(value = "/crm")
	public void adminCrm() {
		logger.info("admin crm 실행");
	}
	
	@RequestMapping(value = "/crm_result")
	public void adminCrmResult(Model model, Integer page, Integer prePage, HttpServletRequest req,
			String memId, String guestId) {
		logger.info("admin crmResult 실행");
		logger.info("memId : " + memId);
		
		
		if(!(memId==null)) {
			logger.info("memId selected");
			MemberVO membervo = memberSeervice.select(memId);
			logger.info("membervo : " + membervo);
			model.addAttribute("membervo", membervo);
		}
	}
	
	
	
	
	
	
	
	
	//bookmanagement
	/*------------------------------------------------------*/
	@RequestMapping(value = "/bookmanagement")
	public void bookManagement() {
		logger.info("bookablemenagement 실행 " );
	}
	
	@RequestMapping(value = "/bookmanagement_result")
	public void bookManagementResult(HttpServletRequest request, Model model, Integer page, Integer prePage
			,String hostId, String guestId, String selected) {
		HttpSession session = request.getSession();
		
		logger.info("bookmanagement_result 실행");
		logger.info("selected : " + selected);
		
		
		
		
		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		if(selected=="guestId") {
logger.info("guestId 입력받음");
			
			model.addAttribute("selected","guestId");
			model.addAttribute("selected","guestId");
			
			/* hash맵에 정보 넣기 */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookGuestId", guestId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByGuestId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByGuestId(guestId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("전체 하우스 수 : " + maker.getTotalCount());
			logger.info("현재 선택된 페이지 : " + c.getPage());
			logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
			logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
			logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
			
			
		}else {
			logger.info("hostId 입력받음");
			
			model.addAttribute("selected","hostId");
			
			
			/* hash맵에 정보 넣기 */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookHostId", hostId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByHostId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByHostId(hostId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("전체 하우스 수 : " + maker.getTotalCount());
			logger.info("현재 선택된 페이지 : " + c.getPage());
			logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
			logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
			logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
			
			
		}
		
		if(hostId == "" ) {
			logger.info("guestId 입력받음");
			
			model.addAttribute("selected","guestId");
			
			/* hash맵에 정보 넣기 */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookGuestId", guestId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByGuestId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByGuestId(guestId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("전체 하우스 수 : " + maker.getTotalCount());
			logger.info("현재 선택된 페이지 : " + c.getPage());
			logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
			logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
			logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
			
			
			
			
			
			
			
		}else if(guestId == "" || selected=="hostId"){
			logger.info("hostId 입력받음");
			
			model.addAttribute("selected","hostId");
			
			
			/* hash맵에 정보 넣기 */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookHostId", hostId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByHostId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByHostId(hostId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("전체 하우스 수 : " + maker.getTotalCount());
			logger.info("현재 선택된 페이지 : " + c.getPage());
			logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
			logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
			logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
		}
		
		
		
		
	
	}
	
	
	/*------------------------------------report---------------------------------------------*/
	@RequestMapping("/reportmanagement")
	public void report() {
		logger.info("report 실행");
	}
	@RequestMapping("/reportmanagement_result")
	public void reportResult(
			Model model, 
			String reportHostId,
			HttpServletRequest request,
			ReportVO vo) {
		
		logger.info("reportHostId 실행");
		logger.info("reportHostId : " + reportHostId);
		model.addAttribute("reportHostId", reportHostId);
	}
	
	
}
