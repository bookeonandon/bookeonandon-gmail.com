package com.kh.coupon.model.vo;

import java.sql.Date;

public class Coupon {
	
	private int couponNo;			// 쿠폰번호
	private String couponName;		// 쿠폰명
	private String couponContent;	// 쿠폰 설명
	private int couponSale;			// 할인가
	private Date couponExp;			// 쿠폰 유효 기간
	private int couponRange;		// 쿠폰 적용 범위 (0 : 전체)
	private String couponStatus;	// 쿠폰 상태
	
	
	
	public Coupon() {
		
	}
	
	
	public Coupon(int couponNo, String couponName, String couponContent, int couponSale, Date couponExp,
			int couponRange, String couponStatus) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponContent = couponContent;
		this.couponSale = couponSale;
		this.couponExp = couponExp;
		this.couponRange = couponRange;
		this.couponStatus = couponStatus;
	}


	public int getCouponNo() {
		return couponNo;
	}


	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}


	public String getCouponName() {
		return couponName;
	}


	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}


	public String getCouponContent() {
		return couponContent;
	}


	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}


	public int getCouponSale() {
		return couponSale;
	}


	public void setCouponSale(int couponSale) {
		this.couponSale = couponSale;
	}


	public Date getCouponExp() {
		return couponExp;
	}


	public void setCouponExp(Date couponExp) {
		this.couponExp = couponExp;
	}


	public int getCouponRange() {
		return couponRange;
	}


	public void setCouponRange(int couponRange) {
		this.couponRange = couponRange;
	}


	public String getCouponStatus() {
		return couponStatus;
	}


	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}


	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponName=" + couponName + ", couponContent=" + couponContent
				+ ", couponSale=" + couponSale + ", couponExp=" + couponExp + ", couponRange=" + couponRange
				+ ", couponStatus=" + couponStatus + "]";
	}
	
	
	
	
	

}
