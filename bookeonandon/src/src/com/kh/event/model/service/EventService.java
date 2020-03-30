package com.kh.event.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.event.model.dao.EventDao;
import com.kh.event.model.vo.Event;

public class EventService {
	
	/**
	 * 1. 이벤트 관리자 리스트 조회
	 * @return		조회된 이벤트 리스트
	 */
	public ArrayList<Event> adminSelectListEvent(){
		Connection conn = getConnection();
		
		ArrayList<Event> list = new EventDao().adminSelectListEvent(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 2. 이벤트 등록하기
	 * @param e		등록하기 폼에서 입력된 이벤트 객체
	 * @return		처리된 행의 개수
	 */
	public int insertEvent(Event e) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().insertEvent(conn, e);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 3. 이벤트 관리자 상세보기
	 * @param nno	클릭한 이벤트 글의 번호
	 * @return		전달된 이벤트의 객체
	 */
	public Event updateFormEvent(int nno) {
		
		Connection conn = getConnection();
		
		Event e = new EventDao().updateFormEvent(conn, nno);
		
		close(conn);
		
		return e;
		
		
	}
	
	
	/**
	 * 4. 이벤트 관리자 수정하기 (파일 있는 경우)
	 * @param e
	 * @return
	 */
	public int updateFileEvent(Event e) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().updateFileEvent(conn, e);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 5. 이벤트 관리자 수정하기 (파일 없는 경우)
	 * @param e
	 * @return
	 */
	public int updateNoFileEvent(Event e) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().updateNoFileEvent(conn, e);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int deleteListEvent(String[] chk) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().deleteListEvent(conn, chk);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

}
