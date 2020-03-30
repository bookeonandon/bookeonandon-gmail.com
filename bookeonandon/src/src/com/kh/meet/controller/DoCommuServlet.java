package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.MemMeet;
import com.kh.meet.model.vo.RoomMemSet;

/**
 * Servlet implementation class DoCommuServlet
 */
@WebServlet("/doCommu.mt")
public class DoCommuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoCommuServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* int userNo = Integer.parseInt(request.getParameter("userNo")); */
		String roomNo = request.getParameter("roomNo");
		ArrayList<MemMeet> list = new MeetService().selectRoomMemList(roomNo);
		
		response.setContentType("application/json; charset=utf-8"); 
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
