package com.kh.book.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.book.model.vo.Book;
import com.kh.search.model.dao.SearchDao;

public class BookDao {

	private Properties prop = new Properties();
	
	public BookDao() {
		
		String fileName = SearchDao.class.getResource("/sql/book/book-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Book selectBookInfo(Connection conn, int bookNo){
		
		Book b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("bookInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Book(rset.getInt("BOOK_NO"),
							  rset.getString("BOOK_TITLE"),
							  rset.getString("BOOK_SUBTITLE"),
							  rset.getString("AUTHOR"),
							  rset.getString("PUBLISHER"),
							  rset.getString("TRANSLATOR"),
							  rset.getInt("BOOK_PRICE"),
							  rset.getInt("PAGE"),
							  rset.getDouble("BOOK_RATING"),
							  rset.getInt("REVIEW_COUNT"),
							  rset.getDate("ISSUE_DATE"),
							  rset.getString("BOOK_INTRO"),
							  rset.getString("BOOK_NOTICE"),
							  rset.getString("CONTENTS"),
							  rset.getString("BOOK_PDF"),
							  rset.getString("BOOK_IMAGE"),
							  rset.getString("BOOK_MOIMAGE"),
							  rset.getString("MAIN_CATEGORY"),
							  rset.getString("SUB_CATEGORY"),
							  rset.getString("ADULT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
		
	}
	
	public int increaseHits(Connection conn, int bookNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseHits");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
