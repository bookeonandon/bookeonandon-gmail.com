package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.search.model.service.SearchService;
import com.kh.search.model.vo.Search;

/**
 * Servlet implementation class TitleSearchResultServlet
 */
@WebServlet("/moreTitle.sc")
public class TitleSearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitleSearchResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//	------------------ 페이징 처리 -----------------------
		
		int listCount;		// 총 게시글 개수
		int currentPage;	// 현재 페이지 (즉, 요청한 페이지)
		int startPage;		// 현재 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage;		// 현재 페이지 하단에 보여지는 페이징 바의 끝 수
		int maxPage;		// 전체 페이지에서의 가장 마지막 페이지
		
		int pageLimit;		// 한 페이지 하단에 보여질 페이지 최대 개수
		int boardLimit;		// 한 페이지에 보여질 게시글 최대 개수

		String keyword = request.getParameter("search");
		ArrayList<Search> list = new SearchService().searchTitle(keyword);
		
		// * listCount : 총 게시글 개수
		listCount = list.size();
		
		// * currentPage : 현재 페이지 (요청한 페이지)
		currentPage = 1;
		
		// 페이지 전환시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage로
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		request.setAttribute("list", list);
		request.setAttribute("search", keyword);
		RequestDispatcher view = request.getRequestDispatcher("views/search/titleMoreList.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
