package com.kh.contact.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contact.model.service.ContactService;
import com.kh.contact.model.vo.Contact;

/**
 * Servlet implementation class AdminContactUpdateServlet
 */
@WebServlet("/update.act")
public class AdminContactUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContactUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		String comment = request.getParameter("comment");
		String status = request.getParameter("status");
		String rewriter = request.getParameter("rewriter");
		
		Contact c = new Contact();
		
		c.setContactNo(nno);
		c.setComment(comment);
		c.setContactStatus(status);
		c.setContactReWriter(rewriter);
		
		
		int result = new ContactService().adminContactUpdate(c);
		
		if(result > 0) {
			response.sendRedirect("list.act");
		}else {
			request.setAttribute("msg", "1:1 문의 답변 수정 실패");
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
