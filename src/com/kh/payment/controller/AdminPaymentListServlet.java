package com.kh.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.payment.model.service.PaymentService;
import com.kh.payment.model.vo.Payment;

/**
 * Servlet implementation class AdminPaymentListServlet
 */
@WebServlet("/list.apm")
public class AdminPaymentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPaymentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Payment> list = new PaymentService().adminSelectListSPay();
		ArrayList<Payment> bList = new PaymentService().adminSelectListBPay();
		
		
		if(list != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/payment/aPaymentListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "결제내역 조회 실패");
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
