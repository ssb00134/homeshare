package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		boolean masterFlag = false;

		logger.info("AdminInterceptor 실행");

		if (request.getSession().getAttribute("memberVO") != null && request.getSession().getAttribute("memId").equals("admin")) {
			// 세션 memberVO 가 존재하고, 아이디가 admin이면

			System.out.println("admin인증!!!"); // admin 인증
			masterFlag = true;

		} else { // 세션 ID가 존재치 않거나, 등급이 3이 아니라면
			PrintWriter out = response.getWriter();
			out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
			out.print("<script>alert('You do not have permission admin'); location.href='/homeshare/';</script>");
			out.flush();
			
			System.out.println("admin 미인증!"); // admin 미인증
			//response.sendRedirect(request.getContextPath() + "/");
			
			

			
			// 해당 페이지로 보내기
			masterFlag = false;
		}

		return masterFlag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}