package edu.spring.homeshare.domain;

public class memberVO {
	public String memNo;
	public String memId;
	public String password;
	public String phone;
	public String houseNo;
	public String account;
	public String memName;
	
	public memberVO() {}
	
	public memberVO(String memNo, String memId, String password, String phone, String houseNo, String account, String memName) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.password = password;
		this.phone = phone;
		this.houseNo = houseNo;
		this.account = account;
		this.memName = memName;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	
	
	
	
}
