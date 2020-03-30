package com.kh.member.model.dao;

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

import com.kh.member.model.vo.Administrator;
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
	


	//admin push 테스트
	public ArrayList<Member> adminSelectListMember(Connection conn){
		
		ArrayList<Member> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectListMember");
		
			try {
				stmt = conn.createStatement();
				rset  = stmt.executeQuery(sql);
				
				while(rset.next()) {
					list.add(new Member(rset.getInt("MEMBER_NO"),
										rset.getString("MEMBER_ID"),
										rset.getString("EMAIL"),
										rset.getString("MEMBER_NAME"),
										rset.getString("PHONE"),
										rset.getInt("COUNT"),
										rset.getDate("JOIN_DATE"),
										rset.getDate("DEL_DATE"),
										rset.getDate("BLACKLIST_DATE"),
										rset.getInt("SB_NO")));
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
		
		return list;
		
		
	}

	public int adminBlackUpdate(Connection conn, String[] id) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminBlackUpdate");
		
		
		try {
			
			for(int i=0; i<id.length; i++) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id[i]);
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		System.out.println(result);
		
		return result;
		
	}
	
	public Member adminSelectDetail(Connection conn, int uNo) {
		
		  Member mem = null;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("selectMember");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, uNo);
	         rset = pstmt.executeQuery();
	         if(rset.next()) {
	            mem = new Member(rset.getInt("member_no"),
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
	      
	      return mem;

		
	}
	

	public int insertMember(Connection conn, Member m , String birth) {
		
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
			pstmt.setString(6, birth);
			pstmt.setString(7,m.getNickname());
			pstmt.setString(8,m.getGender());
			
			
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
			pstmt.setString(1,  memberId);
			pstmt.setString(2, memberPwd);
			
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
		
	
		return loginUser;
	}
	
	public Administrator adminLogin(Connection conn, String adminId, String adminPwd) {
		
		
		Administrator adminLogin = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminLogin");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			rset = pstmt.executeQuery();
			

			if(rset.next()) {
				adminLogin = new Administrator(rset.getString("admin_id"),
									   			rset.getString("admin_pwd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return adminLogin;	
	}
	
	public Member idSearch(Connection conn, String memberEmail) {
		Member mem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("member_no"),
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
		return mem;
	}
	
	public int newPwdMember(Connection conn, String memberId, String newPwd) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newPwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}
	
	public Member selectMember(Connection conn, String memberId) {

		Member mem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				
				mem = new Member(rset.getInt("member_no"),
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
		
		
		return mem;
	}

	    
	         
	 
	      
	      
	
}
