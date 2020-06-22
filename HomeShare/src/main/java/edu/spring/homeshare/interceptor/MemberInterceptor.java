package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean masterFlag = true;
		
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("memId");

		
		String reqUrl = request.getRequestURL().toString(); //전송받
		if(reqUrl.contains("account")) {
			
			if(sessionId==null) {
				masterFlag = false;
				//뷰 메시지 출력하기
				PrintWriter out = response.getWriter();
				logger.info("sessionId null");
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('not session'); location.href='/homeshare/';</script>");
				out.flush();
				
				
			}
			
			
		}
		
		return masterFlag;
		
	}
	
	
}