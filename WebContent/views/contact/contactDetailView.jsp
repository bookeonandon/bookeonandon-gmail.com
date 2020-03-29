<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.contact.model.vo.Contact" %>    
<%
	Contact c = (Contact)request.getAttribute("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>contactDetailView</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="bodycolor">
	<%@ include file="../common/menubar.jsp" %>
	
	 <div class="contact-body">

        
             <div class="col-md-12">
                  <div class="table-responsive">
                      <table class="table header-border text-center">
                          <thead>
                              <tr>
                                  <th>No</th>
                                  <th>날짜</th>
                                  <th>질문유형</th>
                                  <th>제목</th>
                                  <th>처리상태</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td><input type="checkbox" name="contactcheck" value="1" class="css-control-input"></td>
                                  <td><%=c.getContactDate() %></td>
                                  <td>
                                  	<% 
                                  	switch(c.getContactType()){
                                  	case 1: out.println("구독/서비스 이용 문의"); break;
         							case 2:	out.println("결제/취소/환불 문의"); break;
         							case 3: out.println("오류 문의"); break;
         							case 4: out.println("밋앤온 문의"); break;
         							case 5: out.println("기타문의"); break;
                                  	
                                  	}
                                  	%>
                                  	
                                  
                                  </td>
                                  <td><%=c.getContactTitle() %></td>
                                  <td>
                                  	<%
                                  	switch(c.getContactStatus().toUpperCase()){
                                  	case "Y" : out.println("답변완료"); break;
                                  	case "N" : out.println("처리중"); break;
                                  	}
                                  	%>
                                  
                                  
                                  </td>
                                  
                              </tr>
                          </tbody>
                      </table>   
                      <div class="con">
                          <strong>
                              <span class="ico_a">Q.</span>문의합니다.
                          </strong>
                          <div>
                            		<%=c.getContactContent().replace("\r\n","<br>")  %>
                          </div>
                      </div>
                      <hr> 
                      <div class="con">
                          
                          <%if(c.getComment() == null) {%>
                         	<!-- 	<p>답변 작성 중입니다. 기다려주세요</p>  -->
                          
                          <%}else{ %>
                          <strong>
                              <span class="ico_a">A.</span>BOOK E ON & ON 입니다. 
                          </strong>    
                          <div>
				                          
				              <%=c.getComment().replace("\r\n","<br>")  %>          
                              <span class="date"><%=c.getContactReDate() %></span>
                          </div>               
  						 <%} %>	
                      </div>
              
                              
                  </div>
                  <div class="btncenter">
                      <input type="button" value="이전" class="btn btn-primary" onclick=history.back(); >
                  </div>
                  
              </div>
        </div>
     
</body>
</html>