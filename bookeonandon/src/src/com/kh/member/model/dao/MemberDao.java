package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;
import com.kh.payment.model.vo.Payment;
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
		
//		System.out.println("loginUser"+loginUser);
		return loginUser;
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

	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getPhone());
			pstmt.setString(2, m.getNickname());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemberId());
//			System.out.println(m.getMemberId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePwdMember(Connection conn, String memberId, String memberPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
//		System.out.println(newPwd);
//		System.out.println(memberId);
//		System.out.println(memberPwd);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Payment> paymentInfo(Connection conn, PageInfo pi, int memberNo) {
		ArrayList<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPaymentList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2,  startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Payment(rset.getInt("RNUM"),
									rset.getInt("book_payno"),
									rset.getDate("book_paydate"),
								   rset.getString("book_title"),
								   rset.getInt("book_payprice"),
								   rset.getString("book_paytype"),
								   rset.getInt("member_no"),
								   rset.getInt("book_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
}
