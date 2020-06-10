package edu.spring.homeshare.domain;

public class MemberVO {
	private int memNo;
	private String memId;
	private String password;
	private String email;
	private int houseCount;
	private String account;
	private String memName;
	private String gender;
	
	public MemberVO() {}

	public MemberVO(int memNo, String memId, String password, String email, int houseCount, String account, String memName, String gender) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.password = password;
		this.email = email;
		this.houseCount = houseCount;
		this.account = account;
		this.memName = memName;
		this.gender = gender;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getHouseCount() {
		return houseCount;
	}

	public void setHouseCount(int houseCount) {
		this.houseCount = houseCount;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memId=" + memId + ", password=" + password + ", email=" + email + ", houseCount=" + houseCount + ", account=" + account + ", memName=" + memName + ", gender=" + gender + "]";
	}


	

	
	
	
	
	
	
	
	
	
	
}
