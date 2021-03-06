package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class IdSearchServlet
 */
@WebServlet("/idSearch.me")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail = request.getParameter("idSearch");
		
		Member mem = new MemberService().idSearch(memberEmail);
		
		String result = null;
		String getId = null;
		String maskId = null;
		
		getId = mem.getMemberId();
		result = getId;
		
		int length = result.length();
		length = length -4;
		maskId = getId.substring(0, length);
		
		maskId = maskId + "****";
		result = maskId;
		
		
		
		
		if(mem != null) {
			request.setAttribute("mem", mem);
			request.setAttribute("result", result);
			request.getRequestDispatcher("views/member/memberSearchId.jsp").forward(request,response);
			
		}else {
			
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
