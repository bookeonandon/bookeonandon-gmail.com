package com.kh.product.model.dao;

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

import com.kh.notice.model.dao.NoticeDao;
import com.kh.product.model.vo.Subscription;

public class SubscriptionDao {
	
	
	private Properties prop = new Properties();
	
	public SubscriptionDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Subscription> adminSelectListSubscription(Connection conn){
		
		ArrayList<Subscription> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Subscription(rset.getInt("sb_no"),
									 	rset.getString("sb_name"),
									 	rset.getInt("sb_price"),
									 	rset.getString("sb_content"),
									 	rset.getInt("sb_date"),
									 	rset.getString("sb_status")));
						
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
	
	
	public int insertSubscription(Connection conn, Subscription s) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSubscription");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getSbName());
			pstmt.setInt(2, s.getSbPrice());
			pstmt.setString(3, s.getSbContent());
			pstmt.setInt(4, s.getSbDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}
	
	public int deleteListSubscription(Connection conn, String[] nno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			for(int i=0; i<nno.length; i++) {
				String sql = prop.getProperty("deleteSubscription");				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(nno[i]));

			result = pstmt.executeUpdate();
			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public Subscription selectDetailView(Connection conn, int sNo) {
		
		Subscription s = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,sNo);
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				
			s = (new Subscription(rset.getInt("sb_no"),
								 	rset.getString("sb_name"),
								 	rset.getInt("sb_price"),
								 	rset.getString("sb_content"),
								 	rset.getInt("sb_date"),
								 	rset.getString("sb_status")));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return s;
		
	}
	
	
	

}
