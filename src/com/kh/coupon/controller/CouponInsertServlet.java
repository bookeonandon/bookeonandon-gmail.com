package com.kh.coupon.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.coupon.model.service.CouponService;
import com.kh.coupon.model.vo.Coupon;

/**
 * Servlet implementation class CouponInsetServlet
 */
@WebServlet("/insert.aco")
public class CouponInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		Date exp = Date.valueOf(request.getParameter("expdate"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		String textRange = request.getParameter("range");
		String content = request.getParameter("content");
		
		Coupon c = new Coupon();
		
		int range = 0;
		
		if(textRange.equals("전체")) {
			range = 0;
		}else {
			range = Integer.parseInt(textRange);
		}
		
		c.setCouponName(name);
		c.setCouponExp(exp);
		c.setCouponSale(sale);
		c.setCouponRange(range);
		c.setCouponContent(content);
		
		int result = new CouponService().insertCoupon(c);
		
		if(result > 0) {
			response.sendRedirect("list.aco");
		}else {

			request.setAttribute("msg", "쿠폰 등록실패");
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
