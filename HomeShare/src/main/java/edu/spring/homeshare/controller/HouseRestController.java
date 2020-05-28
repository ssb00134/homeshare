package edu.spring.homeshare.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;

@RestController
@RequestMapping(value = "/house")
public class HouseRestController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value="/ishost/{no}" )
	public ResponseEntity<List<Integer>> isHost(
			@PathVariable("no") int memNo){
		logger.info("isHost 실행 " );
		logger.info("memNo : " +memNo);
		List<HouseVO> list = houseService.selectAllByMemNO(memNo);
		
		List<Integer> houseNoList = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++) {
			houseNoList.add(list.get(i).getHouseNo());
		}
		
		logger.info("list : " + list);
		logger.info("houseNoList : " + houseNoList);
		//count 가 0 이면 host가 아님
		return new ResponseEntity<List<Integer>>(houseNoList,HttpStatus.OK);
	}
	

}
