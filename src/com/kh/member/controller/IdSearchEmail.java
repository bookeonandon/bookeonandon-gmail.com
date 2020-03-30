package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mail.MailSender;

/**
 * Servlet implementation class IdSearchEmail
 */
@WebServlet("/idSearchEmail.me")
public class IdSearchEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String idSearch = request.getParameter("idSearch");
		 * request.setAttribute("idSearch", idSearch);
		 * request.getRequestDispatcher("views/member/sendPwdMail.jsp").forward(request,
		 * response);
		 */
		
		String from = "bookeonandon@gmail.com";
		String idSearch = request.getParameter("idSearch");
		String idSearchId = request.getParameter("idSearchId");
		String subject = "[BOOK E ON&ON] 임시비밀번호 입니다.";
		String content = "안녕하세요 BOOK E ON&ON 입니다. <br>";
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<10; i++) { 
			idx = (int)(charSet.length * Math.random()); 
			sb.append(charSet[idx]);
			} 
		String ranNum = sb.toString();
		
		Properties p = new Properties(); // 정보를 담을 객체
		 
		p.put("mail.smtp.host","smtp.gmail.com"); // 구글 SMTP
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
		    Authenticator auth = new MailSender();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
  
		    msg.setSubject(subject); // 제목
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 보내는 사람
		     
		    Address toAddr = new InternetAddress(idSearch);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
		     
		    msg.setContent(content +  "전체 아이디 : "  + "<b>" + idSearchId + "</b> <br>" + "임시 비밀번호 : " + "<b>" + ranNum +"</b>"+ "<br>임시 비밀번호 입력후 비밀번호 재설정 해주세요 ","text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		    
		} catch(Exception e){
		    e.printStackTrace();
		    
		    response.getWriter().println("<script>alert('Email 발송에 실패했습니다.');history.back();</script>");
		    // 오류 발생시 뒤로 돌아가도록
		    return;
		}
		//out.println("<script>alert('메일 발송이 완료됐습니다.'); $('#ranNumPwd').submit(); </script>");		
		
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<form action='updatePwdForm.me' method='post' id='pwdForm'>");
		out.println("<input type='hidden' name='ranNum' value='" + ranNum + "'>");
		out.println("</form>");
		out.println("<script>alert('메일 발송이 완료됐습니다.'); document.getElementById('pwdForm').submit();</script>");		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
