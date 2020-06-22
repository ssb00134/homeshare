package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.service.ReportService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value="report")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/report-list/{houseNo}" )
	public void reportList(
			@PathVariable("houseNo") int houseNo, 
			HttpServletRequest req, Model model, Integer page, Integer prePage) {
		logger.info("report-list 호출");
		/* 페이징 처리 */
		PageCriteria c = new PageCriteria();
		
		
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		map.put("houseNo", houseNo);
		
		List<ReportVO> reportList = reportService.read(map);
		logger.info("reportList : " + reportList.toString());
		model.addAttribute("reportList",reportList);
		
		
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(reportService.getCountByHouseNo(houseNo));
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
		
		
		logger.info("전체 하우스 수 : " + maker.getTotalCount());
		logger.info("현재 선택된 페이지 : " + c.getPage());
		logger.info("한 페이지 당 게시글 수 : " + c.getNumsPerPage());
		logger.info("시작 페이지 링크 번호(startPageNO) : " + maker.getStartPageNo());
		logger.info("끝 페이지 링크 번호(endPageNo) : " + maker.getEndPageNo());
		
	}
	
	@RequestMapping(value = "/{reportNo}/", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReport(@PathVariable("reportNo") int reportNo) {
		logger.info("report delete 실행");
		logger.info("reportno : " + reportNo);
		
		int result = reportService.delete(reportNo);
		ResponseEntity<String> entity = null;
		if (result == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		return entity;
	}

		
	
}
