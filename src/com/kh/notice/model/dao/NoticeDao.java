package com.kh.notice.model.dao;

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

import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Notice> adminSelectListNotice(Connection conn){
		
		ArrayList<Notice> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectList");
		System.out.println(sql);
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Notice(
									rset.getString("NOTICE_TITLE"),
									rset.getDate("NOTICE_DATE"),
									rset.getString("NOTICE_CONTENT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}
	
	
	
	public int insertNotice(Connection conn, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public Notice adminSelectNotice(Connection conn, int nno) {
		
		Notice n = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no"),
							   rset.getString("notice_title"),
							   rset.getString("notice_content"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
		
		
	}
	
	
	public int updateNotice(Connection conn, Notice n) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	public int deleteNotice(Connection conn, int nno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int deleteListNotice(Connection conn, String[] nno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		try {
			for(int i=0; i<nno.length; i++) {
				String sql = prop.getProperty("deleteNotice");				
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
	
	public ArrayList<Notice> selectList(Connection conn, NoticePageInfo npi){
		ArrayList<Notice> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int noticeStartRow = (npi.getNoticeCurrentPage() -1) * npi.getNoticeLimit() + 1;
			int noticeEndRow = noticeStartRow + npi.getNoticeLimit() -1;
			
			pstmt.setInt(1, noticeStartRow);
			pstmt.setInt(2, noticeEndRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getString("notice_title"),
									rset.getDate("notice_date"),
									rset.getString("notice_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		return list;
	}

	
	public int getNoticeListCount(Connection conn) {
		
		int noticeListCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getNoticeListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				noticeListCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		return noticeListCount;
		
	}

}
