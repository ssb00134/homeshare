package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("========session interceptor 헨들러 호출");
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		logger.info("memId : " + memId);
		PrintWriter out = response.getWriter();
		
		
		if(memId==null) { //세션이 존재하지 않으면
			//out.print("<head><meta charset=\"UTF-8\"></head><script>alert('세션이 존재하지 않습니다.');</script>");
			response.sendRedirect("/homeshare");
		}
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("========session interceptor 헨들러 호출");
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		logger.info("memId : " + memId);
		PrintWriter out = response.getWriter();
		
		
		if(memId==null) { //세션이 존재하지 않으면
			//out.print("<head><meta charset=\"UTF-8\"></head><script>alert('세션이 존재하지 않습니다.');</script>");
			response.sendRedirect("/homeshare");
		}
		return super.preHandle(request, response, handler);
	}
	
}
