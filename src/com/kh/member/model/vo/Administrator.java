package com.kh.member.model.vo;

public class Administrator {

	private String AdminId;
	private String AdminPwd;
	
	public Administrator() {
		
	}
	public Administrator(String adminId, String adminPwd) {
		super();
		AdminId = adminId;
		AdminPwd = adminPwd;
	}
	public String getAdminId() {
		return AdminId;
	}
	public void setAdminId(String adminId) {
		AdminId = adminId;
	}
	public String getAdminPwd() {
		return AdminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		AdminPwd = adminPwd;
	}
	@Override
	public String toString() {
		return "Administrator [AdminId=" + AdminId + ", AdminPwd=" + AdminPwd + "]";
	}
	
	
	

}
