package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.product.model.service.SubscriptionService;
import com.kh.product.model.vo.Subscription;

/**
 * Servlet implementation class AdminProductListServlet
 */
@WebServlet("/list.apr")
public class AdminProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Subscription> list = new SubscriptionService().adminSelectListSubscription();
		
		ArrayList<Book> bList = new BookService().adminSelectListBook();

		if(list != null && bList != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/product/aProductListView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "상품 현황 조회 실패");
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
