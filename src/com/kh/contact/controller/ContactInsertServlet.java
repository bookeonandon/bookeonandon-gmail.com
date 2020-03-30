package com.kh.contact.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contact.model.service.ContactService;
import com.kh.contact.model.vo.Contact;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ContactInsertServlet
 */
@WebServlet("/contactInsert.cot")
public class ContactInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int contactType = Integer.parseInt(request.getParameter("contactType"));
		String contactTitle = request.getParameter("contactTitle");
		String contactContent = request.getParameter("contactContent");
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		
		Contact c = new Contact();
		
		c.setContactType(contactType);
		c.setContactTitle(contactTitle);
		c.setContactContent(contactContent);
		c.setContactWriter(String.valueOf(memberNo));
		
		int result = new ContactService().insertContact(c);


		PrintWriter out = response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
