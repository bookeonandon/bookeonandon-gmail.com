package com.kh.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;

/**
 * Servlet implementation class AdminBookUpdateFormServlet
 */
@WebServlet("/updateForm.abk")
public class AdminBookUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		
		Book b = new BookService().adminUpdateFormBook(bNo);
		

		
		if(b != null) {
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/book/aBookUpdateForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "도서 상세조회 실패");
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
