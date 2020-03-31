package com.kh.review.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.review.model.vo.Review;

public class ReviewDao {
	
	
	private Properties prop = new Properties();

	
	public ReviewDao() {
			
			String fileName = NoticeDao.class.getResource("/sql/review/review-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
	}
	
	public ArrayList<Review> adminSelectListReview(Connection conn){
		
		ArrayList<Review> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("reviewSelectList");
		
		try {
			stmt = conn.createStatement();
			rset  = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
								 rset.getInt("book_rating"),
								 rset.getString("review_content"),
								 rset.getDate("review_date"),
								 rset.getInt("recommend"),
								 rset.getInt("REPORT_TIMES"),
								 rset.getString("BOOK_TITLE"),
								 rset.getString("MEMBER_ID"),
								 rset.getString("REVIEW_STATUS"),
								 rset.getString("NICKNAME")));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	
	}
	
	
	public int adminDeleteReview(Connection conn, String[] chk) {
		
		

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			for(int i=0; i<chk.length; i++) {
				String sql = prop.getProperty("adminDeleteReview");				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(chk[i]));
			
			result = pstmt.executeUpdate();
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public ArrayList<Review> selectReviewList(Connection conn, int bookNo){
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bookNo);
			
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setStarRating(rset.getInt("BOOK_RATING"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setReviewDate(rset.getDate("REVIEW_DATE"));
				r.setRecommend(rset.getInt("RECOMMEND"));
				r.setReportTime(rset.getInt("REPORT_TIMES"));
				r.setHits(rset.getInt("REVIEW_HITS"));
				r.setBookNo(rset.getInt("BOOK_NO"));
				r.setMemberNo(rset.getInt("MEMBER_NO"));
				r.setReviewStatus(rset.getString("REVIEW_STATUS"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public int insertReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getStarRating());
			pstmt.setString(2, r.getReviewContent());
			pstmt.setInt(3, r.getBookNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
}
