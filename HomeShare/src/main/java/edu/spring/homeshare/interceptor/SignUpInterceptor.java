package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.MemberVO;

public class SignUpInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			logger.info("========post��鷯 ȣ��");
			int result = (int) modelAndView.getModel().get("sign_up_result");
			PrintWriter out = response.getWriter();
			if(result==1) {
				logger.info("ȸ������ ����");
				out.print("<head><meta charset=\"UTF-8\"></head><script>alert('ȸ������ ����.');</script>");
				response.sendRedirect("/homeshare");
			}else {
				logger.info("ȸ������ ����");
				out.print("<head><meta charset=\"UTF-8\"></head><script>alert('ȸ������ ����.');</script>");
				response.sendRedirect("/homeshare/member/sign_up");
			}
	}
}
