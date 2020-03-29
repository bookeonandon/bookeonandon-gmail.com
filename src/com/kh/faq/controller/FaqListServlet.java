package com.kh.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.faq.model.service.FaqService;
import com.kh.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqListServlet
 */
@WebServlet("/faqList.f")
public class FaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
//ㄴ오러ㅏㅗㄴ아
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Faq> flist1 = new FaqService().typeList(1);
		ArrayList<Faq> flist2 = new FaqService().typeList(2);
		ArrayList<Faq> flist3 = new FaqService().typeList(3);
		ArrayList<Faq> flist4 = new FaqService().typeList(4);
		
		request.setAttribute("flist1", flist1);
		request.setAttribute("flist2", flist2);
		request.setAttribute("flist3", flist3);
		request.setAttribute("flist4", flist4);
		
		request.getRequestDispatcher("views/faq/faqView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
