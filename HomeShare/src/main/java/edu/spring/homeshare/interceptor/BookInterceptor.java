package edu.spring.homeshare.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;




public class BookInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = 
			LoggerFactory.getLogger(BookInterceptor.class);
	
	@Autowired
	private BookService bookService;
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		boolean masterFlag = false;
//		logger.info("book prehendler 호출");
//		
//		//세션에서 정보가져오기
//		HttpSession session = request.getSession();
//		String bookHostId = (String) session.getAttribute("memId");
//		logger.info("bookHostId" + bookHostId);
//		
//		List<BookVO> bookvo =  bookService.readByHostId(bookHostId);
//		
//		if(bookvo.size() < 1) { // 예약이 없으면
//			response.sendRedirect(request.getContextPath() + "/");
//			logger.info("진행중인 예약이 없습니다. 메인페이지 가기"); //세션이 없습니다.
//			masterFlag = false;
//		}else {
//			logger.info("예약이 있습니다. 메인페이지 가기"); //세션이 없습니다.
//			masterFlag = true;
//		}
//		
//		
//		return masterFlag;
//	}
}
