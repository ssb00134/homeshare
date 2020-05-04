package edu.spring.homeshare.domain;

public class memberVO {
	private int memNo;
	private String memId;
	private String password;
	private String email;
	private String houseNo;
	private String account;
	private String memName;
	
	public memberVO() {}

	
	

	public memberVO(int memNo, String memId, String password, String email, String houseNo, String account,
			String memName) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.password = password;
		this.email = email;
		this.houseNo = houseNo;
		this.account = account;
		this.memName = memName;
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


	@Override
	public String toString() {
		return "memberVO [memNo=" + memNo + ", memId=" + memId + ", password=" + password + ", email=" + email
				+ ", houseNo=" + houseNo + ", account=" + account + ", memName=" + memName + "]";
	}
	
	
	
	
	
	
	
	
	
}
