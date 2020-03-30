package com.kh.book.model.vo;

import java.sql.Date;

public class Book {

	private int bookNo;
	private String title;
	private String subTitle;
	private String author;
	private String publisher;
	private String translator;
	private int price;
	private int page;
	private double starRating;
	private int reviewCount;
	private Date issueDate;
	private String introduction;
	private String publisherNotice;
	private String contents;
	private String bookContent;
	private String originThumbnail;
	private String moThumbnail;
	private String mainCategory;
	private String subCategory;
	private String adult;
	
	public Book() {
		
	}

	public Book(int bookNo, String title, String subTitle, String author, String publisher, String translator,
			int price, int page, double starRating, int reviewCount, Date issueDate, String introduction,
			String publisherNotice, String contents, String bookContent, String originThumbnail, String moThumbnail,
			String mainCategory, String subCategory, String adult) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.subTitle = subTitle;
		this.author = author;
		this.publisher = publisher;
		this.translator = translator;
		this.price = price;
		this.page = page;
		this.starRating = starRating;
		this.reviewCount = reviewCount;
		this.issueDate = issueDate;
		this.introduction = introduction;
		this.publisherNotice = publisherNotice;
		this.contents = contents;
		this.bookContent = bookContent;
		this.originThumbnail = originThumbnail;
		this.moThumbnail = moThumbnail;
		this.mainCategory = mainCategory;
		this.subCategory = subCategory;
		this.adult = adult;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
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

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public double getStarRating() {
		return starRating;
	}

	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPublisherNotice() {
		return publisherNotice;
	}

	public void setPublisherNotice(String publisherNotice) {
		this.publisherNotice = publisherNotice;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public String getOriginThumbnail() {
		return originThumbnail;
	}

	public void setOriginThumbnail(String originThumbnail) {
		this.originThumbnail = originThumbnail;
	}

	public String getMoThumbnail() {
		return moThumbnail;
	}

	public void setMoThumbnail(String moThumbnail) {
		this.moThumbnail = moThumbnail;
	}

	public String getMainCategory() {
		return mainCategory;
	}

	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", title=" + title + ", subTitle=" + subTitle + ", author=" + author
				+ ", publisher=" + publisher + ", translator=" + translator + ", price=" + price + ", page=" + page
				+ ", starRating=" + starRating + ", reviewCount=" + reviewCount + ", issueDate=" + issueDate
				+ ", introduction=" + introduction + ", publisherNotice=" + publisherNotice + ", contents=" + contents
				+ ", bookContent=" + bookContent + ", originThumbnail=" + originThumbnail + ", moThumbnail="
				+ moThumbnail + ", mainCategory=" + mainCategory + ", subCategory=" + subCategory + ", adult=" + adult
				+ "]";
	}

	
	
}
