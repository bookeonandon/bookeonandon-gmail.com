package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	/**
	 * 1. 회원가입용 서비스
	 * @param mem 회원가입 페이지에서 입력받은 정보들이 담겨있는 Member 객체
	 * @return insert 실행 후 처리된 행의 갯수
	 */
	public int insertMember(Member mem) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem);
		
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
		System.out.println("service" + loginUser);
		return loginUser;
		
	}
}
