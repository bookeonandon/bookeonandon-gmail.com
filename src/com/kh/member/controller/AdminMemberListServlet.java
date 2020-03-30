package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.mysub.model.service.MySubService;
import com.kh.mysub.model.vo.MySub;
import com.kh.product.model.service.SubscriptionService;
import com.kh.product.model.vo.Subscription;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/list.ame")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> list = new MemberService().adminSelectListMember();
		
		ArrayList<Coupon> cList = new CouponService().adminSelectListCoupon();
		
		ArrayList<Subscription> sList = new SubscriptionService().adminSelectListSubscription();
		
		
		if(list != null && cList != null && sList != null) {
			request.setAttribute("cList", cList);	// 쿠폰 리스트
			request.setAttribute("sList", sList);	// 구독권 리스트
			request.setAttribute("list", list);		// 회원 리스트
			request.getRequestDispatcher("/views/member/aMemberListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "회원정보 조회 실패");
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
