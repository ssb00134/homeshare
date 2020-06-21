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

		logger.info("AdminInterceptor ����");

		if (request.getSession().getAttribute("memberVO") != null && request.getSession().getAttribute("memId").equals("admin")) {
			// ���� memberVO �� �����ϰ�, ���̵� admin�̸�

			System.out.println("admin����!!!"); // admin ����
			masterFlag = true;

		} else { // ���� ID�� ����ġ �ʰų�, ����� 3�� �ƴ϶��
			PrintWriter out = response.getWriter();
			out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
			out.print("<script>alert('You do not have permission admin'); location.href='/homeshare/';</script>");
			out.flush();
			
			System.out.println("admin ������!"); // admin ������
			//response.sendRedirect(request.getContextPath() + "/");
			
			

			
			// �ش� �������� ������
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