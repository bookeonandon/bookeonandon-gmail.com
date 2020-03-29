package com.kh.mysub.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.mysub.model.vo.MySub;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.product.model.vo.Subscription;

public class MySubDao {
	
	private Properties prop = new Properties();

	
	public MySubDao() {
			
			String fileName = NoticeDao.class.getResource("/sql/mysub/mysub-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}

	}
	
	public MySub adminSelectDetail(Connection conn, int uNo) {
		
		MySub ms = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ms = new MySub(rset.getInt("MEMBER_NO"),
								rset.getDate("SUB_START"),
								rset.getDate("SUB_END"),
								rset.getInt("SB_NO"),
								rset.getString("SUB_STATUS"),
								rset.getString("SB_NAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ms;
		
	}
	
	public int insertMySub(Connection conn, int uNo, Subscription s) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMySub");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			pstmt.setInt(2, s.getSbDate());
			pstmt.setInt(3, s.getSbNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	

}
