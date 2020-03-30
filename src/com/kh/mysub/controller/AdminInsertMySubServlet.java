package com.kh.mysub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mysub.model.service.MySubService;
import com.kh.mysub.model.vo.MySub;
import com.kh.product.model.service.SubscriptionService;
import com.kh.product.model.vo.Subscription;

/**
 * Servlet implementation class AdminInsertMySubServlet
 */
@WebServlet("/insert.ams")
public class AdminInsertMySubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertMySubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int uNo = Integer.parseInt(request.getParameter("userNo"));
		int subNewNo = Integer.parseInt(request.getParameter("subNewNo"));
		
		Subscription s = new SubscriptionService().selectDetailView(subNewNo);
		
		MySub ms = new MySubService().adminSelectDetail(uNo);
		
		int result = new MySubService().adminInsertMySubService(uNo, s, ms);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
