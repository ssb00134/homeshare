package edu.spring.homeshare.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.BookService;
import edu.spring.homeshare.service.HouseService;

@Controller
@RequestMapping(value = "book")
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	private BookService bookService;
	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public void list2(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		// ���� memno ��������
		int bookMemNo = (int) session.getAttribute("memNo");
		logger.info("memno ���ǰ� : " + bookMemNo);

		List<BookVO> bookList = bookService.selectMemNo(bookMemNo);
		logger.info("list : " + bookList.toString());
		model.addAttribute("bookList", bookList);

		// ����� ������ �������� �ش� list�� housevo ���� ��������
		List<HouseVO> houseList = new ArrayList<HouseVO>();
		logger.info("ù��° �����ȣ�� �Ͽ콺��ȣ : " + bookList.get(0).getBookHouseNo());
		for (int i = 0; i < bookList.size(); i++) {
			houseList.add(houseService.selectByHouseNo(bookList.get(i).getBookHouseNo()));
			logger.info("houseList : " + houseList.get(i).toString());
		}
		model.addAttribute("houseList", houseList);
	}

	@RequestMapping(value = "/hostbook", method = RequestMethod.POST)
	public void hostbook(Model model, HttpServletRequest request) { // ȣ��Ʈ�� ����� ����Ʈ

		// ���ǿ��� ���̵�, memNo ��������
		HttpSession session = request.getSession();
		String sessionMemId = (String) session.getAttribute("memId"); // ���ǿ��� ���̵� ��������
		if (sessionMemId != null) {
			int memNo = (int) session.getAttribute("memNo");
			List<HouseVO> houseList = houseService.selectAllByMemNO(memNo);
			logger.info("houseList : " + houseList.toString());
			model.addAttribute("houseList", houseList);

			// *���� host�ϴ� ����߿��� �������� ����������

			List<BookVO> bookList = null;
			for (int i = 0; i < houseList.size(); i++) {
				int houseNo = houseList.get(i).getHouseNo();
				bookList = bookService.selectHouseNo(houseNo);
			}
			model.addAttribute("bookList", bookList);

		} else {
			logger.info("������ �����ϴ�. �α��� ���ּ���");
		}

	}

}
