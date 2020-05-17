package edu.spring.homeshare.domain;

public class ReportVO {
	private int reportNo;
	private int reportMemNo;
	private int reportHouseNo;
	private String reason;
	
	public ReportVO() {}

	public ReportVO(int reportNo, int reportMemNo, int reportHouseNo, String reason) {
		super();
		this.reportNo = reportNo;
		this.reportMemNo = reportMemNo;
		this.reportHouseNo = reportHouseNo;
		this.reason = reason;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportMemNo() {
		return reportMemNo;
	}

	public void setReportMemNo(int reportMemNo) {
		this.reportMemNo = reportMemNo;
	}

	public int getReportHouseNo() {
		return reportHouseNo;
	}

	public void setReportHouseNo(int reportHouseNo) {
		this.reportHouseNo = reportHouseNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportMemNo=" + reportMemNo + ", reportHouseNo=" + reportHouseNo
				+ ", reason=" + reason + "]";
	};
	

	
}
