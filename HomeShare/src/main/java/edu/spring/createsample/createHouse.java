package edu.spring.createsample;

import java.sql.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.service.HouseService;

@Controller
public class createHouse {
	@Autowired
	private HouseService houseService;
	private static final Logger logger = LoggerFactory.getLogger(createHouse.class);
	selectAllByMemNo
	int houseNo = 0;
	String type = "아파트";
	String scope = "개인실";
	int maxCapacity = 1;
	int bedroom = 1;
	int bed = 1;
	int bathroom = 1;
	String utilities = "tv";
	String spaces = "헬스장";
	String title = "dumy1";
	String info = "dumy1";
	String rules = "흡연 가능";
	String checkinTime = "9:00";
	String checkoutTime = "18:00";
	int stayNight = 1;
	int stayDay = 2;
	Date bookableDateBegin= Date .valueOf("2020-05-26");
	Date bookableDateEnd = Date .valueOf("2020-06-26");
	int price=10000;
	int memNo=23;// dumy
	int replies=0;
	String image="";
	int checkinInterval=1;
	int score=0;
	String location="";

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void home(Locale locale, Model model) {
		 logger.info("createSample 실행 10개 생성");
		 for(int i=0; i<=10; i++) {
			// HouseVO vo = new HouseVO(i, type, scope, i, i, i, i, utilities, spaces, title, info, rules, checkinTime, checkoutTime, i, i, bookableDateBegin, bookableDateEnd, i, i, replies, image, i, i, location)
		 }	 /*샘플코드 넣기*/
	
	}

}
