package com.kh.myCoupon.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.book.model.vo.Book;
import com.kh.coupon.model.vo.Coupon;
import com.kh.myCoupon.model.vo.MyCoupon;

public class MyCouponDao {
	
	private Properties prop = new Properties();
	
	public MyCouponDao() {
		
		String fileName = MyCouponDao.class.getResource("/sql/mycoupon/myCoupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int insertMyCoupon(Connection conn, String[] uNo, Coupon c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		int cNo = c.getCouponNo();
		Date cDate = c.getCouponExp();
		
		try {
			for(int i=0; i<uNo.length; i++) {
				String sql = prop.getProperty("insertMyCoupon");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(uNo[i]));
			pstmt.setInt(2, cNo);
			pstmt.setDate(3, cDate);

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
	
	public ArrayList<MyCoupon> payDetailCoupon(Connection conn, int uNo, Book b) {
		
		ArrayList<MyCoupon> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("payDetailCoupon");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			pstmt.setInt(2, b.getPrice());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyCoupon(rset.getString("member_id"),
								  rset.getString("coupon_name"),
								  rset.getDate("coupon_from"),
								  rset.getDate("coupon_until"),
								  rset.getInt("coupon_no")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}

}
