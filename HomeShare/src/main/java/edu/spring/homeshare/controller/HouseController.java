package edu.spring.homeshare.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value="house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst(HttpServletRequest request) {
		logger.info("houselist get 실행");
		List<HouseVO> list = houseService.selectAll();

		/*페이징 처리*/
		PageCriteria c = new PageCriteria();
		String page = request.getParameter("page");
		logger.info("page : " + page);
		if(page !=null) {
			c.setPage(Integer.parseInt(page));
		}
		
		PageMaker m = new PageMaker();
		m.setCriteria(c);
		int totalCount = list.size();
		m.setTotalCount(totalCount);
		m.setPageData();
		
		logger.info("전체 하우스 수 : " + m.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호 : " + m.getStartPageNo());
		logger.info("끝 페이지 링크 번호 : " + m.getEndPageNo());
		
		request.setAttribute("startNum", m.getStartPageNo());
		
		request.setAttribute("pageMaker", m);
		request.setAttribute("boardList", list);

	}
	
	@RequestMapping(value = "/house-list/all", method = RequestMethod.GET)
	public ResponseEntity<List<HouseVO>> HouseTest(HttpServletRequest request) {
		logger.info("loginGet() 호출");
		List<HouseVO> list = houseService.selectAll();
		for(int i=0; i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
		
		
		return new ResponseEntity<List<HouseVO>>(list,HttpStatus.OK);
		
	}
	
	/*house-detail 메핑*/
	@RequestMapping(value="/house-detail",method = RequestMethod.GET)
	public void readHouse(
			int houseNo,
			Model model) {
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
		model.addAttribute("houseVO", vo);
	}
}
