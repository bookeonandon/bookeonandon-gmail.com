package com.kh.payment.model.dao;

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

import com.kh.member.model.vo.Member;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.payment.model.vo.Payment;
import com.kh.product.model.vo.Subscription;

public class PaymentDao {
	
private Properties prop = new Properties();
	
	public PaymentDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Payment> adminSelectListSPay(Connection conn){
		
		ArrayList<Payment> list = new ArrayList<> ();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListSPay");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("sub_payno"),
										  rset.getDate("sub_paydate"),
										  rset.getInt("sub_payprice"),
										  rset.getString("sub_paytype"),
										  rset.getString("sub_refund"),
										  rset.getString("member_id"),
										  rset.getString("member_name"),
										  rset.getString("sb_name")));
						
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
	
	public ArrayList<Payment> adminSelectListBPay(Connection conn){
		
		ArrayList<Payment> list = new ArrayList<> ();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListBPay");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("BOOK_PAYNO"),
										  rset.getDate("BOOK_PAYDATE"),
										  rset.getInt("BOOK_PAYPRICE"),
										  rset.getString("member_id"),
										  rset.getString("member_name"),
										  rset.getString("BOOK_PAYTYPE"),
										  rset.getString("BOOK_TITLE")));
						
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
	
	public int insertSbPayment(Connection conn, Member m, Subscription s, String type) {
		
		int result = 0;
		
		PreparedStatement pstmt =  null;
		
		String sql = prop.getProperty("insertSbPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getSbPrice());
			pstmt.setString(2, type);
			pstmt.setInt(3, m.getMemberNo());
			pstmt.setInt(4, s.getSbNo());
			
			System.out.println(pstmt);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	public Payment countSBPayment(Connection conn) {
		
		Payment p = null;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("countSBPayment");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				p = new Payment(rset.getInt("count"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return p;
		
	}
	
	public Payment manySBPayment(Connection conn) {
		
		
		Payment p = null;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("manySBPayment");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				p = new Payment(rset.getString("sb_name"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return p;
		
	}
	
	
	public ArrayList<Payment> recentSBPayment(Connection conn){
		
		ArrayList<Payment> list = new ArrayList<> ();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("recentSBPayment");
		
		
			
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("sub_payprice"),
									 rset.getString("member_id"),
									 rset.getString("sb_name"),
									 rset.getDate("sub_paydate"),
									 rset.getInt("rnum"),
									 rset.getString("nickname")));
						
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
	
	
	public Payment countBPayment(Connection conn) {
		
		Payment p = null;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("countBPayment");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				p = new Payment(rset.getInt("count"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return p;
		
	}
	
	
	public Payment manyBPayment(Connection conn) {
		
		
		Payment p = null;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("manyBPayment");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				p = new Payment(rset.getString("BOOK_TITLE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return p;
		
	}
	
	
	public ArrayList<Payment> recentBPayment(Connection conn){
		
		ArrayList<Payment> list = new ArrayList<> ();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("recentBPayment");
		
		
			
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Payment(rset.getInt("BOOK_PAYPRICE"),
									 rset.getString("member_id"),
									 rset.getString("BOOK_TITLE"),
									 rset.getDate("BOOK_PAYDATE"),
									 rset.getInt("rnum"),
									 rset.getString("nickname")));
						
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
	

}
