package com.kh.contact.model.dao;

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

import com.kh.contact.model.vo.Contact;

public class ContactDao {
	
	private Properties prop = new Properties();
	
	public ContactDao() {
		
	String fileName = ContactDao.class.getResource("/sql/contact/contact-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Contact> adminSelectListContact(Connection conn){
		ArrayList<Contact> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Contact(rset.getInt("contact_no"),
									 rset.getInt("contact_type"),
									 rset.getString("contact_title"),
									 rset.getString("contact_content"),
									 rset.getDate("contact_date"),
									 rset.getString("contact_status"),
									 rset.getDate("contact_redate"),
									 rset.getString("contact_com"),
									 rset.getString("member_id"),
									 rset.getString("admin_id")));
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
	
	public Contact adminSelectUpdateContact(Connection conn, int nno) {
		
		Contact c = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Contact(rset.getInt("contact_no"),
								rset.getInt("contact_type"),
								rset.getString("contact_title"),
								rset.getString("contact_content"),
								rset.getDate("contact_date"),
								rset.getString("contact_status"),
								rset.getString("contact_com"),
								rset.getString("nickname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return c;

		
	}
	
	public int adminContactUpdate(Connection conn, int nno, String comment) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminUpdateComment");
		
		System.out.println(comment + 3);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment);
			pstmt.setInt(2, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			
		}
		
		System.out.println(result);
		
		return result;
		
	}
	
	public ArrayList<Contact> contactList(Connection conn, String conWt){
		ArrayList<Contact> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("contactList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Contact c = new Contact();
				c.setContactDate(rset.getDate("contact_date"));
				c.setContactType(rset.getInt("contact-type"));
				c.setContactTitle(rset.getString("contact-title"));
				c.setContactStatus(rset.getString("contact-status"));
				
				list.add(c);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int insertContact(Connection conn, Contact c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getContactType());
			pstmt.setString(2, c.getContactTitle());
			pstmt.setString(3, c.getContactContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	

}
