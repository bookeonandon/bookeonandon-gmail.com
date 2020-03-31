package com.kh.search.model.dao;

import static com.kh.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.search.model.vo.Search;

public class SearchDao {

	private Properties prop = new Properties();
	
	public SearchDao() {
		
		String fileName = SearchDao.class.getResource("/sql/search/search-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectCount(Connection conn, String keyword, int memberNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeyword");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int insertKeyword(Connection conn, String keyword, int memberNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertKeyword");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int increaseCount(Connection conn, String keyword, int memberNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public ArrayList<Search> searchTitleList(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchTitleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
									rset.getString("book_title"),
									rset.getString("book_moimage"),
									rset.getString("author"),
									rset.getDouble("book_rating"),
									rset.getString("book_intro"),
									rset.getString("publisher"),
									rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Search> searchAuthorList(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchAuthorList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
									rset.getString("book_title"),
									rset.getString("book_moimage"),
									rset.getString("author"),
									rset.getDouble("book_rating"),
									rset.getString("book_intro"),
									rset.getString("publisher"),
									rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Search> popSearchList(Connection conn){
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("popSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getString("KEYWORD"),
									rset.getInt("KEYWORD_COUNT"),
									rset.getDate("SEARCH_DATE"),
									rset.getInt("MEMBER_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;		
	}
	public ArrayList<Search> sortPop(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("sortPop");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
									rset.getString("book_title"),
									rset.getString("book_moimage"),
									rset.getString("author"),
									rset.getDouble("book_rating"),
									rset.getString("book_intro"),
									rset.getString("publisher"),
									rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Search> sortHighScore(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("sortHighScore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
									rset.getString("book_title"),
									rset.getString("book_moimage"),
									rset.getString("author"),
									rset.getDouble("book_rating"),
									rset.getString("book_intro"),
									rset.getString("publisher"),
									rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Search> sortIssueDate(Connection conn, String keyword){
		
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("sortIssueDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
									rset.getString("book_title"),
									rset.getString("book_moimage"),
									rset.getString("author"),
									rset.getDouble("book_rating"),
									rset.getString("book_intro"),
									rset.getString("publisher"),
									rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Search> searchCategory(Connection conn, String keyword, String category){
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchCateogry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, category);
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
						rset.getString("book_title"),
						rset.getString("book_moimage"),
						rset.getString("author"),
						rset.getDouble("book_rating"),
						rset.getString("book_intro"),
						rset.getString("publisher"),
						rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Search> selectSubCategory(Connection conn, String category, String subCategory){
		ArrayList<Search> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSubCateogry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, category);
			pstmt.setString(2, subCategory);
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
						rset.getString("book_title"),
						rset.getString("book_moimage"),
						rset.getString("author"),
						rset.getDouble("book_rating"),
						rset.getString("book_intro"),
						rset.getString("publisher"),
						rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Search> best(Connection conn){
		
		ArrayList<Search> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("best");
		try {
			pstmt = conn.prepareStatement(sql);
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
						rset.getString("book_title"),
						rset.getString("book_moimage"),
						rset.getString("author"),
						rset.getDouble("book_rating"),
						rset.getString("book_intro"),
						rset.getString("publisher"),
						rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	public ArrayList<Search> newest(Connection conn){
		
		ArrayList<Search> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("newest");
		try {
			pstmt = conn.prepareStatement(sql);
			
			while(rset.next()) {
				list.add(new Search(rset.getInt("book_no"),
						rset.getString("book_title"),
						rset.getString("book_moimage"),
						rset.getString("author"),
						rset.getDouble("book_rating"),
						rset.getString("book_intro"),
						rset.getString("publisher"),
						rset.getInt("review_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
}
