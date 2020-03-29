package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {
	
	private int subPayNo;			// 결제번호
	private Date subPayDate;		// 결제일
	private int payPrice;			// 결제금액
	private String subStatus;		// 구독권 상태 (Y:존재  N:삭제)
	private String subRefund;		// 구독권 환불유무 (Y: 환불, N: 미환불)
	private String userId;			// 구매자 아이디
	private String userName;		// 구매자 이름
	private String sbName;			// 구매한 구독권명
	private String payType;			// 구매방법
	
	
	private int subPayCount;		// 구독권 한달 내 총 구매
	private int rNum;				// rownum 받아줄 변수
	private String userNick;		// 구매자 닉네임
	
	private String bName;			// 구매한 도서명
	
	public Payment() {
		
	}
	
	
	// 한 달 내 구독권 구매수 + 도서 조회용
	public Payment(int subPayCount) {
		super();
		this.subPayCount = subPayCount;
	}
	
	
	// 가장 많이 구매한 구독권 조회용 + 도서 조회용
	public Payment(String sbName) {
		super();
		this.sbName = sbName;
	}
	


	// 최근 구독권 구매자 다섯명 + 도서 조회용
	public Payment(int payPrice, String userId, String sbName, Date subPayDate, int rNum, String userNick) {
		super();
		this.payPrice = payPrice;
		this.userId = userId;
		this.sbName = sbName;
		this.subPayDate = subPayDate;
		this.rNum = rNum;
		this.userNick = userNick;
	}
	
	
	
	// 최근 책 리스트 조회
	public Payment(int subPayNo, Date subPayDate, int payPrice, String userId, String userName, String payType,
			String bName) {
		super();
		this.subPayNo = subPayNo;
		this.subPayDate = subPayDate;
		this.payPrice = payPrice;
		this.userId = userId;
		this.userName = userName;
		this.payType = payType;
		this.bName = bName;
	}


	public Payment(int subPayNo, Date subPayDate, int payPrice, String subStatus, String subRefund, String userId,
			String userName, String sbName) {
		super();
		this.subPayNo = subPayNo;
		this.subPayDate = subPayDate;
		this.payPrice = payPrice;
		this.subStatus = subStatus;
		this.subRefund = subRefund;
		this.userId = userId;
		this.userName = userName;
		this.sbName = sbName;
	}
	
	

	public int getSubPayNo() {
		return subPayNo;
	}
	public void setSubPayNo(int subPayNo) {
		this.subPayNo = subPayNo;
	}
	public Date getSubPayDate() {
		return subPayDate;
	}
	public void setSubPayDate(Date subPayDate) {
		this.subPayDate = subPayDate;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getSubRefund() {
		return subRefund;
	}
	public void setSubRefund(String subRefund) {
		this.subRefund = subRefund;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSbName() {
		return sbName;
	}
	public void setSbName(String sbName) {
		this.sbName = sbName;
	}
	
	
	public int getSubPayCount() {
		return subPayCount;
	}


	public void setSubPayCount(int subPayCount) {
		this.subPayCount = subPayCount;
	}


	public String getSubStatus() {
		return subStatus;
	}

	public void setSubStatus(String subStatus) {
		this.subStatus = subStatus;
	}
	

	public int getrNum() {
		return rNum;
	}


	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	

	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	
	


	public String getbName() {
		return bName;
	}


	public void setbName(String bName) {
		this.bName = bName;
	}
	
	


	public String getPayType() {
		return payType;
	}


	public void setPayType(String payType) {
		this.payType = payType;
	}


	@Override
	public String toString() {
		return "Payment [subPayNo=" + subPayNo + ", subPayDate=" + subPayDate + ", payPrice=" + payPrice
				+ ", subRefund=" + subRefund + ", subStatus=" + subStatus + ", userId=" + userId + ", userName="
				+ userName + ", sbName=" + sbName + "]";
	}

	
	
	
	
	
	
	

}
