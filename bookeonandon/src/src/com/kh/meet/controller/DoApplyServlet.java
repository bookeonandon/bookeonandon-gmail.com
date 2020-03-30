package com.kh.meet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.RoomMemSet;

/**
 * Servlet implementation class DoApplyServlet
 */
@WebServlet("/doApply.mt")
public class DoApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoApplyServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String roomNo = request.getParameter("roomNo");
		
		RoomMemSet rms = new MeetService().InsertApply(userNo, roomNo);
		
		JSONObject jsonObj = new JSONObject(); 
		
		if(rms != null) { // 조회된 경우
			jsonObj.put("roomNo", rms.getRoomNo()); 
			jsonObj.put("memberNo", rms.getMemberNo());
			jsonObj.put("memPic",  rms.getMemberPic()); 
			jsonObj.put("memContent", rms.getMemberContent()); 
			jsonObj.put("joinYN", rms.getJoinYN()); 
			jsonObj.put("applyYN", rms.getApplyYN());
		}else {
			jsonObj = null;
		}
		
		response.setContentType("applocation/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//out.print(m/* .toString() */);
		out.print(jsonObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
