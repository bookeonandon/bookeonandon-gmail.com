package com.kh.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class BookDetailInfoServlet
 */
@WebServlet("/bookDetail.bk")
public class BookDetailInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bookNo = Integer.parseInt(request.getParameter("bookNo"));
		
		// 책 상세조회
		Book b = new BookService().selectBookInfo(bookNo);
		
		// 조회수 ++
		int result = new BookService().increaseHits(bookNo);
		
		if(b != null) {
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/book/bookDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "책 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
