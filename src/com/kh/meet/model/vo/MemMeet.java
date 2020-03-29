package com.kh.meet.model.vo;

public class MemMeet {

	
	private String memName;
	private int roomNo;
	private int memberNo;
	private String memberPic;
	private String memberContent;
	private String joinYN;
	private String applyYN;
	
	public MemMeet() {
		
	}
	
	public MemMeet(String memName, int roomNo, int memberNo, String memberPic, String memberContent, String joinYN,
			String applyYN) {
		super();
		this.memName = memName;
		this.roomNo = roomNo;
		this.memberNo = memberNo;
		this.memberPic = memberPic;
		this.memberContent = memberContent;
		this.joinYN = joinYN;
		this.applyYN = applyYN;
	}
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public String getMemberContent() {
		return memberContent;
	}
	public void setMemberContent(String memberContent) {
		this.memberContent = memberContent;
	}
	public String getJoinYN() {
		return joinYN;
	}
	public void setJoinYN(String joinYN) {
		this.joinYN = joinYN;
	}
	public String getApplyYN() {
		return applyYN;
	}
	public void setApplyYN(String applyYN) {
		this.applyYN = applyYN;
	}
	
	@Override
	public String toString() {
		return "MemMeet [memName=" + memName + ", roomNo=" + roomNo + ", memberNo=" + memberNo + ", memberPic="
				+ memberPic + ", memberContent=" + memberContent + ", joinYN=" + joinYN + ", applyYN=" + applyYN + "]";
	}
}
