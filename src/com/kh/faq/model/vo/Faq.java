package com.kh.faq.model.vo;

import java.util.Date;

public class Faq {
	
	private int faqNo; 			// faq 번호
	private int faqType;		// faq 유형 (1. 자주묻는질문, 2. 서비스이용, 3. MEET&ON, 4.결제/환불)
	private String faqTitle;	// faq 제목
	private String faqContent;	// faq 내용
	private Date faqDate;		// faq 작성일자
	private String faqWriter;	// faq 작성자
	
	public Faq() {
		
	}
	
	
	// 타입별 faq 조회용
	public Faq(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}



	public Faq(int faqNo, int faqType, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.faqType = faqType;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}



	public Faq(int faqNo, int faqType, String faqTitle, String faqContent, Date faqDate, String faqWriter) {
		super();
		this.faqNo = faqNo;
		this.faqType = faqType;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqWriter = faqWriter;
	}
	
	

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getFaqType() {
		return faqType;
	}

	public void setFaqType(int faqType) {
		this.faqType = faqType;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqType=" + faqType + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ ", faqDate=" + faqDate + ", faqWriter=" + faqWriter + "]";
	}

	
	
}
