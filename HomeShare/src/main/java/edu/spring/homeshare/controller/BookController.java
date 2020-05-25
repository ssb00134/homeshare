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

	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public void list2(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		// 세션 memno 가져오기
		int bookMemNo = (int) session.getAttribute("memNo");
		logger.info("memno 세션값 : " + bookMemNo);

		List<BookVO> bookList = bookService.selectMemNo(bookMemNo);
		logger.info("list : " + bookList.toString());
		model.addAttribute("bookList", bookList);

		// 예약된 내용을 가져오고 해당 list의 housevo 정보 가져오기
		List<HouseVO> houseList = new ArrayList<HouseVO>();
		logger.info("첫번째 예약번호의 하우스번호 : " + bookList.get(0).getBookHouseNo());
		for (int i = 0; i < bookList.size(); i++) {
			houseList.add(houseService.selectByHouseNo(bookList.get(i).getBookHouseNo()));
			logger.info("houseList : " + houseList.get(i).toString());
		}
		model.addAttribute("houseList", houseList);
	}

	@RequestMapping(value = "/hostbook", method = RequestMethod.POST)
	public void hostbook(Model model, HttpServletRequest request) { // 호스트에 예약된 리스트

		// 세션에서 아이디, memNo 가져오기
		HttpSession session = request.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		if (sessionMemId != null) {
			int memNo = (int) session.getAttribute("memNo");
			List<HouseVO> houseList = houseService.selectAllByMemNO(memNo);
			logger.info("houseList : " + houseList.toString());
			model.addAttribute("houseList", houseList);

			// *내가 host하는 목록중에서 누군가가 예약했을때

			List<BookVO> bookList = null;
			for (int i = 0; i < houseList.size(); i++) {
				int houseNo = houseList.get(i).getHouseNo();
				bookList = bookService.selectHouseNo(houseNo);
			}
			model.addAttribute("bookList", bookList);

		} else {
			logger.info("세션이 없습니다. 로그인 해주세요");
		}

	}

}
