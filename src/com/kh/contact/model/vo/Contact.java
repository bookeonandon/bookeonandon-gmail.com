package com.kh.contact.model.vo;

import java.util.Date;

public class Contact {
	
	private int ContactNo;			// 1:1 문의 게시글 번호
	private int ContactType;		// 1:1 문의 게시글 유형
	private String ContactTitle;	// 1:1 문의 게시글 제목
	private String ContactContent;	// 1:1 문의 게시글 내용
	private Date ContactDate;		// 1:1 문의 게시글 작성일
	private String ContactStatus;	// 1:1 문의 게시글 상태 (Y: 답변완료  N: 미답변)
	private Date ContactReDate;		// 1:1 문의 답변 작성일
	private String Comment;			// 1:1 문의 답변 내용
	private String ContactWriter;	// 1:1 문의 작성자
	private String ContactReWriter; // 1:1 문의 답변자
	
	
	public Contact() {
		
	}
	
	
	




	public Contact(int contactNo, int contactType, String contactTitle, String contactContent, Date contactDate,
			String contactStatus, String comment, String contactWriter) {
		super();
		ContactNo = contactNo;
		ContactType = contactType;
		ContactTitle = contactTitle;
		ContactContent = contactContent;
		ContactDate = contactDate;
		ContactStatus = contactStatus;
		Comment = comment;
		ContactWriter = contactWriter;
	}







	public Contact(int contactNo, int contactType, String contactTitle, String contactContent, Date contactDate,
			String contactStatus, Date contactReDate, String comment, String contactWriter, String contactReWriter) {
		super();
		ContactNo = contactNo;
		ContactType = contactType;
		ContactTitle = contactTitle;
		ContactContent = contactContent;
		ContactDate = contactDate;
		ContactStatus = contactStatus;
		ContactReDate = contactReDate;
		Comment = comment;
		ContactWriter = contactWriter;
		ContactReWriter = contactReWriter;
	}


	public int getContactNo() {
		return ContactNo;
	}


	public void setContactNo(int contactNo) {
		ContactNo = contactNo;
	}


	public int getContactType() {
		return ContactType;
	}


	public void setContactType(int contactType) {
		ContactType = contactType;
	}


	public String getContactTitle() {
		return ContactTitle;
	}


	public void setContactTitle(String contactTitle) {
		ContactTitle = contactTitle;
	}


	public String getContactContent() {
		return ContactContent;
	}


	public void setContactContent(String contactContent) {
		ContactContent = contactContent;
	}


	public Date getContactDate() {
		return ContactDate;
	}


	public void setContactDate(Date contactDate) {
		ContactDate = contactDate;
	}


	public String getContactStatus() {
		return ContactStatus;
	}


	public void setContactStatus(String contactStatus) {
		ContactStatus = contactStatus;
	}


	public Date getContactReDate() {
		return ContactReDate;
	}


	public void setContactReDate(Date contactReDate) {
		ContactReDate = contactReDate;
	}


	public String getComment() {
		return Comment;
	}


	public void setComment(String comment) {
		Comment = comment;
	}


	public String getContactWriter() {
		return ContactWriter;
	}


	public void setContactWriter(String contactWriter) {
		ContactWriter = contactWriter;
	}


	public String getContactReWriter() {
		return ContactReWriter;
	}


	public void setContactReWriter(String contactReWriter) {
		ContactReWriter = contactReWriter;
	}


	@Override
	public String toString() {
		return "Contact [ContactNo=" + ContactNo + ", ContactType=" + ContactType + ", ContactTitle=" + ContactTitle
				+ ", ContactContent=" + ContactContent + ", ContactDate=" + ContactDate + ", ContactStatus="
				+ ContactStatus + ", ContactReDate=" + ContactReDate + ", Comment=" + Comment + ", ContactWriter="
				+ ContactWriter + ", ContactReWriter=" + ContactReWriter + "]";
	}
	
	
	
	
	
	

}
