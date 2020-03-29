package com.kh.mysub.model.vo;

import java.sql.Date;

public class MySub {
	
	private int userNo;			// 회원번호
	private Date sbStart;		// 보유한 구독권 시작일
	private Date sbEnd;			// 보유한 구독권 종료일
	private int sbNo;			// 보유한 구독권 번호
	private String sbStatus;	// 보유 구독권 상태
	
	private String sbName;		// 보유한 구독권명
	
	public MySub() {
		
	}
	
	public MySub(int userNo, Date sbStart, Date sbEnd, int sbNo, String sbStatus) {
		super();
		this.userNo = userNo;
		this.sbStart = sbStart;
		this.sbEnd = sbEnd;
		this.sbNo = sbNo;
		this.sbStatus = sbStatus;
	}
	
	public MySub(int userNo, Date sbStart, Date sbEnd, int sbNo, String sbStatus, String sbName) {
		super();
		this.userNo = userNo;
		this.sbStart = sbStart;
		this.sbEnd = sbEnd;
		this.sbNo = sbNo;
		this.sbStatus = sbStatus;
		this.sbName = sbName;
	}

	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getSbStart() {
		return sbStart;
	}
	public void setSbStart(Date sbStart) {
		this.sbStart = sbStart;
	}
	public Date getSbEnd() {
		return sbEnd;
	}
	public void setSbEnd(Date sbEnd) {
		this.sbEnd = sbEnd;
	}
	public int getSbNo() {
		return sbNo;
	}
	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}
	public String getSbStatus() {
		return sbStatus;
	}
	public void setSbStatus(String sbStatus) {
		this.sbStatus = sbStatus;
	}
	
	
	public String getSbName() {
		return sbName;
	}

	public void setSbName(String sbName) {
		this.sbName = sbName;
	}

	@Override
	public String toString() {
		return "MySub [userNo=" + userNo + ", sbStart=" + sbStart + ", sbEnd=" + sbEnd + ", sbNo=" + sbNo
				+ ", sbStatus=" + sbStatus + "]";
	}
	
	
	
	

}
