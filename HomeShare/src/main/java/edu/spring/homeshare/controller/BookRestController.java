package edu.spring.homeshare.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.service.BookService;

@RestController
@RequestMapping(value = "/book")
public class BookRestController {

	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/insert",method = RequestMethod.POST)
	public ResponseEntity<Integer>  creatBook(
			@RequestBody BookVO vo) {
		logger.info("book-insert 실행");
		logger.info("bookVo 정보 : " + vo.toString());
		int result = bookService.create(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	//호스트에 등록된 모든 정보를 가져오는 메핑
	@RequestMapping(value="/all/{no}", method = RequestMethod.GET )
	public ResponseEntity<List<BookVO>>  bookList(
			@PathVariable("no") int houseNo ) {
		logger.info("host all 실행 호스트가 예약을 가져옴");
		logger.info("houseNo : " +houseNo);
		List<BookVO> list = bookService.selectHouseNo(houseNo);
		return new ResponseEntity<List<BookVO>>(list,HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value = "/bookmember/{no}", 
			method = RequestMethod.GET)
	public ResponseEntity<List<BookVO>> books(
			@PathVariable("no") int memNo) {
		List<BookVO> list = bookService.selectMemNo(memNo);
		return new ResponseEntity<List<BookVO>>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{no}", 
			method = RequestMethod.PUT)
	public ResponseEntity<String> updateBook(
			@PathVariable("no") int bookNo,
			@RequestBody BookVO vo){
		logger.info("put 실행");
		vo.setBookNo(bookNo);
		logger.info("vo " + vo.toString());
		int result = bookService.update(vo);
		ResponseEntity<String> entity = null;
		if(result == 1) {
			logger.info("업데이트 성공");
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			logger.info("업데이트 실패");
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}
	
	
	
	
	@RequestMapping(value="book-delete", method = RequestMethod.POST)
	public ResponseEntity<Integer>  BookDelete(
			@RequestBody BookVO vo) {
		logger.info("book-insert 실행");
		int result = bookService.create(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	
}
