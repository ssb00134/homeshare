package edu.spring.homeshare.domain;

public class ReportVO {
	private int reportNo;
	private int memNo;
	private int houseNo;
	private int reason;
	
	public ReportVO() {};
	
	public ReportVO(int reportNo, int memNo, int houseNo, int reason) {
		super();
		this.reportNo = reportNo;
		this.memNo = memNo;
		this.houseNo = houseNo;
		this.reason = reason;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(int houseNo) {
		this.houseNo = houseNo;
	}

	public int getReason() {
		return reason;
	}

	public void setReason(int reason) {
		this.reason = reason;
	}
	
	
	
	
}
