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

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.service.HouseService;

//�ֻ��� ���ͼ���
public class HouseInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(HouseInterceptor.class);

	@Autowired
	private HouseService houseService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean masterFlag = true;
		String reqUrl = request.getRequestURL().toString(); //���۹�

		logger.info("house interceptor ����");

		//���ǿ��� ������������

		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");

		if (memId == null) { // member������ ���� : �α׾ƿ�����
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
				logger.info("sessionId null");
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('not session'); location.href='/homeshare/';</script>");
				out.flush();
				
				logger.info("������ �����ϴ�. ���������� ����"); //������ �����ϴ�.
				logger.info("������ �����ϴ�. ���������� ����"); //������ �����ϴ�.
			}

		} else {
			if (reqUrl.contains("house-update")) {
				logger.info("house-update ����");
				//housevo�� ���۹���
				
			
//				PrintWriter out = response.getWriter();
//				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
//				out.print("<script>alert('You do not have permission'); location.href='/homeshare/';</script>");
//				out.flush();
			} else {
				logger.info("house-update ������");
				logger.info("reqUrl : " + reqUrl);
			}
			masterFlag = true;
			logger.info("�α��λ��� ");
		}
		return masterFlag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		String reqUrl = request.getRequestURL().toString(); //���۹�
		if(reqUrl.contains("house-update")) {
			HouseVO housevo = (HouseVO) modelAndView.getModel().get("housevo");
			
			String modelHostId = housevo.getHostId();
			
			
			
			
			//���ǿ��� �����ޱ�
			HttpSession session = request.getSession();
			String sessionId = (String) session.getAttribute("memId");
			
			
			logger.info("modelhostid : " + modelHostId + " sessionid : " + sessionId);
			
			if(modelHostId==null) {
				PrintWriter out = response.getWriter();
				logger.info("modelHostId null");
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('not session'); location.href='/homeshare/';</script>");
				out.flush();
			}
			if(sessionId==null) {
				PrintWriter out = response.getWriter();
				logger.info("sessionId null");
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('not session'); location.href='/homeshare/';</script>");
				out.flush();
			}
			if(!modelHostId.equals(sessionId)) {
				PrintWriter out = response.getWriter();
				logger.info("modelHostId  not equal sessionid");
				
				//out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('not session'); location.href='/homeshare/';</script>");
				out.flush();
			}
		
			
		}
	}
}
