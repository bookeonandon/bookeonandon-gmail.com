package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;
public class MemberDao {

	

	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemberName());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6,m.getNickname());
			pstmt.setString(7,m.getGender());
			pstmt.setDate(8, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int idCheck(Connection conn, String memberId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
				
	}
	
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		
		Member loginUser = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			pstmt.setString(2,memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("member_no"),
									   rset.getString("member_id"),
									   rset.getString("member_pwd"),
									   rset.getString("email"),
									   rset.getString("member_name"),
									   rset.getString("phone"),
									   rset.getDate("birth"),
									   rset.getInt("age"),
									   rset.getDate("join_date"),
									   rset.getString("del_yn"),
									   rset.getDate("del_date"),
									   rset.getString("blacklist"),
									   rset.getDate("blacklist_date"),
									   rset.getString("nickname"),
									   rset.getString("gender"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("loginUser"+loginUser);
		return loginUser;
	}
}
