package edu.spring.homeshare.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.ReportService;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyRestContrller.class);
	
	
	@Autowired
	private ReportService reportService;
	
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public void reprotGet(ReportVO vo,
			Model model,
			RedirectAttributes reAttr) {
		logger.info("reprot get 실행 " );
		logger.info(vo.toString());
	}
	
	@RequestMapping(value="/report", method = RequestMethod.POST)
	public String reprotPost(
			ReportVO vo,
			RedirectAttributes reAttr) {
		logger.info("reprot post 실행 " );
		logger.info(vo.toString());
		int result = reportService.create(vo);
		if(result==1) {
			logger.info("신고 접수 완료");
			reAttr.addFlashAttribute("insert_result", "success");
		}else {
			logger.info("insert 실패");
			reAttr.addFlashAttribute("insert_result", "fail");
		}
		return "redirect:/";
	}
}
