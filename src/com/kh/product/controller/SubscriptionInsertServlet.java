package com.kh.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.SubscriptionService;
import com.kh.product.model.vo.Subscription;

/**
 * Servlet implementation class SubscriptionInsertServlet
 */
@WebServlet("/insert.asb")
public class SubscriptionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubscriptionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("subName");
		int price = Integer.parseInt(request.getParameter("subPrice"));
		int date = Integer.parseInt(request.getParameter("subDate"));
		String content = request.getParameter("subContents");
		
		Subscription s = new Subscription();
		
		s.setSbName(name);
		s.setSbPrice(price);
		s.setSbDate(date);
		s.setSbContent(content);
		
		int result = new SubscriptionService().insertSubscription(s);
		
		if(result > 0) {
			response.sendRedirect("list.apr");
		}else {
			request.setAttribute("msg", "구독권 등록 실패");
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
