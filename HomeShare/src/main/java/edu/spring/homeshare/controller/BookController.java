package edu.spring.homeshare.controller;

import java.util.ArrayList;
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

@Controller
@RequestMapping(value = "book")
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "/memberbook", method = RequestMethod.POST)
	public void memberbook(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		// 세션 memno 가져오기
		int bookMemNo = (int) session.getAttribute("memNo");
		logger.info("memno 세션값 : " + bookMemNo);

		List<BookVO> bookList = bookService.selectMemNo(bookMemNo);
		logger.info("list : " + bookList.toString());
		model.addAttribute("bookList", bookList);

		// 예약된 내용을 가져오고 해당 list의 housevo 정보 가져오기
		List<HouseVO> houseList = new ArrayList<HouseVO>();

		for (int i = 0; i < bookList.size(); i++) {
			houseList.add(houseService.selectByHouseNo(bookList.get(i).getBookHouseNo()));
			logger.info("houseList : " + houseList.get(i).toString());
		}
		model.addAttribute("houseList", houseList);
	}
	
	//숙소 호스트가 예약을 확인하는 매핑
	@RequestMapping(value = "/hostbook")
	public void hostbook(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		// 세션 memno 가져오기
		String hostId = (String) session.getAttribute("memId");
		logger.info("hostId 세션값 : " + hostId);

		List<BookVO> bookList = bookService.readByHostIdAcp(hostId);
		logger.info("booklist : " + bookList.toString());
		model.addAttribute("bookList", bookList);
		
		List<BookVO> LastBookList = bookService.readByHostIdAcpLast(hostId);
		logger.info("LastBookList : " + LastBookList.toString());
		model.addAttribute("bookListLast", LastBookList);
		
		// 예약된 내용을 가져오고 해당 list의 housevo 정보 가져오기
		List<HouseVO> houseList = new ArrayList<HouseVO>();
		for (int i = 0; i < bookList.size(); i++) {
			houseList.add(houseService.selectByHouseNo(bookList.get(i).getBookHouseNo()));
			logger.info("houseList : " + houseList.get(i).toString());
		}
		model.addAttribute("houseList", houseList);
	}


}
