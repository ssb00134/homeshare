package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;

@RestController
public class BookRestController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="book-insert", method = RequestMethod.POST)
	public ResponseEntity<Integer>  BookInsertPost(
			@RequestBody BookVO vo) {
		logger.info("book-insert 실행");
		int result = bookService.create(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value="book-delete", method = RequestMethod.POST)
	public ResponseEntity<Integer>  BookDelete(
			@RequestBody BookVO vo) {
		logger.info("book-insert 실행");
		int result = bookService.create(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	
}
