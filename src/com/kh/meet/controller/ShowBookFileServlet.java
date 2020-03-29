package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.Meet;

/**
 * Servlet implementation class ShowMemFileServlet
 */
@WebServlet("/showBookFile.mt")
public class ShowBookFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBookFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		
		Meet meet = new MeetService().MeetSelect(roomNo);
		JSONObject jsonObj = new JSONObject(); 
		
		if(meet != null) { // 조회된 경우
			
			jsonObj.put("bookImg", meet.getBookImg());

		}else {
			jsonObj = null;
		}
		
		response.setContentType("applocation/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// out.print(/* m.toString() */);
		out.print(jsonObj);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
