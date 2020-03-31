 package com.kh.member.model.vo;

import java.sql.Date;

public class Member {

	private int memberNo;			// 회원 번호
	private String memberId;		// 회원 아이디
	private String memberPwd;		// 회원 비밀번호
	private String email;			// 회원 이메일
	private String memberName;		// 회원 이름
	private String phone;			// 회원 핸드폰번호
	private Date birth;				// 회원 생일
	private int age;				// 회원 나이
	private int reportTime;			// 신고 횟수
	private Date joinDate;			// 가입 일자
	private String deleteStatus;	// 회원 탈퇴유무
	private Date deleteDate;		// 회원 탈퇴일
	private String blacklist;		// 블랙리스트
	private Date blacklistDate;		// 블랙리스트 날짜
	private String nickname;		// 닉네임
	private String gender;			// 성별
	
	private int sbNo;			// 구독권 번호
	
	public Member() {
		
	}
	

	

	public Member(String memberId, String phone, String nickname, String email) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.phone = phone;
		this.nickname = nickname;
	}




	public Member(int memberNo, String memberId, String email, String memberName, String phone, int reportTime,
		Date joinDate, Date deleteDate, Date blacklistDate, int sbNo) {
	super();
	this.memberNo = memberNo;
	this.memberId = memberId;
	this.email = email;
	this.memberName = memberName;
	this.phone = phone;
	this.reportTime = reportTime;
	this.joinDate = joinDate;
	this.deleteDate = deleteDate;
	this.blacklistDate = blacklistDate;
	this.sbNo = sbNo;
}


	public Member(int memberNo, String memberId, String memberPwd, String email, String memberName, String phone,
			Date birth, int age, Date joinDate, String deleteStatus, Date deleteDate, String blacklist,
			Date blacklistDate, String nickname, String gender, int sbNo) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.email = email;
		this.memberName = memberName;
		this.phone = phone;
		this.birth = birth;
		this.age = age;
		this.joinDate = joinDate;
		this.deleteStatus = deleteStatus;
		this.deleteDate = deleteDate;
		this.blacklist = blacklist;
		this.blacklistDate = blacklistDate;
		this.nickname = nickname;
		this.gender = gender;
		this.sbNo = sbNo;
	}


	public Member(int memberNo, String memberId, String memberPwd, String email, String memberName, String phone,
			Date birth, int age, Date joinDate, String deleteStatus, Date deleteDate, String blacklist,
			Date blacklistDate, String nickname, String gender) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.email = email;
		this.memberName = memberName;
		this.phone = phone;
		this.birth = birth;
		this.age = age;
		this.joinDate = joinDate;
		this.deleteStatus = deleteStatus;
		this.deleteDate = deleteDate;
		this.blacklist = blacklist;
		this.blacklistDate = blacklistDate;
		this.nickname = nickname;
		this.gender = gender;
	}
	
	

	
	
	// 회원가입용 매개변수 생성자
	public Member(String memberId, String memberPwd, String email, String memberName, String phone, Date birth,
			String nickname, String gender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.email = email;
		this.memberName = memberName;
		this.phone = phone;
		this.birth = birth;
		this.nickname = nickname;
		this.gender = gender;
	}

	

	public int getMemberNo() {
		return memberNo;
	}



	

	public int getSbNo() {
		return sbNo;
	}


	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getReportTime() {
		return reportTime;
	}

	public void setReportTime(int reportTime) {
		this.reportTime = reportTime;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public Date getBlacklistDate() {
		return blacklistDate;
	}

	public void setBlacklistDate(Date blacklistDate) {
		this.blacklistDate = blacklistDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}




	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", email="
				+ email + ", memberName=" + memberName + ", phone=" + phone + ", birth=" + birth + ", age=" + age
				+ ", reportTime=" + reportTime + ", joinDate=" + joinDate + ", deleteStatus=" + deleteStatus
				+ ", deleteDate=" + deleteDate + ", blacklist=" + blacklist + ", blacklistDate=" + blacklistDate
				+ ", nickname=" + nickname + ", gender=" + gender + ", sbNo=" + sbNo + "]";
	}

	
	

}
