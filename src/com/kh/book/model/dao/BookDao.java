package com.kh.book.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.book.model.vo.Book;
import com.kh.notice.model.dao.NoticeDao;

public class BookDao {
	
	private Properties prop = new Properties();
	
	public BookDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/book/book-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Book> adminSelectListBook(Connection conn){
		ArrayList<Book> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Book(rset.getInt("book_no"),
									 rset.getString("book_title"),
									 rset.getString("book_subtitle"),
									 rset.getString("author"),
									 rset.getString("publisher"),
									 rset.getString("translator"),
									 rset.getInt("book_price"),
									 rset.getInt("page"),
									 rset.getDouble("book_rating"),
									 rset.getInt("review_count"),
									 rset.getDate("issue_date"),
									 rset.getString("book_intro"),
									 rset.getString("book_notice"),
									 rset.getString("contents"),
									 rset.getString("book_pdf"),
									 rset.getString("book_image"),
									 rset.getString("book_moimage"),
									 rset.getString("main_category"),
									 rset.getString("sub_category"),
									 rset.getString("adult")));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;

	}
	
	public int adminInsertBook(Connection conn, Book b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminInsertBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getSubTitle());
			pstmt.setString(3, b.getAuthor());
			pstmt.setString(4, b.getPublisher());
			pstmt.setString(5, b.getTranslator());
			pstmt.setInt(6, b.getPrice());
			pstmt.setInt(7, b.getPage());
			pstmt.setDate(8, b.getIssueDate());
			pstmt.setString(9, b.getIntroduction());
			pstmt.setString(10, b.getPublisherNotice());
			pstmt.setString(11, b.getContents());
			pstmt.setString(12, b.getBookContent());
			pstmt.setString(13, b.getOriginThumbnail());
			pstmt.setString(14, b.getMoThumbnail());
			pstmt.setString(15, b.getMainCategory());
			pstmt.setString(16, b.getSubCategory());
			pstmt.setString(17, b.getAdult());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
		
		
	}
	
	
	public Book adminUpdateFormBook(Connection conn, int bNo) {
		
		
		Book b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminUpdateFormBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Book(rset.getInt("book_no"),
						 rset.getString("book_title"),
						 rset.getString("book_subtitle"),
						 rset.getString("author"),
						 rset.getString("publisher"),
						 rset.getString("translator"),
						 rset.getInt("book_price"),
						 rset.getInt("page"),
						 rset.getDouble("book_rating"),
						 rset.getInt("review_count"),
						 rset.getDate("issue_date"),
						 rset.getString("book_intro"),
						 rset.getString("book_notice"),
						 rset.getString("contents"),
						 rset.getString("book_pdf"),
						 rset.getString("book_image"),
						 rset.getString("book_moimage"),
						 rset.getString("main_category"),
						 rset.getString("sub_category"),
						 rset.getString("adult"));
				
			}

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
		
	}
	
	
	public int adminUpdateBook(Connection conn, Book b) {
		
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminUpdateBook");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getSubTitle());
			pstmt.setString(3, b.getAuthor());
			pstmt.setString(4, b.getPublisher());
			pstmt.setString(5, b.getTranslator());
			pstmt.setInt(6, b.getPrice());
			pstmt.setInt(7, b.getPage());
			pstmt.setString(8, b.getIntroduction());
			pstmt.setString(9, b.getPublisherNotice());
			pstmt.setString(10, b.getContents());
			pstmt.setString(11, b.getBookContent());
			pstmt.setString(12, b.getOriginThumbnail());
			pstmt.setString(13, b.getMoThumbnail());
			pstmt.setString(14, b.getMainCategory());
			pstmt.setString(15, b.getSubCategory());
			pstmt.setString(16, b.getAdult());
			pstmt.setInt(17, b.getBookNo());
			
			result = pstmt.executeUpdate();

			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteListBook(Connection conn, String[] chk) {
		

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			
			for(int i=0; i<chk.length; i++) {
				String sql = prop.getProperty("deleteListBook");		
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(chk[i]));
			
			result = pstmt.executeUpdate();
			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
