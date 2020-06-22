package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.service.MemberService;
import edu.spring.homeshare.service.ReplyService;

@RestController
@RequestMapping(value = "/member")
public class memberRestController {
	private static final Logger logger = LoggerFactory.getLogger(memberRestController.class);
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping(value = "/{memId}",method = RequestMethod.DELETE)
	public ResponseEntity<Integer> deleteMember(@PathVariable("memId") String memId) {
		logger.info("member delete ½ÇÇà");
		
		int result = memberService.delete(memId);
		
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
}
