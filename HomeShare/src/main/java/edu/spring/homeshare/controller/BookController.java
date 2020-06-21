package edu.spring.homeshare.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value = "book")
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookService bookService;
	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "/memberbook")
	public void memberbook(HttpServletRequest request, Model model, Integer page, Integer prePage) {

		HttpSession session = request.getSession();

		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		
		
		// 세션 memno 가져오기
		String guestId = (String) session.getAttribute("memId");
		logger.info("guestId 세션값 : " + guestId);
		
		
		/* hash맵에 정보 넣기 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookGuestId", guestId);
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		logger.info("map : " +map.toString() );
		
		
		
		List<BookVO> bookListPaging = bookService.readByGuestId(map);
		logger.info("bookListPaging" + bookListPaging.toString());
		model.addAttribute("bookListPaging",bookListPaging);
		
		

		
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(bookService.getCountByGuestId(guestId));
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		
		
		logger.info("전체 예약 수 : " + maker.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
		logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());

		
		
	}
	
	//숙소 호스트가 예약을 확인하는 매핑
	@RequestMapping(value = "/hostbook")
	public void hostbook(HttpServletRequest request, Model model, Integer page, Integer prePage) {
		
		HttpSession session = request.getSession();

		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		
		
		// 세션 memno 가져오기
		String hostId = (String) session.getAttribute("memId");
		logger.info("hostId 세션값 : " + hostId);
		
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
