package com.kh.event.model.dao;

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

import com.kh.event.model.vo.Event;
import com.kh.notice.model.dao.NoticeDao;

public class EventDao {
	
	private Properties prop = new Properties();
	
	public EventDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/event/event-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Event> adminSelectListEvent(Connection conn){
		
		ArrayList<Event> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListEvent");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Event(rset.getInt("event_no"),
								   rset.getString("event_title"),
								   rset.getDate("event_date"),
								   rset.getDate("event_day"),
								   rset.getString("event_image"),
								   rset.getString("event_thumbnail"),
								   rset.getString("admin_id")));
				
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
	
	
	public int insertEvent(Connection conn, Event e) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setDate(2, e.getEventDate());
			pstmt.setString(3, e.getEventImg());
			pstmt.setString(4, e.getEventThumbnail());
			pstmt.setString(5, e.getEventWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public Event updateFormEvent(Connection conn, int nno) {
		
		Event e = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				e = new Event(rset.getInt("event_no"),
							  rset.getString("event_title"),
							  rset.getDate("event_date"),
							  rset.getString("event_image"),
							  rset.getString("event_thumbnail"));
			}
			
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return e;
		
		
	}
	
	
	public int updateFileEvent(Connection conn, Event e) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFileEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setDate(2, e.getEventDate());
			pstmt.setString(3, e.getEventImg());
			pstmt.setString(4, e.getEventThumbnail());
			pstmt.setInt(5, e.getEventNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int updateNoFileEvent(Connection conn, Event e) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNoFileEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setDate(2, e.getEventDate());
			pstmt.setInt(3, e.getEventNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	public int deleteListEvent(Connection conn, String[] chk) {
		

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			
			for(int i=0; i<chk.length; i++) {
				String sql = prop.getProperty("deleteEvent");		
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


}
