package edu.spring.homeshare.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
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
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean masterFlag = true;
		
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");

		
		if(memId == null) { //세션이 없음
			masterFlag = false;
			
			PrintWriter out = response.getWriter();
			logger.info("sessionId null");
			out.print("<head>" + "<meta charset='UTF-8'>" + "</head>");
			out.print("<script>alert('session null'); location.href='/homeshare/';</script>");
			out.flush();
			
		}
		
		return masterFlag;
	}
	
}
