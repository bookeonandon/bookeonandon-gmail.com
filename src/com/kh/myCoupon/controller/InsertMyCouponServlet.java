package com.kh.myCoupon.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;
import com.kh.myCoupon.model.service.MyCouponService;

/**
 * Servlet implementation class InsertMyCoupon
 */
@WebServlet("/insert.amc")
public class InsertMyCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMyCouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chk = request.getParameter("chkk");
		String[] uNo = chk.split(",");
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		Coupon c = new CouponService().detailCoupon(cNo);
		
		int result = new MyCouponService().insertMyCoupon(uNo, c);
		
		response.setContentType("application/json; charset=utf-8");
		
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
