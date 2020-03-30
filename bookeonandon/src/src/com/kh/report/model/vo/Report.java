package com.kh.report.model.vo;

import java.sql.Date;

/**
 * @author qwbvc
 *
 */
public class Report {
	
	
	private int reportNo;				// 신고하기 글번호
	private String reportCategory;		// 신고하기 카테고리
	private Date reportDate;			// 신고일
	private String reportContent;		// 신고하기 글내용
	private String reporter;			// 신고자
	private String reported;			// 피신고자
	private String reContent;			// 리뷰 내용
	
	
	
	public Report() {
		
	}
	
	
	// 관리자 페이지 신고내역 조회
	public Report(int reportNo, String reportCategory, Date reportDate, String reportContent, String reporter,
			String reContent) {
		super();
		this.reportNo = reportNo;
		this.reportCategory = reportCategory;
		this.reportDate = reportDate;
		this.reportContent = reportContent;
		this.reporter = reporter;
		this.reContent = reContent;
	}
	



	



	public Report(int reportNo, String reportCategory, Date reportDate, String reportContent, String reporter,
			String reported, String reContent) {
		super();
		this.reportNo = reportNo;
		this.reportCategory = reportCategory;
		this.reportDate = reportDate;
		this.reportContent = reportContent;
		this.reporter = reporter;
		this.reported = reported;
		this.reContent = reContent;
	}


	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getReported() {
		return reported;
	}

	public void setReported(String reported) {
		this.reported = reported;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	
	

	public Date getReportDate() {
		return reportDate;
	}


	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}


	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportCategory=" + reportCategory + ", reportDate=" + reportDate
				+ ", reportContent=" + reportContent + ", reporter=" + reporter + ", reported=" + reported
				+ ", reContent=" + reContent + "]";
	}


	
	
	
	
	
	
	
	

}
