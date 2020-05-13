package edu.spring.homeshare;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/test")
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/kakao-api-test", method = RequestMethod.GET)
	public void kakaoTest() {
		logger.info("kakao api ȣ��");
	}
	@RequestMapping(value="/scroll-test",method = RequestMethod.GET)
	public void scrollTest() {
		logger.info("scroll-test get ����");
	}
}
