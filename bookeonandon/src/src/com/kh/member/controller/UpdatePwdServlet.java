package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwd
 */
@WebServlet("/changePwd.my")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	 String memberPwd = request.getParameter("memberPwd");
	 String newPwd = request.getParameter("newPwd");
	 
	 HttpSession session = request.getSession();
	 String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
	 Member updateMem = new MemberService().updatePwdMember(memberId, memberPwd, newPwd);
	 
	 if(updateMem != null) {
		 request.setAttribute("msg", "비밀번호 변경 성공");
		 session.setAttribute("loginUser", updateMem);
		 System.out.println(updateMem);
		 RequestDispatcher view = request.getRequestDispatcher("/myPageInfo.my");
		 view.forward(request, response);
	 }else {
		 request.setAttribute("msg", "비밀번호 변경 실패");
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
