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
 * Servlet implementation class EventUpdateServlet
 */
@WebServlet("/update.aev")
public class EventUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateServlet() {
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

			int nno = Integer.parseInt(multiRequest.getParameter("nno"));
			String title = multiRequest.getParameter("title");
			Date date = Date.valueOf(multiRequest.getParameter("date"));
			String writer = multiRequest.getParameter("writer");
			
			e.setEventNo(nno);
			e.setEventTitle(title);
			e.setEventDate(date);
			e.setEventWriter(writer);
			
			
			String detailImg = multiRequest.getFilesystemName("detailImg");
			String thumbnail = multiRequest.getFilesystemName("thumbnail");
			
			
			int result = 0;
			
			// 수정할 이미지 파일이 없는 경우 
			if(detailImg == null && thumbnail == null) {
				
				result = new EventService().updateNoFileEvent(e);

			}else {
							
				e.setEventImg(detailImg);
				e.setEventThumbnail(thumbnail);
				
				result = new EventService().updateFileEvent(e);
			}

			if(result > 0) {
				response.sendRedirect("list.aev");
			}else {
				request.setAttribute("msg", "이벤트 수정 실패");
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
