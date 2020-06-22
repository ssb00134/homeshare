package edu.spring.homeshare.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.service.MemberService;



@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	/*로그인 매핑*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(HttpServletRequest req, Model model) { // view 호출 (login.jsp)
		logger.info("loginGet() 호출");
		String url = req.getContextPath(); // 이전경로
		model.addAttribute("targetUrl", url);	
	}
	
	@RequestMapping(value = "/login-post", method=RequestMethod.POST)
	public void loginPost(MemberVO vo, Model model) { // DB에 vo 전송
		logger.info("loginPost() 호출");
		logger.info("loginPost() vo 정보 : " + vo.toString());
		MemberVO result = memberService.loginCheck(vo);
		// 아이디 비밀번호가 일치 : result !=null
		// 아이디 비밀번호가 일치하지 않음 : result == null
		logger.info("result : " + result);
		model.addAttribute("login_result", result);
		
	}
	
	@RequestMapping(value="logout")
	public void logout(HttpServletRequest req,HttpServletResponse response, Model model) throws IOException {
		logger.info("logout 호출 ");
		HttpSession session = req.getSession();
		session.removeAttribute("memId");
		session.invalidate();
		
		
		String referer = (String)req.getHeader("REFERER");
		logger.info("이전 url : " + referer);
		model.addAttribute("referer", referer);
		response.sendRedirect(referer);
	}
	
	
	/*아이디 찾기 매핑*/
	@RequestMapping(value="find-id", method = RequestMethod.GET)
	public void findId(MemberVO vo,Model model) {
		logger.info("find id get 호출");
	}	
	
	@RequestMapping(value="find-id-post", method = RequestMethod.POST)
	public void findIdPost(MemberVO vo,Model model) {
		logger.info("find-id-post() 호출");
		String result = memberService.findId(vo);
		// 아이디가 있음 : result !=null
		// 아이디가 없음 : result == null
		logger.info("result : " + result);
		model.addAttribute("find_id_result", result);
	}
	
	
	/*회원가입 매핑*/
	@RequestMapping(value="/sign-up", method = RequestMethod.GET)
	public void SignUpGet(Model model,String url) {
		logger.info("signUp() 호출");
		logger.info("url : " + url); // 이전경로(로그인을 위해 왔던)의 값 출력
		model.addAttribute("targetUrl", url);
	}
	@RequestMapping(value="/sign-up-post", method = RequestMethod.POST)
	public void SignUpPost(MemberVO vo, Model model) {
		logger.info("signPost() 호출");
		logger.info(vo.toString());
		int result = memberService.insert(vo);
		model.addAttribute("sign_up_result",result);
	}
	/*end 회원가입 매핑*/
	

	
	
	
	/* 계정 메핑*/
	//testtest
	@RequestMapping(value="/account")
	public void account(String url, Model model, HttpServletRequest req) {
		logger.info("account 실행");
		logger.info("url : " + url); // 이전경로(로그인을 위해 왔던)의 값 출력
		model.addAttribute("targetUrl", url);	
		
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); //세션에서 아이디 가져오기
		logger.info("세션값 : " +memId);
		
		
		MemberVO vo = memberService.select(memId);
		logger.info(vo.toString());
		session.setAttribute("vo", vo);
	}
	
	
	//중복확인
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = memberService.idChk(vo);
		return result;
	}
	
	@RequestMapping(value="/update",
			method = RequestMethod.POST)
	public void update(MemberVO vo, Model model) {
		
		logger.info("전송된 vo : " + vo);
		int result = memberService.update(vo);
		if(result==1) {
			logger.info("업데이트성공");
		}else {
			logger.info("업데이트실패");
		}
		model.addAttribute("result", result);
		
	}
}






