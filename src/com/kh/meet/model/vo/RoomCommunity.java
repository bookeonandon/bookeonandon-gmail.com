package com.kh.meet.model.vo;

import java.sql.Date;

public class RoomCommunity {
	private int cmmmtNo;
	private String cmmmtCntnt;
	private Date createDate;
	private String memberName;
	private int memberNo;
	private int roomNo;
	private String status;
	
	public RoomCommunity(int cmmmtNo, String cmmmtCntnt, Date createDate, String memberName, int memberNo, int roomNo,
			String status) {
		super();
		this.cmmmtNo = cmmmtNo;
		this.cmmmtCntnt = cmmmtCntnt;
		this.createDate = createDate;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.status = status;
	}
	
	public int getCmmmtNo() {
		return cmmmtNo;
	}
	public void setCmmmtNo(int cmmmtNo) {
		this.cmmmtNo = cmmmtNo;
	}
	public String getCmmmtCntnt() {
		return cmmmtCntnt;
	}
	public void setCmmmtCntnt(String cmmmtCntnt) {
		this.cmmmtCntnt = cmmmtCntnt;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RoomCommunity [cmmmtNo=" + cmmmtNo + ", cmmmtCntnt=" + cmmmtCntnt + ", createDate=" + createDate
				+ ", memberName=" + memberName + ", memberNo=" + memberNo + ", roomNo=" + roomNo + ", status=" + status
				+ "]";
	}
	
}