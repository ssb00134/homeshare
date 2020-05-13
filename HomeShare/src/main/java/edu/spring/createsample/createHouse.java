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
	
	 int memNo=1;
	 String type="아파트";
	 int maxCapacity=1; //최대수용인원
	 int bedroom=1;
	 int bathroom=1;
	 String[] utilities = {"편의시설"}; //편의시설
	 String location="수원시 권선구"; //위치
	 String[] spaces= {"주방"}; 
	 String info = "sample"; //집정보
	 String[] rules ={"흡연 가능"};
	 int checkInInterval=1;
	 String checkInTime="9:00";
	 String checkOutTime="18:00";
	 int stayNight=1; //x박
	 int stayDay=1; //x일
	 Date bookableDateBegin=null; //예약가능시간
	 Date bookableDateEnd=null; // 예약가능시간
	 int price=1000;
	 String photo=null; //사진주소
	 String thumbNailPhoto=null; //썸네일 사진 주소
	 String title="sample";
	 int ranking=1;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/create", method = RequestMethod.GET)
//	public void home(Locale locale, Model model) {
//		 logger.info("createSample 실행 10개 생성");
//		 for(int i=0; i<=10; i++) {
//			 HouseVO vo = new HouseVO(0, memNo, type, maxCapacity, bedroom, bathroom, utilities, location, spaces, info+ i, rules, checkInInterval, checkInTime, checkOutTime, stayNight, stayDay, bookableDateBegin, bookableDateEnd, price, photo, thumbNailPhoto, title+i, ranking);
//			 houseService.insert(vo);
//		 }	 /*샘플코드 넣기*/
//	
//	}
	
}
