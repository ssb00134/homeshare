package edu.spring.homeshare.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;

@Controller
@RequestMapping(value="house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst() {
		logger.info("houselist get 실행");
	}
	
	@RequestMapping(value = "/house-list/all", method = RequestMethod.GET)
	public ResponseEntity<List<HouseVO>> HouseTest() {
		logger.info("loginGet() 호출");
		List<HouseVO> list = houseService.selectAll();
		for(int i=0; i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
		return new ResponseEntity<List<HouseVO>>(list,HttpStatus.OK);
	}
}
