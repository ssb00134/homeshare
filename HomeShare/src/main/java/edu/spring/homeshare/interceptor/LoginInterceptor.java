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
		logger.info("===== postHandle ȣ��");
		memberVO vo = (memberVO) modelAndView.getModel().get("login_result");
		if (vo != null) {
			logger.info("�α��� ����");
			HttpSession session = request.getSession();
			
			//memvo ���ǰ� ��������
			session.setAttribute("memberVO",	vo);
			logger.info("vo ���ǰ� : " + session.getAttribute("memberVO").toString());
			//memId ���ǰ� ��������
			session.setAttribute("memId",	vo.getMemId());
			logger.info("���ǰ� : " +(String) session.getAttribute("memId"));
			
			//memNo ���ǰ� ��������
			session.setAttribute("memNo",	vo.getMemNo());
			int memNo = (int) session.getAttribute("memNo");
			logger.info("memno ���ǰ� : " + memNo);
			
			response.sendRedirect("/homeshare");			
			
		} else {
			logger.info("�α��� ����");
			HttpSession session = request.getSession();
			session.setAttribute("login_fail",	"login_fail");
			response.sendRedirect("/homeshare/member/login");
		}
	}
}
