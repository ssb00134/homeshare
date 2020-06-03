package edu.spring.homeshare.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HouseService houseService;

	@Autowired
	private BookService bookService;

	@Autowired
	private MemberService memberSeervice;

	@RequestMapping(value = "/main")
	public void adminMain() {
		logger.info("admin main ����");
	}

	@RequestMapping(value = "/crm")
	public void adminCrm() {
		logger.info("admin crm ����");
	}

	@RequestMapping(value = "/crm_result")
	public void adminCrmResult(Model model, Integer page, Integer prePage, HttpServletRequest req) {
		logger.info("admin crmResult ����");
		
		/*����¡ó��*/
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		
		if(page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		/*�Ķ���� ����*/
		String orderby = req.getParameter("orderby");
		model.addAttribute("orderby", orderby); //��޿� �Ķ����� ����
		
		/* map�� ���� �ֱ�*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		logger.info("end : " + c.getEnd());
		map.put("orderby", orderby);
		logger.info("map : " +map.toString());
		
		
		/*mybatis ����*/
		List<MemberVO> memberList = memberSeervice.readAllMemberOrderby(map);
		logger.info("memberList : " + memberList);
		
		
		
		model.addAttribute("memberList", memberList); //memberlist ������
		
		/* ����¡ ó�� */
		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(memberSeervice.totalCount());
		maker.setPageData();
		logger.info("maker : " + maker.toString());
		model.addAttribute("pageMaker", maker);
	}

}
