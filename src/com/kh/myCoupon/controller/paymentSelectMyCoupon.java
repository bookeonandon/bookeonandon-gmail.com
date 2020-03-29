package com.kh.myCoupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.myCoupon.model.service.MyCouponService;
import com.kh.myCoupon.model.vo.MyCoupon;

/**
 * Servlet implementation class paymentSelectMyCoupon
 */
@WebServlet("/open.cp")
public class paymentSelectMyCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentSelectMyCoupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uNo = Integer.parseInt(request.getParameter("uNo"));
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		ArrayList<MyCoupon> list = new MyCouponService().payDetailCoupon(uNo, bNo);
		
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/payment/payMyCoupon.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "FAQ 조회 실패");
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
