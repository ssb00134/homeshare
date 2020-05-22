package edu.spring.homeshare.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.MemberVO;

public class HouseHostingIntercepor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		MemberVO vo = (MemberVO) modelAndView.getModel().get("");
		
	}
}
