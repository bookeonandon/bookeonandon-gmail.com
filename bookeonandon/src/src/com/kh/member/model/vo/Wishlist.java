package com.kh.member.model.vo;

import java.sql.Date;

public class Wishlist {

	private int rowNum;
	private int member_no;
	private int book_no;
	private String book_title;
	private String book_pdf;
	private String book_image;
	private String book_moimage;
	
	public Wishlist() {}

	public Wishlist(int rowNum, int member_no, int book_no, String book_title, String book_pdf, String book_image,
			String book_moimage) {
		super();
		this.rowNum = rowNum;
		this.member_no = member_no;
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_pdf = book_pdf;
		this.book_image = book_image;
		this.book_moimage = book_moimage;
	}

	public Wishlist(int member_no, int book_no, String book_title, String book_pdf, String book_image,
			String book_moimage) {
		super();
		this.member_no = member_no;
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_pdf = book_pdf;
		this.book_image = book_image;
		this.book_moimage = book_moimage;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_pdf() {
		return book_pdf;
	}

	public void setBook_pdf(String book_pdf) {
		this.book_pdf = book_pdf;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public String getBook_moimage() {
		return book_moimage;
	}

	public void setBook_moimage(String book_moimage) {
		this.book_moimage = book_moimage;
	}

	@Override
	public String toString() {
		return "Wishlist [rowNum=" + rowNum + ", member_no=" + member_no + ", book_no=" + book_no + ", book_title="
				+ book_title + ", book_pdf=" + book_pdf + ", book_image=" + book_image + ", book_moimage="
				+ book_moimage + "]";
	}

}