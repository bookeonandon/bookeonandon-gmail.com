package com.kh.event.model.vo;

import java.sql.Date;

public class Event {
	
	
	private int eventNo;			// 작성된 이벤트 글번호
	private String eventTitle;		// 이벤트 제목
	private Date eventDate;		// 이벤트 적용일자
	private Date eventDay;			// 이벤트 작성일자
	private String eventImg;		// 이벤트 상세 이미지
	private String eventThumbnail;	// 이벤트 썸네일 이미지
	private String eventWriter;		// 이벤트 작성자
	
	
	public Event() {
		
	}
	
	
	
	public Event(int eventNo, String eventTitle, Date eventDate, String eventImg, String eventThumbnail) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventDate = eventDate;
		this.eventImg = eventImg;
		this.eventThumbnail = eventThumbnail;
	}



	public Event(int eventNo, String eventTitle, Date eventDate, Date eventDay, String eventImg, String eventThumbnail,
			String eventWriter) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventDate = eventDate;
		this.eventDay = eventDay;
		this.eventImg = eventImg;
		this.eventThumbnail = eventThumbnail;
		this.eventWriter = eventWriter;
	}


	public int getEventNo() {
		return eventNo;
	}


	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}


	public String getEventTitle() {
		return eventTitle;
	}


	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}


	public Date getEventDate() {
		return eventDate;
	}


	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}


	public Date getEventDay() {
		return eventDay;
	}


	public void setEventDay(Date eventDay) {
		this.eventDay = eventDay;
	}


	public String getEventImg() {
		return eventImg;
	}


	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}


	public String getEventThumbnail() {
		return eventThumbnail;
	}


	public void setEventThumbnail(String eventThumbnail) {
		this.eventThumbnail = eventThumbnail;
	}


	public String getEventWriter() {
		return eventWriter;
	}


	public void setEventWriter(String eventWriter) {
		this.eventWriter = eventWriter;
	}


	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventDate=" + eventDate + ", eventDay="
				+ eventDay + ", eventImg=" + eventImg + ", eventThumbnail=" + eventThumbnail + ", eventWriter="
				+ eventWriter + "]";
	}

	

}
