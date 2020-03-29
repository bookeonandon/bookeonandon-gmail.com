package com.kh.meet.model.vo;

import java.sql.Timestamp;

public class Meeting {

	private int RoomNo;
	private String meetLocation;
	private Timestamp meetTime;
	private String meetContent;
	
	public Meeting() {
		
	}

	public Meeting(int roomNo, String meetLocation, Timestamp meetTime, String meetContent) {
		super();
		RoomNo = roomNo;
		this.meetLocation = meetLocation;
		this.meetTime = meetTime;
		this.meetContent = meetContent;
	}
	
	public int getRoomNo() {
		return RoomNo;
	}

	public void setRoomNo(int roomNo) {
		RoomNo = roomNo;
	}

	public String getMeetLocation() {
		return meetLocation;
	}

	public void setMeetLocation(String meetLocation) {
		this.meetLocation = meetLocation;
	}

	public Timestamp getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(Timestamp meetTime) {
		this.meetTime = meetTime;
	}

	public String getMeetContent() {
		return meetContent;
	}

	public void setMeetContent(String meetContent) {
		this.meetContent = meetContent;
	}

	@Override
	public String toString() {
		return "Meeting [RoomNo=" + RoomNo + ", meetLocation=" + meetLocation + ", meetTime=" + meetTime
				+ ", meetContent=" + meetContent + "]";
	}
	
	
}
