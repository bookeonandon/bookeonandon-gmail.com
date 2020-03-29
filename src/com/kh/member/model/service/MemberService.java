package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Administrator;
import com.kh.member.model.vo.Member;

public class MemberService {

	/**
	 * 1. 회원가입용 서비스
	 * @param mem 회원가입 페이지에서 입력받은 정보들이 담겨있는 Member 객체
	 * @return insert 실행 후 처리된 행의 갯수
	 */
	public int insertMember(Member mem, String birth) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem, birth);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/** 아이디 중복체크용 서비스
	 * @param memberId 중복체크용 아이디
	 * @return
	 */
	public int idCheck(String memberId) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, memberId);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 2. 회원 로그인용 서비스
	 * @param memberId		사용자가 입력한 아이디
	 * @param memberPwd		사용자가 입력한 비밀번호
	 * @return				해당 아이디와 비밀번호가 일치하는 조회된 회원객체
	 */
	public Member loginMember(String memberId, String memberPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		close(conn);

		return loginUser;
		
	}
	
	/**
	 * 3. 관리자 로그인용 서비스
	 * @param adminId
	 * @param adminPwd
	 * @return
	 */
	public Administrator adminLogin(String adminId, String adminPwd) {
		Connection conn = getConnection();
		
		
		Administrator adminLogin = new MemberDao().adminLogin(conn, adminId, adminPwd);
		
		close(conn);
		
		return adminLogin;
		
		
	}
	
	/**
	 * 사용자 아이디 찾기용 이메일 입력 서비스
	 * @param memberEmail
	 * @return
	 */
	public Member idSearch(String memberEmail) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().idSearch(conn, memberEmail);
		close(conn);
		
		return mem;
	}
	//어라어라ㅓㅇ나
	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().selectMember(conn, memberId);
		
		close(conn);
		
		return mem;
	}
	
	/**
	 * 임시비밀번호 받은후 비밀번호 변경 서비스
	 * @param memberId
	 * @param newPwd
	 * @return
	 */
	public Member newPwdMember(String memberId, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().newPwdMember(conn, memberId, newPwd);
		
		Member newPwdMember = null;
		if(result > 0) {
			commit(conn);
			newPwdMember = new MemberDao().selectMember(conn, memberId);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return newPwdMember;
	}
}
