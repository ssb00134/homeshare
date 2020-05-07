package edu.spring.homeshare.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.service.HouseService;
import edu.spring.homeshare.service.MemberService;
import edu.spring.homeshare.util.PageCriteria;
import edu.spring.homeshare.util.PageMaker;

@Controller
@RequestMapping(value="house")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value = "/house-list", method = RequestMethod.GET)
	public void houseLIst() {
		logger.info("houselist get ����");
	}
	
	@RequestMapping(value = "/house-list/all", method = RequestMethod.GET)
	public ResponseEntity<List<HouseVO>> HouseTest(HttpServletRequest request) {
		logger.info("loginGet() ȣ��");
		List<HouseVO> list = houseService.selectAll();
		for(int i=0; i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
		/*������ ����*/
		PageCriteria c = new PageCriteria();
		String page = request.getParameter("page");
		
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
		request.setAttribute("pageMaker", m);
		request.setAttribute("boardList", list);
		
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
