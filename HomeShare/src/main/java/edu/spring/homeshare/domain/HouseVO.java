package edu.spring.homeshare.domain;

import java.sql.Date;
import java.util.Arrays;

public class HouseVO {
	
	private int houseNo;
	private int memNo;
	private String type;
	private int maxCapacity; //최대수용인원
	private int bedroom;
	private int bathroom;
	private String[] utilities; //편의시설
	private String location; //위치
	private String[] spaces;
	private String info; //집정보
	private String[] rules;
	private int checkInInterval;
	private String checkInTime;
	private String checkOutTime;
	private int stayNight; //x박
	private int stayDay; //x일
	private Date bookableDateBegin; //예약가능시간
	private Date bookableDateEnd; // 예약가능시간
	private int price;
	private String photo; //사진주소
	private String thumbNailPhoto; //썸네일 사진 주소
	private String title;
	private int ranking;
	
	
	public HouseVO() {}
	
	
	
	public HouseVO(int houseNo, int memNo, String type, int maxCapacity, int bedroom, int bathroom,
			String[] utilities, String location, String[] spaces, String info, String[] rules, int checkInInterval,
			String checkInTime, String checkOutTime, int stayNight, int stayDay, Date bookableDateBegin,
			Date bookableDateEnd, int price, String photo, String thumbNailPhoto, String title, int ranking) {
		super();
		this.houseNo = houseNo;
		this.memNo = memNo;
		this.type = type;
		this.maxCapacity = maxCapacity;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.utilities = utilities;
		this.location = location;
		this.spaces = spaces;
		this.info = info;
		this.rules = rules;
		this.checkInInterval = checkInInterval;
		this.checkInTime = checkInTime;
		this.checkOutTime = checkOutTime;
		this.stayNight = stayNight;
		this.stayDay = stayDay;
		this.bookableDateBegin = bookableDateBegin;
		this.bookableDateEnd = bookableDateEnd;
		this.price = price;
		this.photo = photo;
		this.thumbNailPhoto = thumbNailPhoto;
		this.title = title;
		this.ranking = ranking;
	}
	public int getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMaxCapacity() {
		return maxCapacity;
	}
	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
	}
	public int getBedroom() {
		return bedroom;
	}
	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}
	public int getBathroom() {
		return bathroom;
	}
	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}
	public String[] getUtilities() {
		return utilities;
	}
	public void setUtilities(String[] utilities) {
		this.utilities = utilities;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String[] getSpaces() {
		return spaces;
	}
	public void setSpaces(String[] spaces) {
		this.spaces = spaces;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String[] getRules() {
		return rules;
	}
	public void setRules(String[] rules) {
		this.rules = rules;
	}
	public int getCheckInInterval() {
		return checkInInterval;
	}
	public void setCheckInInterval(int checkInInterval) {
		this.checkInInterval = checkInInterval;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public int getStayNight() {
		return stayNight;
	}
	public void setStayNight(int stayNight) {
		this.stayNight = stayNight;
	}
	public int getStayDay() {
		return stayDay;
	}
	public void setStayDay(int stayDay) {
		this.stayDay = stayDay;
	}
	public Date getBookableDateBegin() {
		return bookableDateBegin;
	}
	public void setBookableDateBegin(Date bookableDateBegin) {
		this.bookableDateBegin = bookableDateBegin;
	}
	public Date getBookableDateEnd() {
		return bookableDateEnd;
	}
	public void setBookableDateEnd(Date bookableDateEnd) {
		this.bookableDateEnd = bookableDateEnd;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getThumbNailPhoto() {
		return thumbNailPhoto;
	}
	public void setThumbNailPhoto(String thumbNailPhoto) {
		this.thumbNailPhoto = thumbNailPhoto;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	@Override
	public String toString() {
		return "HouseVO [houseNo=" + houseNo + ", memNo=" + memNo + ", type=" + type + ", maxCapacity="
				+ maxCapacity + ", bedroom=" + bedroom + ", bathroom=" + bathroom + ", utilities="
				+ Arrays.toString(utilities) + ", location=" + location + ", spaces=" + Arrays.toString(spaces)
				+ ", info=" + info + ", rules=" + Arrays.toString(rules) + ", checkInInterval=" + checkInInterval
				+ ", checkInTime=" + checkInTime + ", checkOutTime=" + checkOutTime + ", stayNight=" + stayNight
				+ ", stayDay=" + stayDay + ", bookableDateBegin=" + bookableDateBegin + ", bookableDateEnd="
				+ bookableDateEnd + ", price=" + price + ", photo=" + photo + ", thumbNailPhoto=" + thumbNailPhoto
				+ ", title=" + title + ", ranking=" + ranking + "]";
	}
	
	

	
}
