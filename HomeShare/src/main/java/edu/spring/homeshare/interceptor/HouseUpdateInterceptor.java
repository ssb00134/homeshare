package edu.spring.homeshare.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.HouseVO;



public class HouseUpdateInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = 
			LoggerFactory.getLogger(HouseUpdateInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("houseupdate handler ȣ��");
		
		
		HouseVO housevo = (HouseVO) modelAndView.getModel().get("housevo");
		logger.info("interceptor housevo : " + housevo);
		
		
		/* ���� ���� Ȯ���ϱ�*/
		HttpSession session = request.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		
		logger.info("sessionMemId : " + sessionMemId);
		logger.info("hostId : " + housevo.getHostId());
		if(sessionMemId.equals(housevo.getHostId())) {
			logger.info("���Ǿ��̵�� hostid ��ġ ���");
		}else{
			logger.info("���Ǿ��̵�� hostid ����ġ");
			
			session.setAttribute("update_fail",	"update_fail");
			response.sendRedirect("/homeshare/");
		}
	
	}
}
