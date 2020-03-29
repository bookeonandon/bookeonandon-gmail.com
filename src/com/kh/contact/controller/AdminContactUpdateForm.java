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
 * Servlet implementation class AdminContactUpdateForm
 */
@WebServlet("/updateForm.act")
public class AdminContactUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContactUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		Contact c = new ContactService().adminSelectUpdateContact(nno);
		
		if(c != null) {
			request.setAttribute("c", c);
			request.getRequestDispatcher("/views/contact/aContactUpdateForm.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "1:1 문의 조회 실패");
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
