package com.kh.contact.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.contact.model.dao.ContactDao;
import com.kh.contact.model.vo.Contact;

public class ContactService {
	
	
	/**
	 * 1. 1:1 문의 관리자 리스트 조회하기
	 * @return		DB에서 조회된 list
	 */
	public ArrayList<Contact> adminSelectListContact(){
		
		Connection conn = getConnection();
		
		ArrayList<Contact> list = new ContactDao().adminSelectListContact(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 2. 1:1 문의 관리자 상세 조회하기 
	 * @param nno	클릭한 1:1 문의 글번호
	 * @return		DB에서 조회된 Contact 객체
	 */
	public Contact adminSelectUpdateContact(int nno) {
		
		Connection conn = getConnection();
		
		Contact c = new ContactDao().adminSelectUpdateContact(conn, nno);
		
		close(conn);
		
		return c;
		
	}
	
	/**
	 * 3. 1:1 문의 관리자 답변 수정하기
	 * @param nno		클릭한 1:1문의 글번호
	 * @param comment	수정한 1:1문의 답변
	 * @return			처리된 행의 개수
	 */
	public int adminContactUpdate(Contact c) {
		Connection conn = getConnection();
		
		int result = 0;
		
		if(c.getContactStatus().equals("y")) {
			result = new ContactDao().adminContactUpdate(conn, c);
		}else {
			result = new ContactDao().adminContactInsert(conn, c);
		}

		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	/**
	 * 1:1 문의하기 문의 내역 조회하는 서비스
	 * @param conWt 회원 아이디
	 * @return
	 */
	public ArrayList<Contact> contactList(int memberNo){
		Connection conn = getConnection();
		
		ArrayList<Contact> list = new ContactDao().contactList(conn, memberNo);
		
		close(conn);
		
		return list;
	}

	/**
	 * 1:1 문의 하기 삽입하는 서비스
	 * @param c	문의한 내용
	 * @return	
	 */
	public int insertContact(Contact c) {
		
		Connection conn = getConnection();
		
		int result = new ContactDao().insertContact(conn, c);
			
		System.out.println(result);
		if(result >0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 1:1 문의 상세보기 조회용 메서드
	 * @param cNo
	 * @return
	 */
	public Contact selectContact(int cNo) {
		Connection conn = getConnection();
		
		Contact c = null;
			c = new ContactDao().selectContact(conn, cNo);
		System.out.println("service :" + c);
		close(conn);
		
		return c;
	}
	
	/**
	 * 1:1 문의 삭제용 서비스
	 * @param cNo
	 * @return
	 */
	public int deleteContact(int dNo) {
	
		Connection conn = getConnection();
		
		int result = new ContactDao().deleteContact(conn, dNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
