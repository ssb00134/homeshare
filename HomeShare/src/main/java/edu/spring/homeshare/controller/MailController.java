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
		logger.info("mail ���� ");
	}

	// mailSending �ڵ�
	@RequestMapping(value = "/mailSending")
	public String mailSending(HttpServletRequest request) {

		String setfrom = "���̵�@gmail.com";
		String tomail = request.getParameter("tomail"); // �޴� ��� �̸���
		String title = request.getParameter("title"); // ����
		String content = request.getParameter("content"); // ����

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ������ �����ϴ�
			messageHelper.setText(content); // ���� ����

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:/mail/mailForm";
	}
}