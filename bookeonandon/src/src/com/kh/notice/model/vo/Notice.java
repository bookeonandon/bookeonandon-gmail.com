package com.kh.notice.model.vo;

import java.util.Date;

public class Notice {
	
	private int noticeNo;		// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent;	// 공지사항 내용
	private Date noticeDate;		// 공지사항 작성일
	private String noticeWriter;	// 공지사항 작성자
	
	
	public Notice() {
		
	}
	
	


	public Notice(int noticeNo, String noticeTitle, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}



	// 사용자 공지사항  리스트
	public Notice(String noticeTitle, Date noticeDate, String noticeContent ) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
	}




	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String noticeWriter) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeWriter = noticeWriter;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getNoticeDate() {
		return noticeDate;
	}


	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}


	public String getNoticeWriter() {
		return noticeWriter;
	}


	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeWriter=" + noticeWriter + "]";
	}
	
	
	
	

}
