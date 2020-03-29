package com.kh.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.payment.model.service.PaymentService;

/**
 * Servlet implementation class SubPaymentInsertServlet
 */
@WebServlet("/insert.sb")
public class SubPaymentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubPaymentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 전달된 유저 번호
		int uNo = Integer.parseInt(request.getParameter("uNo"));
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		String type = request.getParameter("type");
		
		int result = new PaymentService().insertSbPayment(uNo, sNo, type);
		
		if(result > 0) {
			response.sendRedirect("complete.pay");
		}else {
			request.setAttribute("msg", "구독권 구매 실패");
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
