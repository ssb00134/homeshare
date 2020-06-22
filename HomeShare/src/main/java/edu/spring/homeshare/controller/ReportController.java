package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		logger.info("report-list ȣ��");
		/* ����¡ ó�� */
		PageCriteria c = new PageCriteria();
		c.setNumsPerPage(9); //9���� ���
		
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
		
		
		logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
		logger.info("���� ���õ� ������ : " + c.getPage());
		logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
		logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
		logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
		
		
		
		
	}
}
