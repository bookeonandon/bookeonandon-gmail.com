package com.kh.library.model.vo;

public class Library {

	private int memberNo;
	private int bookNo;
	private String purchased;
	
	public Library() {
		
	}

	public Library(int memberNo, int bookNo, String purchased) {
		super();
		this.memberNo = memberNo;
		this.bookNo = bookNo;
		this.purchased = purchased;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getPurchased() {
		return purchased;
	}

	public void setPurchased(String purchased) {
		this.purchased = purchased;
	}

	@Override
	public String toString() {
		return "Library [memberNo=" + memberNo + ", bookNo=" + bookNo + ", purchased=" + purchased + "]";
	}
	
	
	
}
