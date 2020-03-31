package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/update.ame")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int uNo = Integer.parseInt(request.getParameter("uNo"));
		String uName = request.getParameter("uname");
		String nName = request.getParameter("nname");
		String email = request.getParameter("email");
		Date birthday = Date.valueOf(request.getParameter("birth"));
		String phone = request.getParameter("phone");
		
		
		
		Member m = new Member();
		
		m.setMemberName(uName);
		m.setNickname(nName);
		m.setEmail(email);
		m.setBirth(birthday);
		m.setPhone(phone);
		
		System.out.println(m);
		
		int result = new MemberService().adminUpdateMember(m, uNo);
		
		System.out.println(result);
		
		if(result > 0) {
			response.sendRedirect("list.ame");
		}else {
			request.setAttribute("msg", "회원정보 수정 실패");
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
