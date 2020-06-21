package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LogoutInterceptor.class);
	
	

	
	
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("logout interceptor 실행");
		String reqUrl = request.getRequestURL().toString();
		//전송받은 현재 url
		//String referer = (String) modelAndView.getModel().get("referer");
		String referer = (String)request.getHeader("REFERER");
		
		logger.info(" reqUrl 현재 url" + reqUrl);
		logger.info("referer 이전 url : " + referer);
	}

}
