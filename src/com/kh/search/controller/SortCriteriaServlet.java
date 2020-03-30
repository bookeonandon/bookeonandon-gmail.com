package com.kh.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.search.model.service.SearchService;
import com.kh.search.model.vo.Search;

/**
 * Servlet implementation class SortCriteriaServlet
 */
@WebServlet("/sortCriteria.sc")
public class SortCriteriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortCriteriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("keyword");
		String sortCriteria = request.getParameter("sortCriteria");
		
		ArrayList<Search> list = new ArrayList<>();
		if(sortCriteria.equals("pop")) {
			list = new SearchService().sortPop(keyword);
		}else if(sortCriteria.equals("highScore")) {
			list = new SearchService().sortHighScore(keyword);
		}else if(sortCriteria.equals("issueDate")) {
			list = new SearchService().sortIssueDate(keyword);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
