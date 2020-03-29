package com.kh.faq.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.faq.model.dao.FaqDao;
import com.kh.faq.model.vo.Faq;
import com.kh.notice.model.dao.NoticeDao;

public class FaqService {
	
	
	/**
	 * 1. FAQ 관리자 리스트 조회하기
	 * @return		조회된 FAQ list
	 */
	public ArrayList<Faq> adminSelectListFaq() {
		Connection conn = getConnection();
		
		
		ArrayList<Faq> list = new FaqDao().adminSelectListFaq(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	/** 
	 * 2. FAQ 등록하기
	 * @param f		등록하기 폼에서 전달된 FAQ 객체
	 * @return		처리된 행의 개수
	 */
	public int insertFaq(Faq f) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().insertFaq(conn, f);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 3. FAQ 관리자 상세보기
	 * @param nno	클릭하여 전달된 FAQ 글번호
	 * @return		조회된 FAQ 객체
	 */
	public Faq adminSelectDetailFaq(int nno) {
		Connection conn = getConnection();
		
		Faq f = new FaqDao().adminSelectDetailFaq(conn, nno);
		
		close(conn);
		
		return f;
		
	}
	
	
	/**
	 * 4. FAQ 수정하기
	 * @param f		수정하여 전달된 FAQ 객체
	 * @return		처리된 행의 개수
	 */
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		
		int result = new FaqDao().updateFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int deleteFaq(int nno){
		Connection conn = getConnection();
		
		int result = new FaqDao().deleteFaq(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	public int deleteListFaq(String[] nno) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().deleteListFaq(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
		
	/**
	 * 유형별 faq 리스트 조회
	 * @return
	 */
	public ArrayList<Faq> typeList(int num){
		Connection conn = getConnection();
		
		ArrayList<Faq> flist = new FaqDao().typeList(conn, num);
		
		close(conn);
		
		return flist;
	}
	
		
}
