package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.service.HouseService;

//�ֻ��� ���ͼ���
public class HouseInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(HouseInterceptor.class);

	@Autowired
	private HouseService houseService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean masterFlag = false;
		String reqUrl = request.getRequestURL().toString(); //���۹�

		logger.info("house interceptor ����");

		//���ǿ��� ������������

		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");

		if (membervo == null) { // member������ ���� : �α׾ƿ�����
			if (reqUrl.contains("list")) {
				logger.info("house-list ����ó��");
				masterFlag = true;
			} else if (reqUrl.contains("display")) {
				logger.info("display ����ó��");
				masterFlag = true;
			} else if (reqUrl.contains("detail")) {
				logger.info("detail ����ó��");
				masterFlag = true;
			} else {
				masterFlag = false;
				//�� �޽��� ����ϱ�
				PrintWriter out = response.getWriter();
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('������ �����ϴ�.');</script>");

				response.sendRedirect(request.getContextPath() + "/");
				logger.info("������ �����ϴ�. ���������� ����"); //������ �����ϴ�.
			}

		} else {
			if (reqUrl.contains("house-update")) {
				logger.info("house-update ����");
			} else {
				logger.info("house-update ������");
				logger.info("reqUrl : " + reqUrl);
			}
			masterFlag = true;
			logger.info("�α��λ��� ");
		}
		return masterFlag;
	}

	//	@Override
	//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	//		boolean masterFlag = false;
	//		HttpSession session = request.getSession();		
	//		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");
	//		
	//		logger.info("houseinterceptor post ȣ��");
	//		if(membervo == null) { // member������ ���� : �α׾ƿ�����
	//			masterFlag = false;
	//			response.sendRedirect(request.getContextPath() + "/");
	//			
	//			//�� �޽��� ����ϱ�
	//			PrintWriter out = response.getWriter();
	//			out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
	//			out.print("<script>alert('������ �����ϴ�.');</script>");
	//			
	//			
	//			
	//			logger.info("post handler �α׾ƿ� ���·� ������");
	//		}else {
	//			masterFlag = true;
	//			logger.info("�α��λ��� ���·� ������");
	//		}
	//	}

}
