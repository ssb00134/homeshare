package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(
			HttpServletRequest req) {
		
		
		
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		int maxCapacity = Integer.parseInt(req.getParameter("maxCapacity"));
		logger.info("maxCapacity : " + maxCapacity);
		
		
		HashMap<String, Object>map = new HashMap<String, Object>();
				   
		map.put("location", location); 
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		logger.info("maptostring : " +map.toString());
		
		List<HouseVO> list = houseService.multySelect(map);
		logger.info(list.toString());
	}
}
