package edu.spring.homeshare.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.domain.ReplyVO;
import edu.spring.homeshare.service.ReplyService;

@RestController
@RequestMapping(value="/replies")
public class ReplyRestContrller {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRestContrller.class);
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Integer> creatReply(
			@RequestBody ReplyVO vo){
		logger.info("create 실행 " );
		logger.info(vo.toString());
		int result = replyService.create(vo);
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value = "/all/{no}",
			method =RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> readReplies(
			@PathVariable("no") int houseNo){
		logger.info("reply read 실행 ");
		List<ReplyVO> list = replyService.read(houseNo);
		logger.info("list : " + list.toString());
		
		return new ResponseEntity<List<ReplyVO>>(list,HttpStatus.OK);
	};
	
	
	@RequestMapping(value = "/{no}", 
			method = RequestMethod.PUT)
	public ResponseEntity<String> updateReply(
			@PathVariable("no") int rno, 
			@RequestBody ReplyVO vo) {
		vo.setRno(rno);
		logger.info("put 실행");
		int result = replyService.update(vo);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;			
	}
	
	@RequestMapping(value="/{no}",method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(
			@PathVariable("no") int rno) {
		int result = replyService.delete(rno);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;			
	}
}
