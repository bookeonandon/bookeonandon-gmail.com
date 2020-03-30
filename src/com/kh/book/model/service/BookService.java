package com.kh.book.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.Book;

public class BookService {
	
	
	/**
	 * 1. 관리자 상품현황 도서 리스트 조회
	 * @return			조회된 도서 리스트
	 */
	public ArrayList<Book> adminSelectListBook(){
		
		
		Connection conn = getConnection();
		
		ArrayList<Book> list = new BookDao().adminSelectListBook(conn);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 2. 관리자 도서등록
	 * @param b			입력된 도서 정보
	 * @return			처리된 행의 개수
	 */
	public int adminInsertBook(Book b) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().adminInsertBook(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	/**
	 * 3. 관리자 도서 수정 리스트
	 * @param bNo		전달된 도서 번호
	 * @return			해당 도서의 모든 정보
	 */
	public Book adminUpdateFormBook(int bNo) {
		
		Connection conn = getConnection();
		
		Book b = new BookDao().adminUpdateFormBook(conn, bNo);
		
		close(conn);
		
		return b;
	}
	
	
	/**
	 * 4. 관리자 도서 정보 수정
	 * @param b			수정된 도서 정보
	 * @return			처리된 행의 개수
	 */
	public int adminUpateBook(Book b) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().adminUpdateBook(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	
	/**
	 * 5. 관리자 도서 삭제
	 * @param chk		삭제할 도서 번호 배열
	 * @return			처리된 행의 개수
	 */
	public int deleteListBook(String[] chk) {
		
		Connection conn = getConnection();
		
		int result = new BookDao().deleteListBook(conn, chk);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 6. 도서 상세보기
	 * @param bNo		전달된 도서 번호
	 * @return			처리된 행의 개수 
	 */
	public Book paySelectDetail(int bNo) {
		
		Connection conn = getConnection();
		
		Book b = new BookDao().adminUpdateFormBook(conn, bNo);
		
		
		close(conn);
		
		return b;
		
	}

	public Book selectBookInfo(int bookNo){
		
		Connection conn = getConnection();
		
		Book b = new BookDao().selectBookInfo(conn, bookNo);
		
		close(conn);
		
		return b;
		
	}
	
	public int increaseHits(int bookNo) {
		Connection conn = getConnection();
		
		int result = new BookDao().increaseHits(conn,bookNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

}
