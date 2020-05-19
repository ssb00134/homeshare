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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void houseLIst(Model model, Integer page, Integer prePage, HttpServletRequest req) {
		logger.info("houselist get ����");
		
		/*����¡ ó��*/
		PageCriteria c = new PageCriteria();
		logger.info("page : " + page);

		if(page !=null) {
			c.setPage(page);
		}
		if(prePage != null) {
			c.setNumsPerPage(prePage);
		}
		
		/*�Ķ���� ����*/
		String location = req.getParameter("location");
		logger.info("location : " + location);
		String bookableDateBegin = req.getParameter("checkIn");
		logger.info("bookableDateBegin : " + bookableDateBegin);
		String bookableDateEnd = req.getParameter("checkOut");
		logger.info("bookableDateEnd : " + bookableDateEnd);
		int maxCapacity = Integer.parseInt(req.getParameter("maxCapacity"));
		logger.info("maxCapacity : " + maxCapacity);
		
		/*hash�ʿ� ���� �ֱ�*/
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("location", location); 
		map.put("bookableDateBegin", bookableDateBegin);
		map.put("bookableDateEnd", bookableDateEnd);
		map.put("maxCapacity", maxCapacity);
		map.put("start",c.getStart());
		map.put("end",c.getEnd());
		logger.info("maptostring : " +map.toString());
		
		
		List<HouseVO> list = houseService.multySelect(map);
		logger.info("list ���� : " + list.toString());
		model.addAttribute("houseList",list);
		
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
	
	/* location �˻� ���� */
	

	/*house-detail ����*/
	@RequestMapping(value="/house-detail",method = RequestMethod.GET)
	public void readHouse(
			int houseNo,
			Model model,
			@ModelAttribute("criteria") PageCriteria criteria) {
		logger.info("house-detail ���� " + houseNo);
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
		model.addAttribute("houseVO", vo);
	}
	
	/*insert ���� */
	
	//���ҵ��
	@RequestMapping(value="/house-insert",method = RequestMethod.GET)
	public void houseInsertGet() {
		logger.info("house-insert get ����");
	}
	@RequestMapping(value="/house-insert-post",method = RequestMethod.POST)
	public String houseInsertPost(HouseVO vo,
			RedirectAttributes reAttr) {
		logger.info("house-insert-post ����");
		logger.info(vo.toString());
		int result = houseService.create(vo);
		if(result == 1) { // insert ����
			logger.info("insert ����");
			reAttr.addFlashAttribute("insert_result", "success");
		}else {
			logger.info("insert ����");
			reAttr.addFlashAttribute("insert_result", "fail");
		}
		return "redirect:/house/house-list";
	}
}
