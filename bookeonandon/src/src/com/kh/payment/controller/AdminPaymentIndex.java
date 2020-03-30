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
 * Servlet implementation class AdminPaymentIndex
 */
@WebServlet("/payRe.apm")
public class AdminPaymentIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPaymentIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 최근 한 달 구독권 구매수
		Payment sPC = new PaymentService().countSBPayment();
		// 가장 많이 구매된 구독권
		Payment mP	= new PaymentService().manySBPayment();
		// 최근 구매한 다섯명
		ArrayList<Payment> rP = new PaymentService().recentSBPayment();
		
		
		// 최근 한 달 도서 결제수
		Payment bPC = new PaymentService().countBPayment();
		// 가장 많이 판매된 도서
		Payment mBP	= new PaymentService().manyBPayment();
		// 최근 구매한 다섯명
		ArrayList<Payment> rBP = new PaymentService().recentBPayment();
		
		// 최근 구매한 다섯명
		Payment mGP = new PaymentService().manyBGPayment();
		
		

		
		if(sPC != null && mP != null && bPC != null) {
			request.setAttribute("sPC", sPC);
			request.setAttribute("mP", mP);
			request.setAttribute("rP", rP);
			
			request.setAttribute("bPC", bPC);
			request.setAttribute("mBP", mBP);
			request.setAttribute("rBP", rBP);
			
			request.setAttribute("mGP", mGP);
			request.getRequestDispatcher("views/payment/aPaymentIndex.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "통계 조회 실패");
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
