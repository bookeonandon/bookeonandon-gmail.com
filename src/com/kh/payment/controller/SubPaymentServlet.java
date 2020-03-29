package com.kh.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.SubscriptionService;
import com.kh.product.model.vo.Subscription;

/**
 * Servlet implementation class SubPaymentServlet
 */
@WebServlet("/sPayForm.sp")
public class SubPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		
		Subscription s = new SubscriptionService().selectDetailView(sNo);
		
		if(s != null) {
			request.setAttribute("s", s);
			request.getRequestDispatcher("views/payment/subPayment.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "해당 구독권 조회 실패");
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
