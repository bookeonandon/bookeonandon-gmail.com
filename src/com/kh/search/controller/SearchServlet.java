package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.kh.member.model.vo.Member;
import com.kh.search.model.service.SearchService;
import com.kh.search.model.vo.Search;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/searchList.sc")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    Member loginUser = (Member)session.getAttribute("loginUser");
		
	    String keyword = request.getParameter("search");
	    
	    int memberNo;
	    
    	// 검색 카운트 (없으면 insert, 있으면 DB에서 count +1)
	    if(loginUser == null) {
	    	memberNo = 0;
	    }else {
	    	memberNo = loginUser.getMemberNo();	    	
	    }
	    int searchCount = new SearchService().selectCount(keyword, memberNo);
		
		
		// 도서 제목 검색결과
		ArrayList<Search> list1 = new SearchService().searchTitle(keyword);
		
		// 작가 검색결과
		ArrayList<Search> list2 = new SearchService().searchAuthor(keyword);
				
		if(list1.isEmpty() && list2.isEmpty() || keyword.equals("")) {	// 검색결과 없음
			
			
			request.setAttribute("msg", " 에 해당하는 검색결과가 없습니다.");
			request.setAttribute("keyword", keyword);
			RequestDispatcher view = request.getRequestDispatcher("views/search/searchResultNone.jsp");
			view.forward(request, response);
			
		}else {		// 검색결과 조회 성공
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			
			RequestDispatcher view = request.getRequestDispatcher("views/search/searchResult.jsp");
			view.forward(request, response);
			
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
