package com.kh.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FaqService;
import com.kh.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/faqInsert.afa")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		int status = Integer.parseInt(request.getParameter("status"));
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		Faq f = new Faq();
		
		f.setFaqTitle(title);
		f.setFaqType(status);
		f.setFaqContent(content);
		f.setFaqWriter(writer);
		
		
		int result = new FaqService().insertFaq(f);
		
		if(result > 0) {
			response.sendRedirect("list.afa");
		}else {
			request.setAttribute("msg", "FAQ 작성 실패");
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
