package edu.spring.homeshare.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	@Autowired
	private JavaMailSender mailSender;

	// mailForm
	@RequestMapping(value = "/mail")
	public void mailForm() {
		logger.info("mail 실행 ");
	}

	// mailSending 코드
	@RequestMapping(value = "/mailSending")
	public String mailSending(HttpServletRequest request) {
		logger.info("mailSending 실행 ");

		String setfrom = "homeShareMaster@naver.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		logger.info("toMail : " + tomail);
		String title = request.getParameter("title"); // 제목
		logger.info("title : " + title);
		String content = request.getParameter("content"); // 내용
		logger.info("content : " + content);
		
		
		MimeMessage message = mailSender.createMimeMessage();
		logger.info("message info : " + message);

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
		
			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
			logger.info("전송실패");
		}

		return "redirect:/mailForm";
	}
}