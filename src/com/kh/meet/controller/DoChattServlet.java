package com.kh.meet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.MemMeet;
import com.kh.meet.model.vo.RoomCommunity;

/**
 * Servlet implementation class DoChattServlet
 */
@WebServlet("/dochatt.mt")
public class DoChattServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoChattServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		System.out.println(roomNo);
		ArrayList<RoomCommunity> list = new MeetService().selectRoomChattList(roomNo);
		
		response.setContentType("application/json; charset=utf-8"); 
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
