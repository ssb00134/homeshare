package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.PageCriteria;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(
			HttpServletRequest req,
			Model model, Integer page, Integer prePage) {	
		
		/*페이징 처리*/
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if(page !=null) {
			c.setPage(page);
		}
		if(prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		
		/*파라미터 지정*/
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		int maxCapacity = Integer.parseInt(req.getParameter("maxCapacity"));
		logger.info("maxCapacity : " + maxCapacity);
		
		/*hash맵에 정보 넣기*/
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("location", location); 
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		logger.info("maptostring : " +map.toString());
		
		List<HouseVO> list = houseService.multySelect(map);
		logger.info(list.toString());
	}
}
