package com.kh.member.controller;

import java.io.IOException;

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
@WebServlet("/updatePwd.me")
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
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * 
	 * String memberId = request.getParameter("memberId");
	 * 
	 * String setPwd = request.getParameter("setPwd");
	 * 
	 * HttpSession session = request.getSession(); // memberId =
	 * ((Member)session.getAttribute("loginUser")).getMemberId();
	 * 
	 * Member setPwdMem = new MemberService().setPwdMember(memberId, setPwd);
	 * 
	 * if(setPwdMem != null) {
	 * request.getRequestDispatcher("views/member/updatePwd.jsp").forward(request,
	 * response); session.setAttribute("loginUser", setPwdMem); }else {
	 * request.setAttribute("msg", "비밀번호 변경에 실패했습니다."); }
	 * 
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}