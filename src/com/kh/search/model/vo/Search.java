package com.kh.search.model.vo;

import java.sql.Date;

public class Search {

	private String keyword;		// 검색키워드
	private int keywordCount;	// 검색키워드 카운트
	private Date searchDate;	// 검색날짜
	private int userNo;			// 회원번호
	private String title;		// 책제목
	private String author;		// 작가
	private String publisher;	// 출판사
	private String introduction;// 책소개
	private String thumbnail;	// 썸네일
	private double starRating;		// 별점평균
	private int reviewCount;	// 리뷰수
	private int bookNo;			// 책번호
	
	public Search() {
		
	}

	public Search(String keyword, int keywordCount, Date searchDate, int userNo, String title, String author,
			String publisher, String introduction, String thumbnail, double starRating, int reviewCount) {
		super();
		this.keyword = keyword;
		this.keywordCount = keywordCount;
		this.searchDate = searchDate;
		this.userNo = userNo;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.introduction = introduction;
		this.thumbnail = thumbnail;
		this.starRating = starRating;
		this.reviewCount = reviewCount;
	}

	public Search(int bookNo, String title, String thumbnail, String author, double starRating, String introduction, String publisher, int reviewCount) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.thumbnail = thumbnail;
		this.author = author;
		this.starRating = starRating;
		this.introduction = introduction;
		this.publisher = publisher;
		this.reviewCount = reviewCount;
	}
		
	public Search(String keyword, int keywordCount, Date searchDate, int userNo) {
		super();
		this.keyword = keyword;
		this.keywordCount = keywordCount;
		this.searchDate = searchDate;
		this.userNo = userNo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getKeywordCount() {
		return keywordCount;
	}

	public void setKeywordCount(int keywordCount) {
		this.keywordCount = keywordCount;
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public double getStarRating() {
		return starRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}
	

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	@Override
	public String toString() {
		return "Search [keyword=" + keyword + ", keywordCount=" + keywordCount + ", searchDate=" + searchDate
				+ ", userNo=" + userNo + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", introduction=" + introduction + ", thumbnail=" + thumbnail + ", starRating=" + starRating
				+ ", reviewCount=" + reviewCount + ", bookNo=" + bookNo + "]";
	}




}
