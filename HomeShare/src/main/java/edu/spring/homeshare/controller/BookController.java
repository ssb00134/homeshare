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
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/member-booklist", method = RequestMethod.GET)
	public void list(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		// 세션 memno 가져오기
		int bookMemNo = (int) session.getAttribute("memNo");
		logger.info("memno 세션값 : " + bookMemNo);

		
		List<BookVO> bookList = bookService.selectMemNo(bookMemNo);
		logger.info("list : " + bookList.toString());
		model.addAttribute("booklist", bookList);
		
		
		//예약된 내용을 가져오고 해당 list의 housevo 정보 가져오기
		List<HouseVO> houseList = new ArrayList<HouseVO>();
		logger.info("첫번째 예약번호의 하우스번호 : " + bookList.get(0).getBookHouseNo());
		for(int i=0; i<bookList.size(); i++) {
			houseList.add(houseService.selectByHouseNo( bookList.get(i).getBookHouseNo()));
			logger.info("houseList : " + houseList.get(i).toString() );
		}
		model.addAttribute("houseList", houseList);
		

	}

}
