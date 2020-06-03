package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HouseService houseService;

	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberSeervice;
	
	
	
	@RequestMapping(value = "/main")
	public void adminMain() {
		logger.info("admin main 실행" );
	}
	
	@RequestMapping(value = "/crm")
	public void adminCrm() {
		logger.info("admin crm 실행" );
	}
	
	@RequestMapping(value = "/crm_result")
	public void adminCrmResult() {
		logger.info("admin crmResult 실행" );
	}
	
}
