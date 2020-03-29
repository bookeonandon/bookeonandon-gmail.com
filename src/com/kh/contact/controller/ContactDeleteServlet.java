package com.kh.contact.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contact.model.service.ContactService;

/**
 * Servlet implementation class ContactDeleteServlet
 */
@WebServlet("/delete.cot")
public class ContactDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] deleteNo = request.getParameterValues("deleteNo");
		int result = 0;
		boolean flag = true;
		
		if(deleteNo != null) {
			
			
			for(int i=0; i<deleteNo.length; i++) {
				 int dNo = Integer.parseInt(deleteNo[i]);
				 result = new ContactService().deleteContact(dNo);
				 
				 System.out.println(result);
				 if(result == 0) {
					 flag = false;
					 break;
				 }
			}
			
			if(flag) {
				request.getRequestDispatcher("views/contact/contactView.jsp").forward(request,response);
			}else {
				// 에러페이지 (alert )
			}
			
		}else {
			
				// 에러페이지 (alert )
			
			
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
