package edu.spring.homeshare.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.service.MemberService;



@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(String url, Model model) { // view 호출 (login.jsp)
		logger.info("loginGet() 호출");
		logger.info("url : " + url); // 이전경로(로그인을 위해 왔던)의 값 출력
		model.addAttribute("targetUrl", url);
		
	}
	
	@RequestMapping(value = "/login-post", method=RequestMethod.POST)
	public void loginPost(memberVO vo, Model model) { // DB에 vo 전송
		logger.info("loginPost() 호출");
		memberVO result = memberService.loginCheck(vo);
		// 아이디 비밀번호가 일치 : result !=null
		// 아이디 비밀번호가 일치하지 않음 : result == null
		logger.info("result : " + result);
		model.addAttribute("login_result", result);
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest req) {
		logger.info("logout 호출 ");
		HttpSession session = req.getSession();
		session.removeAttribute("memId");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="find-id", method = RequestMethod.GET)
	public void findId(memberVO vo,Model model) {
		logger.info("find id get 호출");
	}
	
	
	@RequestMapping(value="find-id-post", method = RequestMethod.POST)
	public String findIdPost(memberVO vo,Model model) {
		logger.info("find id 호출");
		String result = memberService.findId(vo);
		logger.info("result : " + result);
		return result;
	}
	
	@RequestMapping(value="/sign-up", method = RequestMethod.GET)
	public void SignUpGet(Model model,String url) {
		logger.info("signUp() 호출");
		logger.info("url : " + url); // 이전경로(로그인을 위해 왔던)의 값 출력
		model.addAttribute("targetUrl", url);
	}
	@RequestMapping(value="/sign-up-post", method = RequestMethod.POST)
	public void SignUpPost(memberVO vo, Model model) {
		logger.info("signPost() 호출");
		logger.info(vo.toString());
		
	}
	
	
}






