package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;
import com.kh.member.model.vo.Wishlist;
import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class MyPageLibrary
 */
@WebServlet("/myPageLibrary.my")
public class MyPageLibrary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageLibrary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		
  		int listCount;
  		int currentPage;
 		int startPage;
 		int endPage;
 		int maxPage;
 		int pageLimit;
 		int boardLimit;
 		
 		listCount = new PaymentService().getListCount(memberNo);
 		currentPage = 1;
 		if(request.getParameter("currentPage") != null) {
 			currentPage = Integer.parseInt(request.getParameter("currentPage"));
 		}
 		pageLimit = 5;
 		boardLimit = 10;
 		maxPage = (int)Math.ceil((double)listCount/boardLimit);
 		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
 		endPage = startPage + pageLimit - 1;
 		if(maxPage < endPage) {
 			endPage = maxPage;
 		}
 		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
 		ArrayList<Wishlist> memberLibrary = new MemberService().memberLibrary(pi, memberNo);
		
		request.setAttribute("memberLibrary", memberLibrary);
 		request.setAttribute("pi", pi);
		RequestDispatcher view = request.getRequestDispatcher("views/member/myPageLibrary.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
