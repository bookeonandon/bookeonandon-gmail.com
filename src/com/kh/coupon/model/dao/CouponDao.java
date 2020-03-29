package com.kh.coupon.model.dao;

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

import com.kh.contact.model.dao.ContactDao;
import com.kh.coupon.model.vo.Coupon;
import com.kh.event.model.vo.Event;

public class CouponDao {
	
	
	private Properties prop = new Properties();
	
	public CouponDao() {
		
		String fileName = ContactDao.class.getResource("/sql/coupon/coupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Coupon> adminSelectListCoupon(Connection conn){
		
		
		ArrayList<Coupon> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListCoupon");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Coupon(rset.getInt("coupon_no"),
						   rset.getString("coupon_name"),
						   rset.getString("coupon_content"),
						   rset.getInt("coupon_sale"),
						   rset.getDate("coupon_expdate"),
						   rset.getInt("coupon_range"),
						   rset.getString("coupon_status")));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
		
	}
	
	public int insertCoupon(Connection conn, Coupon c) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCouponName());
			pstmt.setString(2, c.getCouponContent());
			pstmt.setInt(3, c.getCouponSale());
			pstmt.setDate(4, c.getCouponExp());
			pstmt.setInt(5, c.getCouponRange());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int deleteListCoupon(Connection conn, String[] chk) {
		

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			
			for(int i=0; i<chk.length; i++) {
				String sql = prop.getProperty("deleteCoupon");		
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
	
	
	public Coupon detailCoupon(Connection conn, int cNo) {
		
		Coupon c = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("detailCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			
			c = new Coupon(rset.getInt("coupon_no"),
						   rset.getString("coupon_name"),
						   rset.getString("coupon_content"),
						   rset.getInt("coupon_sale"),
						   rset.getDate("coupon_expdate"),
						   rset.getInt("coupon_range"),
						   rset.getString("coupon_status"));
			
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

}
