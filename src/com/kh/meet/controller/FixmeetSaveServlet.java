package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.Meeting;

/**
 * Servlet implementation class FixmeetSaveServlet
 */
@WebServlet("/fixmeetSave.mt")
public class FixmeetSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FixmeetSaveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		String meetLocation = request.getParameter("meetLocation");
		String meetContents = request.getParameter("meetContents");
		String meetTime = request.getParameter("meetTime");

		Timestamp sqlDate = Timestamp.valueOf(meetTime);

		// meeting table 조회 먼저하고 없으면 fixmeetSave 만들고 있으면 update 던지는 로직 짜기
		Meeting meeting = new MeetService().selFixmeet(roomNo);

		int result = 0;

		if (meeting == null) {
			result = new MeetService().fixmeetSave(roomNo, meetLocation, meetContents, sqlDate);
		} else {
			result = new MeetService().fixmeetUpdate(roomNo, meetLocation,meetContents, sqlDate);
			System.out.println(roomNo);
			System.out.println(meetLocation);
			System.out.println(meetContents);
			System.out.println(meetTime);
			System.out.println("일로ㅇ와야댐");
		}

		response.setContentType("applocation/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// out.print(/* m.toString() */);
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
