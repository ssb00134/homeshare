package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.HomeController;

@Controller
@RequestMapping(value = "test")
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/websocket")
	public void webSocket() {
		logger.info("websocket 실행" );
	}
	
	@RequestMapping(value = "/sample")
	public void jusopopup() {
		logger.info("sample 실행" );
		
	}
	@RequestMapping(value = "/jusoPopup")
	public void jusopopup2() {
		logger.info("jusopopup 실행" );
	}
	
}
