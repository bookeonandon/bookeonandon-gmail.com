package com.kh.meet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.meet.model.service.MeetService;
import com.kh.meet.model.vo.Meet;
import com.kh.meet.model.vo.PageInfo;

/**
 * Servlet implementation class meetMainservlet
 */
@WebServlet("/meetMain.mt")
public class MeetMainservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetMainservlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		session.setAttribute("userNo", "1");

		
		// ------------------ 페이징 처리 ------------------
				int listCount;			// 총 게시글 갯수
				int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
				int startPage;			// 현재 페이지 하단에 보여지는 페이징 바의 시작 수
				int endPage;			// 현재 페이지 하단에 보여지는 페이징 바의 끝 수
				int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
				
				int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대 갯수
				int boardLimit;			// 한 페이지에 보여질 게시글 최대 갯수
				
				// * listCount : 총 게시글 갯수
				listCount = new MeetService().getListCount();
				
				// * currentPage : 현재 페이지 (요청한 페이지)
				currentPage = 1;
				
				// 페이지 전환시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage로!!
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				// * pageLimit : 한 페이지 하단에 보여질 페이지 최대 갯수
				pageLimit = 10;
				
				// * boardLimit : 한 페이지에 보여질 게시글 최대 갯수
				boardLimit = 12;
				
				// * maxPage : 총 페이지 수
				maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
				// * startPage : 현재 페이지에 보여지는 페이징바의 시작 수
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수 
				endPage = startPage + pageLimit - 1;
				
				// 단, maxPage가 고작 13까지 밖에 안된다면? --> endPage를 13으로 해야됨!
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				// 구해진 페이지 정보들 PageInfo 객체 담기
				PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
				
				//System.out.println(pi);
				
				// 현재 페이지에 보여질 게시글 리스트 조회하기
		ArrayList<Meet> list = new MeetService().selectList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view  = request.getRequestDispatcher("views/meet/meetingMainView.jsp");
		view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
