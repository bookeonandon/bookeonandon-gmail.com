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
import com.kh.member.model.vo.Wishlist;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/myPageMain.my")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memberId = loginUser.getMemberId();
		int memberNo = loginUser.getMemberNo();

		Member mem = new MemberService().selectMember(memberId);
		ArrayList<Wishlist> memberWishlist = new MemberService().memberWishlist(memberNo);

		if(mem != null) {
			request.setAttribute("mem", mem);
			request.setAttribute("memberWishlist", memberWishlist);
			RequestDispatcher view = request.getRequestDispatcher("views/member/myPageMain.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "조회실패");
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
