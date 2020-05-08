package edu.spring.homeshare.domain;

import java.sql.Date;

public class ReplyVO {
	private int rno;
	private int houseNo;
	private String content;
	private String memId;
	private Date regdate;
	private int scope;
	private int cleannessScope;
	private int checkinScope;
	
	public ReplyVO() {}

	public ReplyVO(int rno, int houseNo, String content, String memId, Date regdate, int scope, int cleannessScope,
			int checkinScope) {
		super();
		this.rno = rno;
		this.houseNo = houseNo;
		this.content = content;
		this.memId = memId;
		this.regdate = regdate;
		this.scope = scope;
		this.cleannessScope = cleannessScope;
		this.checkinScope = checkinScope;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getScope() {
		return scope;
	}

	public void setScope(int scope) {
		this.scope = scope;
	}

	public int getCleannessScope() {
		return cleannessScope;
	}

	public void setCleannessScope(int cleannessScope) {
		this.cleannessScope = cleannessScope;
	}

	public int getCheckinScope() {
		return checkinScope;
	}

	public void setCheckinScope(int checkinScope) {
		this.checkinScope = checkinScope;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", houseNo=" + houseNo + ", content=" + content + ", memId=" + memId
				+ ", regdate=" + regdate + ", scope=" + scope + ", cleannessScope=" + cleannessScope + ", checkinScope="
				+ checkinScope + "]";
	}
	
	
}
