package edu.spring.homeshare.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.spring.homeshare.HomeController;
import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;
import edu.spring.homeshare.service.ReportService;
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
	
	@Autowired
	private ReportService reportService;

	@RequestMapping(value = "/main")
	public void adminMain() {
		logger.info("admin main ����");
		
	}

	

	@RequestMapping(value = "/housemanagement")
	public void hostManagement() {
		logger.info("hostmanagement  ����");
	}
	/* ���ϰ˻� */
	@RequestMapping(value = "/housemanagement_result/{option}/{number}")
	public void hostManagementResult(
			Model model, Integer page, Integer prePage, HttpServletRequest req,
			@RequestParam("option") String option,
			@RequestParam(value = "number", defaultValue ="0") Integer number) {
		logger.info("hostmanagement_result  ����");
		
		/* ����¡ ó�� */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		/* �Ķ���� ���� */
		logger.info("option : " + option);
		logger.info("number : " + number);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		map.put("number", number);
		logger.info("maptostring : " + map.toString());

		List<HouseVO> houseList = houseService.readSingle(map);
		logger.info("list ���� : " + houseList.toString());
		model.addAttribute("houseList", houseList);
	}
	
	@RequestMapping(value = "/housemanagement_result")
	public void housemanagement_result(
			Model model, 
			Integer page, 
			Integer prePage,
			HttpServletRequest req
			) {
		logger.info("������ ������ ���� �˻� ����");
		
		
		/* ����¡ ó�� */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);

		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		/* �Ķ���� ���� */
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("bookableDateBegin");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("bookableDateEnd");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		String maxCapacity = req.getParameter("maxCapacity");
		logger.info("maxCapacity : " + maxCapacity);

		/* hash�ʿ� ���� �ֱ� */
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start", c.getStart());
		map.put("end", c.getEnd());
		logger.info("maptostring : " + map.toString());

		List<HouseVO> list = houseService.multySelect(map);
		logger.info("list ���� : " + list.toString());
		model.addAttribute("houseList", list);

		PageMaker maker = new PageMaker();
		maker.setCriteria(c);
		maker.setTotalCount(houseService.getToTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);

		

		logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
		logger.info("���� ���õ� ������ : " + c.getPage());
		logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
		logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
		logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
	}
	
	
	
	@RequestMapping(value = "/crm")
	public void adminCrm() {
		logger.info("admin crm ����");
	}
	
	@RequestMapping(value = "/crm_result")
	public void adminCrmResult(Model model, Integer page, Integer prePage, HttpServletRequest req,
			MemberVO vo) {
		logger.info("admin crmResult ����");
		logger.info(vo.toString());
				
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
		if(orderby != null) { //orderby�� null�� �ƴҶ� ����
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
		}else {
			
		}
	}
	
	
	
	
	
	
	
	
	//bookmanagement
	/*------------------------------------------------------*/
	@RequestMapping(value = "/bookmanagement")
	public void bookManagement() {
		logger.info("bookablemenagement ���� " );
	}
	
	@RequestMapping(value = "/bookmanagement_result")
	public void bookManagementResult(HttpServletRequest request, Model model, Integer page, Integer prePage
			,String hostId, String guestId, String selected) {
		HttpSession session = request.getSession();
		
		logger.info("bookmanagement_result ����");
		logger.info("selected : " + selected);
		
		
		
		
		/* ����¡ ó�� */
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);
		if (page != null) {
			c.setPage(page);
		}
		if (prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		if(selected=="guestId") {
logger.info("guestId �Է¹���");
			
			model.addAttribute("selected","guestId");
			model.addAttribute("selected","guestId");
			
			/* hash�ʿ� ���� �ֱ� */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookGuestId", guestId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByGuestId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByGuestId(guestId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
			logger.info("���� ���õ� ������ : " + c.getPage());
			logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
			logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
			logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
			
			
		}else {
			logger.info("hostId �Է¹���");
			
			model.addAttribute("selected","hostId");
			
			
			/* hash�ʿ� ���� �ֱ� */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookHostId", hostId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByHostId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByHostId(hostId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
			logger.info("���� ���õ� ������ : " + c.getPage());
			logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
			logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
			logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
			
			
		}
		
		if(hostId == "" ) {
			logger.info("guestId �Է¹���");
			
			model.addAttribute("selected","guestId");
			
			/* hash�ʿ� ���� �ֱ� */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookGuestId", guestId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByGuestId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByGuestId(guestId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
			logger.info("���� ���õ� ������ : " + c.getPage());
			logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
			logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
			logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
			
			
			
			
			
			
			
		}else if(guestId == "" || selected=="hostId"){
			logger.info("hostId �Է¹���");
			
			model.addAttribute("selected","hostId");
			
			
			/* hash�ʿ� ���� �ֱ� */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bookHostId", hostId);
			map.put("start",c.getStart());
			map.put("end",c.getEnd());
			
			logger.info("maptostring : " + map.toString());
			List<BookVO> bookListPaging = bookService.readByHostId(map);
			logger.info("bookListPaging" + bookListPaging.toString());
			model.addAttribute("bookListPaging",bookListPaging);
			
			
			
			PageMaker maker = new PageMaker();
			maker.setCriteria(c);
			maker.setTotalCount(bookService.getCountByHostId(hostId));
			maker.setPageData();
			model.addAttribute("pageMaker", maker);
			
			
			
			logger.info("��ü �Ͽ콺 �� : " + maker.getTotalCount());
			logger.info("���� ���õ� ������ : " + c.getPage());
			logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
			logger.info("���� ������ ��ũ ��ȣ(startPageNO) : " + maker.getStartPageNo());
			logger.info("�� ������ ��ũ ��ȣ(endPageNo) : " + maker.getEndPageNo());
		}
		
		
		
		
	
	}
	
	
	/*------------------------------------report---------------------------------------------*/
	@RequestMapping("/reportmanagement")
	public void report() {
		logger.info("report ����");
	}
	@RequestMapping("/reportmanagement_result")
	public void reportResult(
			Model model, 
			Integer page, 
			Integer prePage,
			HttpServletRequest req) {
		logger.info("report ����");
	}
}
