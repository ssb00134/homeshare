package edu.spring.homeshare.domain;

import java.sql.Date;

public class BookVO {
	private int bookNo;
	private int bookMemNo;
	private int bookHouseNo;
	private String checkin;
	private String checkout;
	private int hostCheck;
	private int bookMem;
	private int totalPrice;
	private String bookHostId;
	
	public BookVO() {}
	
	

	



	public BookVO(int bookNo, int bookMemNo, int bookHouseNo, String checkin, String checkout, int hostCheck, int bookMem, int totalPrice, String bookHostId) {
		super();
		this.bookNo = bookNo;
		this.bookMemNo = bookMemNo;
		this.bookHouseNo = bookHouseNo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.hostCheck = hostCheck;
		this.bookMem = bookMem;
		this.totalPrice = totalPrice;
		this.bookHostId = bookHostId;
	}







	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getBookMemNo() {
		return bookMemNo;
	}

	public void setBookMemNo(int bookMemNo) {
		this.bookMemNo = bookMemNo;
	}

	public int getBookHouseNo() {
		return bookHouseNo;
	}

	public void setBookHouseNo(int bookHouseNo) {
		this.bookHouseNo = bookHouseNo;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getHostCheck() {
		return hostCheck;
	}

	public void setHostCheck(int hostCheck) {
		this.hostCheck = hostCheck;
	}
	
	public int getBookMem() {
		return bookMem;
	}



	public void setBookMem(int bookMem) {
		this.bookMem = bookMem;
	}



	public int getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	



	public String getBookHostId() {
		return bookHostId;
	}







	public void setBookHostId(String bookHostId) {
		this.bookHostId = bookHostId;
	}







	@Override
	public String toString() {
		return "BookVO [bookNo=" + bookNo + ", bookMemNo=" + bookMemNo + ", bookHouseNo=" + bookHouseNo + ", checkin=" + checkin + ", checkout=" + checkout + ", hostCheck=" + hostCheck + ", bookMem=" + bookMem + ", totalPrice=" + totalPrice + ", bookHostId=" + bookHostId + "]";
	}









	
	
	
	
}
