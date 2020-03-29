<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.kh.mail.MailSender"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		request.setCharacterEncoding("utf-8");
	
		String from = "bookeonandon@gmail.com";
		String idSearch = request.getParameter("idSearch");
		String subject = "[BOOK E ON&ON] 임시비밀번호 입니다.";
		String content = "안녕하세요 BOOK E ON&ON 입니다. <br>";
		
		 
		
		//int ranNum = (int)(Math.random() * 90000 + 10000);	
		
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
		// SMTP 서버에 접속하기 위한 정보들
		
		
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
		     
		    msg.setContent(content +  "임시 비밀번호 : " + "<b>" + ranNum +"</b>"+ "<br>임시 비밀번호 입력후 비밀번호 재설정 해주세요 ","text/html;charset=UTF-8"); // 내용과 인코딩
		     
		    Transport.send(msg); // 전송
		} catch(Exception e){
		    e.printStackTrace();
		    out.println("<script>alert('Email 발송에 실패했습니다.');history.back();</script>");
		    // 오류 발생시 뒤로 돌아가도록
		    return;
		}
		//out.println("<script>alert('메일 발송이 완료됐습니다.'); $('#ranNumPwd').submit(); </script>");		
		
		
	out.println("<script>alert('메일 발송이 완료됐습니다.'); location.href='updatePwdForm.me?ranNum=" + ranNum + "' </script>");		

	%>
<!--  
	<form action="<%=request.getContextPath()%>/updatePwdForm.me" method="post" id="ranNumPwd">
		<input type="hidden" name="ranNum" value="<%=ranNum %>">
	</form>-->
<!--  
<script>
function goOptionPage(ranNum) {
	   
		alert('메일 발송에 성공했습니다.'); 
		ranNum = "1231231";
	   
	   var $newForm = $('<form></form>');   
	   $newForm.attr("method", "post");
	   $newForm.attr("action", "updatePwdForm.me");
	   $newForm.appendTo('body');
	      
	   $newForm.append($("<input/>", {type:"hidden", name:"ranNum", value:ranNum}));
	  
	      
	   $newForm.submit();
	}
</script>-->	
	

</body>
</html>