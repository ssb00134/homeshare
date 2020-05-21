package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;

@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="book-insert", method = RequestMethod.POST)
	public void BookInsertPost(
			BookVO vo,
			RedirectAttributes reAttr) {
		logger.info("book-insert 실행");
		int result = bookService.create(vo);
		if (result == 1) { // insert 성공
			logger.info("insert 성공");
		}
			
			
	}
}
