package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/noticeList.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeListCount;
		int noticeCurrentPage;
		int noticeStartPage;
		int noticeEndPage;
		int noticeMaxPage;
		
		int noticePageLimit;
		int noticeLimit;
		
		
		noticeListCount = new NoticeService().getNoticeListCount();
		
		noticeCurrentPage = 1;
		
		if(request.getParameter("noticeCurrentPage") != null) {
			noticeCurrentPage = Integer.parseInt(request.getParameter("noticeCurrentPage"));
		}
		
		noticePageLimit = 5;
		
		noticeLimit = 5;
		
		noticeMaxPage = (int)Math.ceil((double)noticeListCount/noticeLimit);
		
		
		/*
		 noticeStartPage: 1, 6, 11 ... --> n* 5 +1
		 noticeCurrentPAge : 1, --> 0 *5 + 1
		 					6 --> 1 * 5 + 1\
		 					1~ 5 n =0
		 					6~10 n =1
		 					
		 					n = NoticeCurrentPage -1 / noticePageLimit
		 */
		noticeStartPage = (noticeCurrentPage -1) / noticePageLimit * noticePageLimit + 1;
		
		/*
		 end page 
		 noticePageLimit : 5 일때
		 noticeStartPage : 1 --> 5
		 					6 --> 10
		 * */
		noticeEndPage = noticeStartPage + noticePageLimit -1;
		
		if(noticeMaxPage < noticeEndPage) {
			noticeEndPage = noticeMaxPage;
		}
		
		NoticePageInfo npi = new NoticePageInfo(noticeListCount, noticeCurrentPage, noticeStartPage, noticeEndPage, noticeMaxPage, noticePageLimit, noticeLimit);
		
	

		ArrayList<Notice> list = new NoticeService().selectList(npi);
		
		request.setAttribute("list", list);
		request.setAttribute("npi", npi);
		
		request.getRequestDispatcher("views/notice/noticeView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
