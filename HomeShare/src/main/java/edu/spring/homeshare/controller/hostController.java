package edu.spring.homeshare.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.service.HouseService;

@Controller
@RequestMapping(value = "/host")
public class hostController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	@Autowired
	private HouseService houseService;
	
	@RequestMapping(value="/hosting-list", method = RequestMethod.GET)
	public void hostingList(Model model,  HttpServletRequest req) {
		logger.info("hosting list »£√‚");
		HttpSession session = req.getSession();
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		logger.info(vo.toString());
		int memNo = vo.getMemNo();
		logger.info("memno : " + Integer.toString(memNo));
		List<HouseVO> list = houseService.selectAllByMemNO(memNo);
		
		for(int i=0;i<list.size(); i++) {
			logger.info(list.get(i).toString());
		}
//		
//		model.addAttribute("list", list);
	}
}
