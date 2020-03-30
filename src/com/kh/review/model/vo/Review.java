package com.kh.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;			// 리뷰 글번호
	private int bookRating;			// 사용자가 부여할 책 평점
	private String reviewContent;	// 리뷰 내용
	private Date reviewDate;			// 리뷰 작성일
	private int recommend;			// 리뷰 추천수
	private int reportTime;			// 리뷰 신고수
	private int reviewHit;			// 리뷰 조회수
	private String bookTitle;		// 작성한 리뷰의 대상이 되는 책 제목  !int로 BookNo 받을거면 변수랑 매개변수 생성자 따로 추가해야 함
	private String writer;			// 리뷰 작성자
	private String reviewStatus;	// 리뷰 상태 (Y: 게시 N:삭제)
	
	private String nickName;		// 리뷰 작성자 닉네임
	
	
	private int starRating;
	private int hits;
	private int bookNo;
	private int memberNo;
	private String memberId;
	
	
	public Review() {
	
	}

	


	// 관리자 리스트 조회용
	public Review(int reviewNo, int bookRating, String reviewContent, Date reviewDate, int recommend, int reportTime,
			String bookTitle, String writer, String reviewStatus, String nickName) {
		super();
		this.reviewNo = reviewNo;
		this.bookRating = bookRating;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.recommend = recommend;
		this.reportTime = reportTime;
		this.bookTitle = bookTitle;
		this.writer = writer;
		this.reviewStatus = reviewStatus;
		this.nickName = nickName;
	}








	public Review(int reviewNo, int bookRating, String reviewContent, Date reviewDate, int recommend, int reportTime,
			int reviewHit, String bookTitle, String writer, String reviewStatus, String nickName) {
		super();
		this.reviewNo = reviewNo;
		this.bookRating = bookRating;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.recommend = recommend;
		this.reportTime = reportTime;
		this.reviewHit = reviewHit;
		this.bookTitle = bookTitle;
		this.writer = writer;
		this.reviewStatus = reviewStatus;
		this.nickName = nickName;
	}
	
	
	public Review(int reviewNo, int starRating, String reviewContent, Date reviewDate, int recommend, int reportTime,
			int hits, int bookNo, int memberNo, String reviewStatus, String memberId) {
		super();
		this.reviewNo = reviewNo;
		this.starRating = starRating;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.recommend = recommend;
		this.reportTime = reportTime;
		this.hits = hits;
		this.bookNo = bookNo;
		this.memberNo = memberNo;
		this.reviewStatus = reviewStatus;
		this.memberId = memberId;
	}




	public int getReviewNo() {
		return reviewNo;
	}




	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}




	public int getBookRating() {
		return bookRating;
	}




	public void setBookRating(int bookRating) {
		this.bookRating = bookRating;
	}




	public String getReviewContent() {
		return reviewContent;
	}




	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}




	public Date getReviewDate() {
		return reviewDate;
	}




	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}




	public int getRecommend() {
		return recommend;
	}




	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}




	public int getStarRating() {
		return starRating;
	}




	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}




	public int getHits() {
		return hits;
	}




	public void setHits(int hits) {
		this.hits = hits;
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




	public String getMemberId() {
		return memberId;
	}




	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}




	public int getReportTime() {
		return reportTime;
	}




	public void setReportTime(int reportTime) {
		this.reportTime = reportTime;
	}




	public int getReviewHit() {
		return reviewHit;
	}




	public void setReviewHit(int reviewHit) {
		this.reviewHit = reviewHit;
	}




	public String getBookTitle() {
		return bookTitle;
	}




	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}




	public String getWriter() {
		return writer;
	}




	public void setWriter(String writer) {
		this.writer = writer;
	}




	public String getReviewStatus() {
		return reviewStatus;
	}




	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}




	public String getNickName() {
		return nickName;
	}




	public void setNickName(String nickName) {
		this.nickName = nickName;
	}




	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", bookRating=" + bookRating + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", recommend=" + recommend + ", reportTime=" + reportTime
				+ ", reviewHit=" + reviewHit + ", bookTitle=" + bookTitle + ", writer=" + writer + ", reviewStatus="
				+ reviewStatus + ", nickName=" + nickName + ", starRating=" + starRating + ", hits=" + hits
				+ ", bookNo=" + bookNo + ", memberNo=" + memberNo + ", memberId=" + memberId + "]";
	}







	

}
