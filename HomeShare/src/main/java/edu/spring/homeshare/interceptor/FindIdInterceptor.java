package edu.spring.homeshare.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FindIdInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("find-id postHandler 호출");
		String result = (String) modelAndView.getModel().get("find_id_result");
		logger.info(result);
		if(result != null) {
			logger.info("아이디 찾기 성공");
			HttpSession session = request.getSession();
			session.setAttribute("memId",	result);
			logger.info("세션값 : " +(String) session.getAttribute("memId"));
			response.sendRedirect("find-id");
		}else {
			logger.info("로그인 실패");
			HttpSession session = request.getSession();
			session.setAttribute("find_id_fail", "find_id_fail");
			response.sendRedirect("find-id");
		}
	}
	
}
