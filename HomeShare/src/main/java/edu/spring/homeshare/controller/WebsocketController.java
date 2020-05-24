package edu.spring.homeshare.controller;

import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.spring.homeshare.domain.MemberVO;

@Controller
public class WebsocketController {
	@RequestMapping(value ="homeshare/websocket")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chattingview");
		
		//����� ������ ����ϴ� ����
		return mv;
	}
}
