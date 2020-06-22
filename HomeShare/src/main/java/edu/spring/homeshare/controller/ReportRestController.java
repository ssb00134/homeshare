package edu.spring.homeshare.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReplyVO;
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
	
	
	@RequestMapping(value="/report/all/{reportHostId}")
	public ResponseEntity<List<ReportVO>> reprotGet(@PathVariable("reportHostId") String reportHostId) {
		logger.info("reprot get ���� " );
		List<ReportVO> reportList = reportService.read(reportHostId);
		logger.info("reportList : " + reportList);
		
		return new ResponseEntity<List<ReportVO>>(reportList, HttpStatus.OK);
	}
	
	
	
	
	
	@RequestMapping(value="/report/insert", method = RequestMethod.POST)
	public ResponseEntity<Integer> reprotPost(
			@RequestBody ReportVO vo,
			RedirectAttributes reAttr) {
		logger.info("reprot post ���� " );
		logger.info(vo.toString());
			
		
		int result = reportService.create(vo);
		if(result==1) {
			logger.info("�Ű� ���� �Ϸ�");
			reAttr.addFlashAttribute("insert_result", "success");
			
			/* house�� ReportCount �߰��ϱ� */
			HouseVO housevo = houseService.selectByHouseNo(vo.getReportHouseNo());
			int reportCount = housevo.getReportCount();
			housevo.setReportCount(reportCount + 1); // report 1 ����
			int updateResult = houseService.update(housevo);
			if(updateResult==1) {
				logger.info("�Ű� Ƚ�� 1 ���� " );
			}else {
				logger.info("������Ʈ ����");
			}
			
		}else {
			logger.info("insert ����");
			reAttr.addFlashAttribute("insert_result", "fail");
		}
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value = "report/{reportNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReport(@PathVariable("reportNo") int reportNo){
		logger.info("report delete ����");
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
