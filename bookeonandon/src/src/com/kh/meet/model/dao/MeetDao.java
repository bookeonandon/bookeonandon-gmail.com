package com.kh.meet.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.meet.model.vo.Meet;
import com.kh.meet.model.vo.MemMeet;
import com.kh.meet.model.vo.PageInfo;
import com.kh.meet.model.vo.RoomMemSet;

public class MeetDao {

private Properties prop = new Properties();
	
	public MeetDao() {
		String fileName = MeetDao.class.getResource("/sql/meet/meet-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Meet> selectList(Connection conn, PageInfo pi){
		ArrayList<Meet> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * ex) boardLimit : 10
			 * currentPage : 1		--> startRow : 1 	endRow : 10
			 * currentPage : 2		--> startRow : 11	endRow : 20
			 * currentPage : 3		--> startRow : 21	endRow : 30
			 * 
			 * startRow : (currentPage - 1) * boardLimit + 1
			 * endRow : startRow + boardLimit - 1
			 */
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Meet(rset.getInt("ROOM_NO"),
							  rset.getString("ROOM_TITLE"),
							  rset.getString("ROOM_CONTENT"),
							  rset.getInt("ROOM_TOTAL_PP"),
							  rset.getInt("ROOM_NOW_PP"),
							  rset.getString("GENRE"),
							  rset.getInt("BOOK_NO"),
							  rset.getInt("MEMBER_NO"),
							  rset.getDate("CREATE_DATE"),
							  rset.getString("STATUS"),
							  rset.getString("BOOK_IMG")));
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}
	
	public RoomMemSet RoomMemSetSelect(Connection conn,int userNo, String roomNo) {
		
		RoomMemSet rms = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRMS");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, roomNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rms = new RoomMemSet(
							rset.getString("ROOM_NO"),
							rset.getInt("MEMBER_NO"),
							rset.getString("MEM_PIC"),
							rset.getString("MEM_CONTENT"),
							rset.getString("JOIN_YN"),
							rset.getString("APPLY_YN")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rms;
	}
	
	public int InsertApply(Connection conn, int userNo, String roomNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("InsertApply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, roomNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<MemMeet> selectRoomMemList(Connection conn,String roomNo){
		ArrayList<MemMeet> list = new ArrayList<MemMeet>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRoomMemList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, roomNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new MemMeet(
							rset.getString("MEMBER_NAME"),
							rset.getString("ROOM_NO"),
							rset.getInt("MEMBER_NO"),
							rset.getString("MEM_PIC"),
							rset.getString("MEM_CONTENT"),
							rset.getString("JOIN_YN"),
							rset.getString("APPLY_YN")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
