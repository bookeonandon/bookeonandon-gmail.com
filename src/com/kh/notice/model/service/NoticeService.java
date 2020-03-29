package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

public class NoticeService {
	
	
	/**
	 * 1. 관리자 공지사항 리스트 조회하기
	 * @return 	조회된 공지사항 리스트
	 */
	public ArrayList<Notice> adminSelectListNotice(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().adminSelectListNotice(conn);
		
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 2. 공지사항 등록하기
	 * @param title		공지사항 제목
	 * @param content	공지사항 내용
	 * @return			처리된 행의 개수
	 */
	public int insertNotice(Notice n) {
		
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);

		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	
	/** 3. 공지사항 상세보기용 서비스
	 * @param nno		전달된 공지사항 번호
	 * @return			해당 번호의 공지사항 조회된 Notice 객체
	 */
	public Notice adminSelectNotice(int nno) {
		
		Connection conn = getConnection();
	
		Notice n = new NoticeDao().adminSelectNotice(conn, nno);
		
		close(conn);

		return n;
	}
	
	/**
	 * 4. 공지사항 수정하기 서비스
	 * @param nno	전달된 공지사항 번호
	 * @return		처리된 행의 개수
	 */
	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			commit(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 5. 공지사항 삭제 서비스
	 * @param nno	전달된 공지사항 번호
	 * @return		처리된 행의 개수
	 */
	public int deleteNotice(int nno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int deleteListNotice(String[] nno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteListNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 공지사항 리스트 조회용 서비스 (사용자)
	 * @return 조회된 공지사항 리스트 담긴 ArrayList 객체
	 */
	public ArrayList<Notice> selectList(NoticePageInfo npi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn, npi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 공지사항 리스트 총갯수 조회용 서비스
	 * @return
	 */
	public int getNoticeListCount() {
		Connection conn = getConnection();
		
		int noticeListCount = new NoticeDao().getNoticeListCount(conn);
		
		close(conn);
		
		return noticeListCount;
	}
}
