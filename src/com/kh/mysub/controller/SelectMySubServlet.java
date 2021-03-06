package com.kh.mysub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.mysub.model.service.MySubService;
import com.kh.mysub.model.vo.MySub;

/**
 * Servlet implementation class SelectMySubServlet
 */
@WebServlet("/detail.msb")
public class SelectMySubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMySubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int uNo = Integer.parseInt(request.getParameter("userNo"));
		
		MySub ms = new MySubService().adminSelectDetail(uNo);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(ms, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
