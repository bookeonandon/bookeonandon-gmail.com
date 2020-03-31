package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.coupon.model.vo.Coupon;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;
import com.kh.member.model.vo.Wishlist;
import com.kh.myCoupon.model.vo.MyCoupon;
import com.kh.payment.model.vo.Payment;
import com.kh.payment.model.vo.Payments;

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
//		System.out.println("service" + loginUser);
		return loginUser;
		
	}

	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().selectMember(conn, memberId);
		close(conn);
		return mem;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemberId());
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public Member updatePwdMember(String memberId, String memberPwd, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwdMember(conn, memberId, memberPwd, newPwd);

		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memberId);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, memberId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Payments> paymentInfo(PageInfo pi, int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Payments> list = new MemberDao().paymentInfo(conn, pi, memberNo);
		close(conn);
		return list;
	}

	public ArrayList<MyCoupon> accountCoupon(int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<MyCoupon> couponList = new MemberDao().accountCoupon(conn, memberNo);
		close(conn);
		return couponList;
	}
	
 	public ArrayList<Wishlist> memberWishlist(PageInfo pi, int memberNo){
 		Connection conn = getConnection();
 		
 		ArrayList<Wishlist> memberWishlist = new MemberDao().memberWishlist(conn, pi, memberNo);
 		close(conn);
 		return memberWishlist;
 	}

	public ArrayList<Wishlist> memberLibrary(PageInfo pi, int memberNo) {
		Connection conn = getConnection();
 		
 		ArrayList<Wishlist> memberLibrary = new MemberDao().memberLibrary(conn, pi, memberNo);
 		close(conn);
 		return memberLibrary;
	}

	public ArrayList<Wishlist> memberWishlist(int memberNo) {
		Connection conn = getConnection();
 		
 		ArrayList<Wishlist> memberWishlist = new MemberDao().memberWishlist(conn, memberNo);
 		close(conn);
 		return memberWishlist;
	}
	
}
