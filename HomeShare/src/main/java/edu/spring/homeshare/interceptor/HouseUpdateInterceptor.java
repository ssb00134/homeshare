package edu.spring.homeshare.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.HouseVO;



public class HouseUpdateInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = 
			LoggerFactory.getLogger(HouseUpdateInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("houseupdate handler 호출");
		
		
		HouseVO housevo = (HouseVO) modelAndView.getModel().get("housevo");
		logger.info("interceptor housevo : " + housevo);
		
		
		/* 세션 정보 확인하기*/
		HttpSession session = request.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // 세션에서 아이디 가져오기
		
		logger.info("세션아이디 : " + sessionMemId);
		logger.info("hostid : " +housevo.getHostId());
		
		
		
		
		if(housevo.getHostId().equals(sessionMemId)) {
			logger.info("세션아이디와 hostid 일치 통과");
		}else {
			logger.info("세션아이디와 hostid 불일치");
			response.sendRedirect("/homeshare/");
			
		}
	
	}
}
