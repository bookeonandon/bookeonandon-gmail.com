package com.kh.mysub.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
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
