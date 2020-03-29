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
 * Servlet implementation class FaqUpdateFormServlet
 */
@WebServlet("/updateForm.afa")
public class FaqUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		Faq f = new FaqService().adminSelectDetailFaq(nno);
		
		
		if(f != null) {
			request.setAttribute("f", f);
			request.getRequestDispatcher("views/faq/faqUpdateForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "공지사항 조회 실패");
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
