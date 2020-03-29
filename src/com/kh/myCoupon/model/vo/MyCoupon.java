package com.kh.myCoupon.model.vo;

import java.sql.Date;

public class MyCoupon {
	
	//쿠폰명 이용시작일 만료일자 적용범위
	private String userId;		// 유저번호
	private String cName;		// 쿠폰명
	private Date cStart;		// 쿠폰 시작일
	private Date cLast;			// 쿠폰 종료일
	private Date cUDate;		// 쿠폰 사용일
	private Date cStatus;		// 쿠폰 상태 (Y: 사용, N: 미사용)
	
	private int cNo;			// 쿠폰번호
	
	
	public MyCoupon() {
		
	}
	


	public MyCoupon(String userId, String cName, Date cStart, Date cLast, int cNo) {
		super();
		this.userId = userId;
		this.cName = cName;
		this.cStart = cStart;
		this.cLast = cLast;
		this.cNo = cNo;
	}



	public MyCoupon(String userId, String cName, Date cStart, Date cLast, Date cUDate, Date cStatus) {
		super();
		this.userId = userId;
		this.cName = cName;
		this.cStart = cStart;
		this.cLast = cLast;
		this.cUDate = cUDate;
		this.cStatus = cStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public Date getcStart() {
		return cStart;
	}

	public void setcStart(Date cStart) {
		this.cStart = cStart;
	}

	public Date getcLast() {
		return cLast;
	}

	public void setcLast(Date cLast) {
		this.cLast = cLast;
	}

	public Date getcUDate() {
		return cUDate;
	}

	public void setcUDate(Date cUDate) {
		this.cUDate = cUDate;
	}

	public Date getcStatus() {
		return cStatus;
	}

	public void setcStatus(Date cStatus) {
		this.cStatus = cStatus;
	}
	
	

	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}






	@Override
	public String toString() {
		return "MyCoupon [userId=" + userId + ", cName=" + cName + ", cStart=" + cStart + ", cLast=" + cLast
				+ ", cUDate=" + cUDate + ", cStatus=" + cStatus + "]";
	}
	
	
	
	
	
	

}
