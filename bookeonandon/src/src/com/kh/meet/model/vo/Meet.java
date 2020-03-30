package com.kh.meet.model.vo;

import java.sql.Date;

public class Meet {

	int roomNo;				// 모임방 번호
	String roomTitle;		// 모임방 제목
	String roomContent;		// 모임방 설명
	int roomTotalPP;		// 모임방 총인원
	int roomNowPP;			// 모임방 현재인원
	String genre;			// 모임방 장르
	int  bookNo;			// 책번호
	int memberNo;			// 회원번호(방장번호)
	Date createDate;		// 만든날짜
	String status;			// 삭제상태
	String bookImg;			// 책이미지
	
	
	public int getRoomNo() {
		return roomNo;
	}

	

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}



	public String getRoomTitle() {
		return roomTitle;
	}



	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}



	public String getRoomContent() {
		return roomContent;
	}



	public void setRoomContent(String roomContent) {
		this.roomContent = roomContent;
	}



	public int getRoomTotalPP() {
		return roomTotalPP;
	}



	public void setRoomTotalPP(int roomTotalPP) {
		this.roomTotalPP = roomTotalPP;
	}



	public int getRoomNowPP() {
		return roomNowPP;
	}



	public void setRoomNowPP(int roomNowPP) {
		this.roomNowPP = roomNowPP;
	}



	public String getGenre() {
		return genre;
	}



	public void setGenre(String genre) {
		this.genre = genre;
	}



	public int getBookNo() {
		return bookNo;
	}



	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getBookImg() {
		return bookImg;
	}



	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}



	public Meet(int roomNo, String roomTitle, String roomContent, int roomTotalPP, int roomNowPP, String genre,
			int bookNo, int memberNo, Date createDate, String status, String bookImg) {
		super();
		this.roomNo = roomNo;
		this.roomTitle = roomTitle;
		this.roomContent = roomContent;
		this.roomTotalPP = roomTotalPP;
		this.roomNowPP = roomNowPP;
		this.genre = genre;
		this.bookNo = bookNo;
		this.memberNo = memberNo;
		this.createDate = createDate;
		this.status = status;
		this.bookImg = bookImg;
	}



	@Override
	public String toString() {
		return "Meet [roomNo=" + roomNo + ", roomTitle=" + roomTitle + ", roomContent=" + roomContent + ", roomTotalPP="
				+ roomTotalPP + ", roomNowPP=" + roomNowPP + ", genre=" + genre + ", bookNo=" + bookNo + ", memberNo="
				+ memberNo + ", createDate=" + createDate + ", status=" + status + ", bookImg=" + bookImg + "]";
	}
	
	
}
