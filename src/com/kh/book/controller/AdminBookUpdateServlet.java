package com.kh.book.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminBookUpdateServlet
 */
@WebServlet("/update.abk")
public class AdminBookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookUpdateServlet() {
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
			
			String savePath = resources + "\\book_upfiles\\";
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			int bNo = Integer.parseInt(multiRequest.getParameter("name"));
			String title = multiRequest.getParameter("name");
			String subName = multiRequest.getParameter("subName");
			String author = multiRequest.getParameter("author");
			String publisher = multiRequest.getParameter("publish");
			String translator = multiRequest.getParameter("translator");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			int page = Integer.parseInt(multiRequest.getParameter("page"));
			Date date = Date.valueOf(multiRequest.getParameter("date"));
			String adult = multiRequest.getParameter("adult");
			
			String originThName = multiRequest.getOriginalFileName("thumbnail");
			String changeThName = multiRequest.getFilesystemName("thumbnail");
			
			String changePdfName = multiRequest.getFilesystemName("bookPdf");
			
			String cateogry = multiRequest.getParameter("category");
			String subCategory = multiRequest.getParameter("subCategory");
			String introduce = multiRequest.getParameter("introduce");
			String review = multiRequest.getParameter("review");
			String contents = multiRequest.getParameter("contents");
			

			if(adult == null) {
				adult = "N";
			}
			
		
			Book b = new Book();
			b.setBookNo(bNo);
			b.setTitle(title);
			b.setAuthor(author);
			b.setSubTitle(subName);
			b.setPublisher(publisher);
			b.setTranslator(translator);
			b.setPrice(price);
			b.setPage(page);
			b.setIssueDate(date);
			b.setIntroduction(introduce);
			b.setPublisherNotice(review);
			b.setContents(contents);
			b.setBookContent(changePdfName);
			b.setOriginThumbnail(originThName);
			b.setMoThumbnail(changeThName);
			b.setMainCategory(cateogry);
			b.setSubCategory(subCategory);
			b.setAdult(adult);
			
			
			
			int result = new BookService().adminUpateBook(b);
		
			
			if(result > 0) {
				response.sendRedirect("list.apr");
			}else {
				
				request.setAttribute("msg", "도서 수정실패");
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
