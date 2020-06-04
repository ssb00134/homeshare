package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.ReportService;

@RestController
public class ReportRestController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRestContrller.class);
	
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private HouseService houseService;
	
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public void reprotGet(ReportVO vo,
			Model model,
			RedirectAttributes reAttr) {
		logger.info("reprot get 실행 " );
		logger.info(vo.toString());
	}
	
	@RequestMapping(value="/report/insert", method = RequestMethod.POST)
	public ResponseEntity<Integer> reprotPost(
			@RequestBody ReportVO vo,
			RedirectAttributes reAttr) {
		logger.info("reprot post 실행 " );
		logger.info(vo.toString());
		
		
		
		int result = reportService.create(vo);
		if(result==1) {
			logger.info("신고 접수 완료");
			reAttr.addFlashAttribute("insert_result", "success");
			
			/* house에 ReportCount 추가하기 */
//			HouseVO house = houseService.selectByHouseNo(vo.getReportHouseNo());
//			int reportCount = house.getReportCount(); // house의 신고 갯수 1 추가
//			house.setReportCount(reportCount + 1); //
//			logger.info("reportCount 신고횟수 1 증가 : " + reportCount );
			
			
		}else {
			logger.info("insert 실패");
			reAttr.addFlashAttribute("insert_result", "fail");
		}
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
}
