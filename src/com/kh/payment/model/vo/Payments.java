package com.kh.payment.model.vo;

import java.sql.Date;

public class Payments {

	private int rowNum;
	private int payNo;
	private String title;
	private Date payDate;
	private int payPrice;
	private String payType;
	private int member_no;
	private int book_no;
	
	public Payments() {}

	public Payments(int rowNum, int payNo, String title, Date payDate, int payPrice, String payType, int member_no,
			int book_no) {
		super();
		this.rowNum = rowNum;
		this.payNo = payNo;
		this.title = title;
		this.payDate = payDate;
		this.payPrice = payPrice;
		this.payType = payType;
		this.member_no = member_no;
		this.book_no = book_no;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	@Override
	public String toString() {
		return "Payments [rowNum=" + rowNum + ", payNo=" + payNo + ", title=" + title + ", payDate=" + payDate
				+ ", payPrice=" + payPrice + ", payType=" + payType + ", member_no=" + member_no + ", book_no="
				+ book_no + "]";
	}

}