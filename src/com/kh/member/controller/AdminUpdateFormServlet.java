package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.myCoupon.model.service.MyCouponService;
import com.kh.myCoupon.model.vo.MyCoupon;
import com.kh.mysub.model.service.MySubService;
import com.kh.mysub.model.vo.MySub;

/**
 * Servlet implementation class AdminUpdateFormServlet
 */
@WebServlet("/updateForm.ame")
public class AdminUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nId = request.getParameter("nId");
		
		Member m = new MemberService().adminUpdateFormMember(nId);
		ArrayList<MyCoupon> list = new MyCouponService().adminSelectMyCoupon(nId);
		MySub ms = new MySubService().adminSelectMySub(nId);
		
		if(m != null) {
			request.setAttribute("m", m);
			request.setAttribute("list", list);
			request.setAttribute("ms", ms);
			request.getRequestDispatcher("views/member/aMemberDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "FAQ 상세조회 실패");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);
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
