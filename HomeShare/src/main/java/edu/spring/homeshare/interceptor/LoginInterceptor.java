package edu.spring.homeshare.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.memberVO;



public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("===== postHandle 호출");
		memberVO vo = (memberVO) modelAndView.getModel().get("login_result");
		if (vo != null) {
			logger.info("로그인 성공");
			HttpSession session = request.getSession();
			
			//memvo 세션값 가져오기
			session.setAttribute("memberVO",	vo);
			logger.info("vo 세션값 : " + session.getAttribute("memberVO").toString());
			//memId 세션값 가져오기
			session.setAttribute("memId",	vo.getMemId());
			logger.info("세션값 : " +(String) session.getAttribute("memId"));
			
			//memNo 세션값 가져오기
			session.setAttribute("memNo",	vo.getMemNo());
			int memNo = (int) session.getAttribute("memNo");
			logger.info("memno 세션값 : " + memNo);
			
			
			String referer = (String)request.getHeader("REFERER");
			response.sendRedirect(referer);			
			
		} else {
			logger.info("로그인 실패");
			HttpSession session = request.getSession();
			session.setAttribute("login_fail",	"login_fail");
			response.sendRedirect("/homeshare/member/login");
		}
	}
}
