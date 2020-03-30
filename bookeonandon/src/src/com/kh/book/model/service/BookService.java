package com.kh.book.model.service;

import static com.kh.common.JDBCTemplate.*;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.Book;

public class BookService {

	/**
	 * 1. 책 상세정보 조회
	 * @param bookNo
	 * @return b
	 */
	public Book selectBookInfo(int bookNo){
		
		Connection conn = getConnection();
		
		Book b = new BookDao().selectBookInfo(conn, bookNo);
		
		close(conn);
		
		return b;
		
	}
	
	/**
	 * 2. 책 상세 조회수 ++
	 * @param b
	 * @return
	 */
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
