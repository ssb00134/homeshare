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
	 String type="����Ʈ";
	 int maxCapacity=1; //�ִ�����ο�
	 int bedroom=1;
	 int bathroom=1;
	 String[] utilities = {"���ǽü�"}; //���ǽü�
	 String location="������ �Ǽ���"; //��ġ
	 String[] spaces= {"�ֹ�"}; 
	 String info = "sample"; //������
	 String[] rules ={"�� ����"};
	 int checkInInterval=1;
	 String checkInTime="9:00";
	 String checkOutTime="18:00";
	 int stayNight=1; //x��
	 int stayDay=1; //x��
	 Date bookableDateBegin=null; //���డ�ɽð�
	 Date bookableDateEnd=null; // ���డ�ɽð�
	 int price=1000;
	 String photo=null; //�����ּ�
	 String thumbNailPhoto=null; //����� ���� �ּ�
	 String title="sample";
	 int ranking=1;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void home(Locale locale, Model model) {
		 logger.info("createSample ���� 10�� ����");
		 /*�����ڵ� �ֱ�*/
		 for(int i=0; i<=10; i++) {
			 HouseVO vo = new HouseVO(0, memNo, type, maxCapacity, bedroom, bathroom, utilities, location, spaces, info+ i, rules, checkInInterval, checkInTime, checkOutTime, stayNight, stayDay, bookableDateBegin, bookableDateEnd, price, photo, thumbNailPhoto, title+i, ranking);
			 houseService.insert(vo);
		 }
	}
	
}
