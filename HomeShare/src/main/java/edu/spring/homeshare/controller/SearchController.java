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
import edu.spring.homeshare.service.ReplyService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HouseService houseService;
	
	@Autowired
	private ReplyService replyService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(HttpServletRequest req, Model model, Integer page, Integer prePage) {

		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}

		/* 파라미터 지정 */
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		String maxCapacity = req.getParameter("maxCapacity");
		logger.info("maxCapacity : " + maxCapacity);

		/* hash맵에 정보 넣기 */
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		logger.info("maptostring : " + map.toString());

	
		
		List<HouseVO> list = houseService.multySelect(map);
		
		/* score에 리플 병균값 넣기*/
		//test
		logger.info("list 0 의 houseno : " + list.get(0).getHouseNo());
		int score2 = replyService.readAvgScore(list.get(0).getHouseNo());
		logger.info("test score : " + score2);
		
		int[] score =  new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			logger.info("list에서 받은 houseNo : " + list.get(i).getHouseNo());
			score[i] = replyService.readAvgScore(list.get(i).getHouseNo());
			logger.info("score  : " + (Integer)score[i]);
			list.get(i).setScore(score[i]);
			logger.info("list : " + list.toString());
		}
		
		
		logger.info("list 정보 : " + list.toString());
		logger.info("list 갯수 : " + list.size());
		model.addAttribute("houseList",list);
		
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords(map));
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		/* 현재 시퀀스 보기*/
		int seqence = houseService.seqence();
		logger.info("현재 시퀀스 : "  +seqence);
		
		logger.info("전체 하우스 수 : " + maker.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
		logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());


	}
}
