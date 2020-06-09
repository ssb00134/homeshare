package edu.spring.homeshare.domain;

import java.sql.Date;
import java.util.Arrays;

public class HouseVO  {
	
	private int houseNo ;
	private String type ;
	private String scope ;
	private int maxCapacity; 
	private int bedroom ;
	private int bed ;
	private int bathroom ;
	private String utilities; 
	private String spaces ;
	private String title ;
	private String info ;
	private String rules ;
	private String checkinTime ;
	private String checkoutTime ;
	private int stayNight ;
	private int stayDay ;
	private Date bookableDateBegin;
	private Date bookableDateEnd;
	private int price ;
	private int memNo ;
	private String replies ;
	private String image ;
	private int checkinInterval ;
	private double score ;
	private String location;
	private int reportCount;
	private String hostId;
	
	public HouseVO() {}


	public HouseVO(int houseNo, String type, String scope, int maxCapacity, int bedroom, int bed, int bathroom, String utilities, String spaces, String title, String info, String rules, String checkinTime, String checkoutTime, int stayNight, int stayDay, Date bookableDateBegin, Date bookableDateEnd, int price, int memNo, String replies, String image, int checkinInterval, double score, String location, int reportCount, String hostId) {
		super();
		this.houseNo = houseNo;
		this.type = type;
		this.scope = scope;
		this.maxCapacity = maxCapacity;
		this.bedroom = bedroom;
		this.bed = bed;
		this.bathroom = bathroom;
		this.utilities = utilities;
		this.spaces = spaces;
		this.title = title;
		this.info = info;
		this.rules = rules;
		this.checkinTime = checkinTime;
		this.checkoutTime = checkoutTime;
		this.stayNight = stayNight;
		this.stayDay = stayDay;
		this.bookableDateBegin = bookableDateBegin;
		this.bookableDateEnd = bookableDateEnd;
		this.price = price;
		this.memNo = memNo;
		this.replies = replies;
		this.image = image;
		this.checkinInterval = checkinInterval;
		this.score = score;
		this.location = location;
		this.reportCount = reportCount;
		this.hostId = hostId;
	}

	public int getHouseNo() {
		return houseNo;
	}


	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getScope() {
		return scope;
	}


	public void setScope(String scope) {
		this.scope = scope;
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


	public int getBed() {
		return bed;
	}


	public void setBed(int bed) {
		this.bed = bed;
	}


	public int getBathroom() {
		return bathroom;
	}


	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}


	public String getUtilities() {
		return utilities;
	}


	public void setUtilities(String utilities) {
		this.utilities = utilities;
	}


	public String getSpaces() {
		return spaces;
	}


	public void setSpaces(String spaces) {
		this.spaces = spaces;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public String getRules() {
		return rules;
	}


	public void setRules(String rules) {
		this.rules = rules;
	}


	public String getCheckinTime() {
		return checkinTime;
	}


	public void setCheckinTime(String checkinTime) {
		this.checkinTime = checkinTime;
	}


	public String getCheckoutTime() {
		return checkoutTime;
	}


	public void setCheckoutTime(String checkoutTime) {
		this.checkoutTime = checkoutTime;
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


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getReplies() {
		return replies;
	}


	public void setReplies(String replies) {
		this.replies = replies;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public int getCheckinInterval() {
		return checkinInterval;
	}


	public void setCheckinInterval(int checkinInterval) {
		this.checkinInterval = checkinInterval;
	}


	public double getScore() {
		return score;
	}


	public void setScore(double score) {
		this.score = score;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}


	
	public String getHostId() {
		return hostId;
	}


	public void setHostId(String hostId) {
		this.hostId = hostId;
	}


	@Override
	public String toString() {
		return "HouseVO [houseNo=" + houseNo + ", type=" + type + ", scope=" + scope + ", maxCapacity=" + maxCapacity + ", bedroom=" + bedroom + ", bed=" + bed + ", bathroom=" + bathroom + ", utilities=" + utilities + ", spaces=" + spaces + ", title=" + title + ", info=" + info + ", rules=" + rules + ", checkinTime=" + checkinTime + ", checkoutTime=" + checkoutTime + ", stayNight=" + stayNight + ", stayDay=" + stayDay + ", bookableDateBegin=" + bookableDateBegin + ", bookableDateEnd="
				+ bookableDateEnd + ", price=" + price + ", memNo=" + memNo + ", replies=" + replies + ", image=" + image + ", checkinInterval=" + checkinInterval + ", score=" + score + ", location=" + location + ", reportCount=" + reportCount + ", hostId=" + hostId + "]";
	}




	
	
	
	
	
	
}
