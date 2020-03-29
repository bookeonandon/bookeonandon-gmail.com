package com.kh.event.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.event.model.service.EventService;
import com.kh.event.model.vo.Event;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EventInsertServlet
 */
@WebServlet("/insert.aev")
public class EventInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 1024*1024*10;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			String savePath = resources + "\\event_upfiles\\";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			Event e = new Event();

			
			String title = multiRequest.getParameter("title");
			Date date = Date.valueOf(multiRequest.getParameter("date"));
			String writer = multiRequest.getParameter("writer");
			
			
			String detailImg = multiRequest.getFilesystemName("detailImg");
			String thumbnail = multiRequest.getFilesystemName("thumbnail");
			
			e.setEventTitle(title);
			e.setEventDate(date);
			e.setEventImg(detailImg);
			e.setEventThumbnail(thumbnail);
			e.setEventWriter(writer);
			
		
		int result = new EventService().insertEvent(e);
		
		if(result > 0) {
			response.sendRedirect("list.aev");
		}else {

			request.setAttribute("msg", "이벤트 등록실패");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);
		}




			
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
