package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.meet.model.service.MeetService;

/**
 * Servlet implementation class approveMemberServlet
 */
@WebServlet("/approveMember.mt")
public class approveMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approveMemberServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		int result = new MeetService().approveMember(memberNo, roomNo);
		
		response.setContentType("applocation/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//out.print(m/* .toString() */);
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
