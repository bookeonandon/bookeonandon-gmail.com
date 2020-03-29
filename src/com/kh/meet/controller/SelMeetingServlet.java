package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.Meeting;
import com.sun.jmx.snmp.Timestamp;

/**
 * Servlet implementation class SelMeetingServlet
 */
@WebServlet("/selMeeting.mt")
public class SelMeetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelMeetingServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomNo = Integer.parseInt(request.getParameter("roomNo1"));
		Meeting meeting = new MeetService().selFixmeet(roomNo);
		
		JSONObject jsonObj = new JSONObject(); 
		String formatStr = "";
		if(meeting != null) {
			formatStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(meeting.getMeetTime());
		}
		
		
		if(meeting != null) { // 조회된 경우
			jsonObj.put("roomNo", meeting.getRoomNo()); 
			jsonObj.put("meetContent", meeting.getMeetContent());
			jsonObj.put("meetLocation",  meeting.getMeetLocation()); 
			jsonObj.put("meetTime", formatStr); 
		}else {
			jsonObj = null;
		}
		System.out.println(jsonObj);
		response.setContentType("applocation/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
