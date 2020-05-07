package edu.spring.homeshare.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.Dispatcher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		logger.info("houselist get ����");
		List<HouseVO> list = houseService.selectAll();

		/*����¡ ó��*/
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
		
		logger.info("��ü �Ͽ콺 �� : " + m.getTotalCount());
		logger.info("���� ���õ� ������ : " + c.getPage());
		logger.info("�� ������ �� �Խñ� �� : " + c.getNumsPerPage());
		logger.info("���� ������ ��ũ ��ȣ : " + m.getStartPageNo());
		logger.info("�� ������ ��ũ ��ȣ : " + m.getEndPageNo());
		
		request.setAttribute("startNum", m.getStartPageNo());
		
		request.setAttribute("pageMaker", m);
		request.setAttribute("boardList", list);

	}
	
	@RequestMapping(value = "/house-list/all", method = RequestMethod.GET)
	public ResponseEntity<List<HouseVO>> HouseTest(HttpServletRequest request) {
		logger.info("loginGet() ȣ��");
		List<HouseVO> list = houseService.selectAll();
		for(int i=0; i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
		
		
		return new ResponseEntity<List<HouseVO>>(list,HttpStatus.OK);
		
	}
	
	/*house-detail ����*/
	@RequestMapping(value="/house-detail/{no}",method = RequestMethod.GET)
	public void readHouse(
			@PathVariable("no") int houseNo) {
		logger.info("houseno " + houseNo);
		HouseVO vo = houseService.selectByHouseNo(houseNo);
		logger.info(vo.toString());
	}
}
