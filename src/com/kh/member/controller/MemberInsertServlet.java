package com.kh.member.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
	
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("val-phone");
		String email = request.getParameter("val-email");
		String birth = request.getParameter("birth");
		String nickname = request.getParameter("nickname");
		String gender = request.getParameter("val-gender");
		
		
		
		
		Member mem = new Member();
		mem.setMemberId(memberId);
		mem.setMemberPwd(memberPwd);
		mem.setMemberName(memberName);
		mem.setPhone(phone);
		mem.setEmail(email);
		mem.setNickname(nickname);
		mem.setGender(gender);
		
		System.out.println(email);
		System.out.println(mem);
		int result = new MemberService().insertMember(mem, birth);
	
		
		if(result > 0) {	// 회원가입 성공시
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberEnrollComplete.jsp");
			view.forward(request, response);
			
			
			
		}else {	// 회원가입 실패시
			
		
			
			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
