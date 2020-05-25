package edu.spring.homeshare.domain;

import java.sql.Date;

public class ReplyVO {
	private int rno;
	private int houseNo;
	private String content;
	private String memId;
	private Date regdate;
	private int replyScore;
	private int cleanScore;
	private int checkinScore;
	
	public ReplyVO() {}

	public ReplyVO(int rno, int houseNo, String content, String memId, Date regdate, int replyScore, int cleanScore,
			int checkinScore) {
		super();
		this.rno = rno;
		this.houseNo = houseNo;
		this.content = content;
		this.memId = memId;
		this.regdate = regdate;
		this.replyScore = replyScore;
		this.cleanScore = cleanScore;
		this.checkinScore = checkinScore;
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

	public int getReplyScore() {
		return replyScore;
	}

	public void setReplyScore(int replyScore) {
		this.replyScore = replyScore;
	}

	public int getCleanScore() {
		return cleanScore;
	}

	public void setCleanScore(int cleanScore) {
		this.cleanScore = cleanScore;
	}

	public int getCheckinScore() {
		return checkinScore;
	}

	public void setCheckinScore(int checkinScore) {
		this.checkinScore = checkinScore;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", houseNo=" + houseNo + ", content=" + content + ", memId=" + memId
				+ ", regdate=" + regdate + ", score=" + replyScore + ", cleanScore=" + cleanScore + ", checkinScore="
				+ checkinScore + "]";
	}
	
	
}
