package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRestContrller.class);
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public void reprotGet() {
		logger.info("reprot get 실행 " );
	}
	
	@RequestMapping(value="/report", method = RequestMethod.POST)
	public void reprotPost() {
		logger.info("reprot get 실행 " );
	}
}
