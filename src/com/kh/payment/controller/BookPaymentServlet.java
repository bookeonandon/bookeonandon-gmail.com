package com.kh.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.myCoupon.model.service.MyCouponService;
import com.kh.myCoupon.model.vo.MyCoupon;

/**
 * Servlet implementation class BookPaymentServlet
 */
@WebServlet("/bPayForm.bp")
public class BookPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		int uNo = Integer.parseInt(request.getParameter("uNo"));
		
		Book b = new BookService().paySelectDetail(bNo);
		
		MyCoupon mc = new MyCouponService().payDetailCoupon(uNo, b);
		
		if(b != null && mc != null) {
			request.setAttribute("b", b);
			request.setAttribute("mc", mc);
			request.getRequestDispatcher("/views/payment/bookPayment.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "해당 구독권 조회 실패");
			request.getRequestDispatcher("/views/common/adminErrorPage.jsp").forward(request, response);
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
