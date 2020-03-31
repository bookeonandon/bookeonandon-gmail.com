package com.kh.library.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.library.model.service.LibraryService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class InsertWishListServlet
 */
@WebServlet("/insertWishList.lib")
public class InsertWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertWishListServlet() {
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
	    
		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		int result = new LibraryService().insertWishList(memberNo, bookNo);
		
		PrintWriter out = response.getWriter();
		
		out.print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
