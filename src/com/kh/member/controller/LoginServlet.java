package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Administrator;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
	
		Member loginUser = new MemberService().loginMember(memberId, memberPwd);
		
//		if(loginUser.getMemberId().equals("admin1")|| loginUser.getMemberId().equals("admin2")){ // --> 회원 x 관리자  (일반 회원이거나 아니거나)
//
//			if(loginUser.getMemberId().equals("admin1")&&(loginUser.getMemberPwd().equals("1234")) || loginUser.getMemberId().equals("admin2") && loginUser.getMemberPwd().equals("5678")) {
//			 new MemberService().adminLogin(memberId, memberPwd);
//			 response.sendRedirect("request.getContext()");
//			}else {	// 로그인 실패했을 때
//				
//				// 아이디와 로그인이 다르다 라는 표시
//			}
//		}else {	// 회원일 때
//			
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
			
				request.getRequestDispatcher("/views/common/menubar.jsp").forward(request, response);
				
			}else {
				
				Administrator adminUser = new MemberService().adminLogin(memberId, memberPwd);
				
				if(adminUser != null) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", loginUser);
					request.getRequestDispatcher("payRe.apm").forward(request, response);
					
				}else {
					response.sendRedirect("loginForm.me");
				}
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
