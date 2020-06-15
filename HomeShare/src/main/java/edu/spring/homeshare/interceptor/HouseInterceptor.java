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

//최상위 인터셉터
public class HouseInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(HouseInterceptor.class);

	@Autowired
	private HouseService houseService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean masterFlag = false;
		String reqUrl = request.getRequestURL().toString(); //전송받

		logger.info("house interceptor 실행");

		//세션에서 정보가져오기

		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");

		if (membervo == null) { // member세션이 없음 : 로그아웃상태
			if (reqUrl.contains("list")) {
				logger.info("house-list 예외처리");
				masterFlag = true;
			} else if (reqUrl.contains("display")) {
				logger.info("display 예외처리");
				masterFlag = true;
			} else if (reqUrl.contains("detail")) {
				logger.info("detail 예외처리");
				masterFlag = true;
			} else {
				masterFlag = false;
				//뷰 메시지 출력하기
				PrintWriter out = response.getWriter();
				out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
				out.print("<script>alert('권한이 없습니다.');</script>");

				response.sendRedirect(request.getContextPath() + "/");
				logger.info("세션이 없습니다. 메인페이지 가기"); //세션이 없습니다.
			}

		} else {
			if (reqUrl.contains("house-update")) {
				logger.info("house-update 포함");
			} else {
				logger.info("house-update 미포함");
				logger.info("reqUrl : " + reqUrl);
			}
			masterFlag = true;
			logger.info("로그인상태 ");
		}
		return masterFlag;
	}

	//	@Override
	//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	//		boolean masterFlag = false;
	//		HttpSession session = request.getSession();		
	//		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");
	//		
	//		logger.info("houseinterceptor post 호출");
	//		if(membervo == null) { // member세션이 없음 : 로그아웃상태
	//			masterFlag = false;
	//			response.sendRedirect(request.getContextPath() + "/");
	//			
	//			//뷰 메시지 출력하기
	//			PrintWriter out = response.getWriter();
	//			out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
	//			out.print("<script>alert('권한이 없습니다.');</script>");
	//			
	//			
	//			
	//			logger.info("post handler 로그아웃 상태로 보내기");
	//		}else {
	//			masterFlag = true;
	//			logger.info("로그인상태 상태로 보내기");
	//		}
	//	}

}
