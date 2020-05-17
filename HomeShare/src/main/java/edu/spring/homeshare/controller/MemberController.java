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
	
	
	/*�α��� ����*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(String url, Model model) { // view ȣ�� (login.jsp)
		logger.info("loginGet() ȣ��");
		logger.info("url : " + url); // �������(�α����� ���� �Դ�)�� �� ���
		model.addAttribute("targetUrl", url);	
	}
	
	@RequestMapping(value = "/login-post", method=RequestMethod.POST)
	public void loginPost(memberVO vo, Model model) { // DB�� vo ����
		logger.info("loginPost() ȣ��");
		logger.info("loginPost() vo ���� : " + vo.toString());
		memberVO result = memberService.loginCheck(vo);
		// ���̵� ��й�ȣ�� ��ġ : result !=null
		// ���̵� ��й�ȣ�� ��ġ���� ���� : result == null
		logger.info("result : " + result);
		model.addAttribute("login_result", result);
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest req) {
		logger.info("logout ȣ�� ");
		HttpSession session = req.getSession();
		session.removeAttribute("memId");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	/*���̵� ã�� ����*/
	@RequestMapping(value="find-id", method = RequestMethod.GET)
	public void findId(memberVO vo,Model model) {
		logger.info("find id get ȣ��");
	}	
	
	@RequestMapping(value="find-id-post", method = RequestMethod.POST)
	public void findIdPost(memberVO vo,Model model) {
		logger.info("find-id-post() ȣ��");
		String result = memberService.findId(vo);
		// ���̵� ���� : result !=null
		// ���̵� ���� : result == null
		logger.info("result : " + result);
		model.addAttribute("find_id_result", result);
	}
	
	
	/*ȸ������ ����*/
	@RequestMapping(value="/sign-up", method = RequestMethod.GET)
	public void SignUpGet(Model model,String url) {
		logger.info("signUp() ȣ��");
		logger.info("url : " + url); // �������(�α����� ���� �Դ�)�� �� ���
		model.addAttribute("targetUrl", url);
	}
	@RequestMapping(value="/sign-up-post", method = RequestMethod.POST)
	public void SignUpPost(memberVO vo, Model model) {
		logger.info("signPost() ȣ��");
		logger.info(vo.toString());
		int result = memberService.insert(vo);
		model.addAttribute("sign_up_result",result);
	}
	/*end ȸ������ ����*/
	
	
	/*ȣ��Ʈ �Ǳ� ����*/
	@RequestMapping(value="/became-a-host", method = RequestMethod.GET)
	public void registHost(String url, Model model) {
		logger.info("registHost() ȣ��");
		logger.info("url : " + url); // �������(�α����� ���� �Դ�)�� �� ���
		model.addAttribute("targetUrl", url);	
	}
	
	
	
	/* ���� ����*/
	@RequestMapping(value="/account",method = RequestMethod.GET)
	public void account(String url, Model model, HttpServletRequest req) {
		logger.info("account ����");
		logger.info("url : " + url); // �������(�α����� ���� �Դ�)�� �� ���
		model.addAttribute("targetUrl", url);	
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId"); //���ǿ��� ���̵� ��������
		logger.info("���ǰ� : " +memId);
		memberVO vo = memberService.select(memId);
		logger.info(vo.toString());
		session.setAttribute("vo", vo);
	}
}






