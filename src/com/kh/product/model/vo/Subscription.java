package com.kh.product.model.vo;

public class Subscription {
	
	private int sbNo;			// 구독권 번호
	private String sbName;		// 구독권 이름
	private int sbPrice;		// 구독권 가격
	private String sbContent;	// 구독권 내용
	private int sbDate;			// 구독권 기간
	private String sbStatus;	// 구독권 상태
	
	public Subscription() {
		
	}
	
	
	public Subscription(int sbNo, String sbName, int sbPrice, String sbContent, int sbDate, String sbStatus) {
		super();
		this.sbNo = sbNo;
		this.sbName = sbName;
		this.sbPrice = sbPrice;
		this.sbContent = sbContent;
		this.sbDate = sbDate;
		this.sbStatus = sbStatus;
	}


	public int getSbNo() {
		return sbNo;
	}


	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}


	public String getSbName() {
		return sbName;
	}


	public void setSbName(String sbName) {
		this.sbName = sbName;
	}


	public int getSbPrice() {
		return sbPrice;
	}


	public void setSbPrice(int sbPrice) {
		this.sbPrice = sbPrice;
	}


	public String getSbContent() {
		return sbContent;
	}


	public void setSbContent(String sbContent) {
		this.sbContent = sbContent;
	}


	public int getSbDate() {
		return sbDate;
	}


	public void setSbDate(int sbDate) {
		this.sbDate = sbDate;
	}


	public String getSbStatus() {
		return sbStatus;
	}


	public void setSbStatus(String sbStatus) {
		this.sbStatus = sbStatus;
	}


	@Override
	public String toString() {
		return "Subscription [sbNo=" + sbNo + ", sbName=" + sbName + ", sbPrice=" + sbPrice + ", sbContent=" + sbContent
				+ ", sbDate=" + sbDate + ", sbStatus=" + sbStatus + "]";
	}
	
	
	
	
	
	
}
