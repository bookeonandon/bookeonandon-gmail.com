package com.kh.meet.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.meet.model.dao.MeetDao;
import com.kh.meet.model.service.MeetService;
import com.kh.meet.policy.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UploadMemFileServlet
 */
@WebServlet("/uploadMemFile.mt")
public class UploadMemFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadMemFileServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		int result = 0;
		int userNo = 0;
		int roomNo = 0;
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;

			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\meetMemImg\\";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Enumeration files=multiRequest.getFileNames();
			String file1=(String)files.nextElement();
			
			
			 userNo = Integer.parseInt(multiRequest.getParameter("userNo")); 
			 roomNo = Integer.parseInt(multiRequest.getParameter("roomNo"));
			 
			
			if(multiRequest.getOriginalFileName(file1) != null) {
			
			// 첨부파일의 원본명
			String originName = multiRequest.getOriginalFileName(file1);
			// 첨부파일의 수정명
			String changeName = multiRequest.getFilesystemName(file1);
			
			result = new MeetService().uploadMemFile(changeName, roomNo, userNo);
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
