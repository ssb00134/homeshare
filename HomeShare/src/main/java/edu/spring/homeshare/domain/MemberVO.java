package edu.spring.homeshare.domain;

public class MemberVO {
	private int memNo;
	private String memId;
	private String password;
	private String email;
	private int houseCount;
	private String phone;
	private String memName;
	private String gender;
	private String phoneReleaseToHost;
	
	public MemberVO() {}

	public MemberVO(int memNo, String memId, String password, String email, int houseCount, String account, String memName, String gender, String phoneReleaseToHost) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.password = password;
		this.email = email;
		this.houseCount = houseCount;
		this.phone = account;
		this.memName = memName;
		this.gender = gender;
		this.phoneReleaseToHost = phoneReleaseToHost;
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
	
	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	
	

	public String getPhoneReleaseToHost() {
		return phoneReleaseToHost;
	}

	public void setPhoneReleaseToHost(String phoneReleaseToHost) {
		this.phoneReleaseToHost = phoneReleaseToHost;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memId=" + memId + ", password=" + password + ", email=" + email + ", houseCount=" + houseCount + ", account=" + phone + ", memName=" + memName + ", gender=" + gender + ", phoneReleaseToHost=" + phoneReleaseToHost + "]";
	}

	


	

	
	
	
	
	
	
	
	
	
	
}
