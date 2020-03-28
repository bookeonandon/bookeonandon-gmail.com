package com.kh.faq.model.dao;

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

import com.kh.faq.model.vo.Faq;
import com.kh.notice.model.dao.NoticeDao;

public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		
		
		String fileName = NoticeDao.class.getResource("/sql/faq/faq-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Faq> adminSelectListFaq(Connection conn) {
		ArrayList<Faq> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListFaq");
		
		try {
			stmt = conn.createStatement();
			
			rset  = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
								 rset.getInt("faq_type"),
								 rset.getString("faq_title"),
								 rset.getString("faq_content"),
								 rset.getDate("faq_date"),
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
	
	
	
	
	public int insertFaq(Connection conn, Faq f) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f.getFaqType());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setString(4, f.getFaqWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	public Faq adminSelectDetailFaq(Connection conn, int nno) {
		
		Faq f = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("adminDetailFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f = new Faq( rset.getInt("faq_no"),
						 	 rset.getInt("faq_type"),
						     rset.getString("faq_title"),
						     rset.getString("faq_content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
		
		

	}
	
	public int updateFaq(Connection conn, Faq f) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, f.getFaqType());
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setInt(4, f.getFaqNo());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteFaq(Connection conn, int nno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteListFaq(Connection conn, String[] nno) {
		

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			for(int i=0; i<nno.length; i++) {
				String sql = prop.getProperty("deleteFaq");				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(nno[i]));
			
			// 왜 여러개가 삭제 되는데 result는 1인가? 최종으로 삭제된 1값만 나가는 건가?
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
	
	
	public ArrayList<Faq> typeList(Connection conn, int num){
		ArrayList<Faq> flist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("typeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				flist.add(new Faq(rset.getString("faq_title"),
								  rset.getString("faq_content")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return flist;
		
		
	}

}
