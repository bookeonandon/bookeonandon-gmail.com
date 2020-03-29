<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.contact.model.vo.Contact, java.util.ArrayList" %> 
<%
	Contact c = (Contact)request.getAttribute("c");
	ArrayList<Contact> list = (ArrayList<Contact>)request.getAttribute("list");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>contactView</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<body class="bodycolor">
  
	<%@ include file="../common/menubar.jsp" %>
    
   
        <div class="contact-body">

          
            <!-- row -->

            <div class="contactul">
                <ul class="nav testnav text-center">
                    <li class="nav-item contactnav"><a href="#question" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의하기</a>
                    </li>
                    <li class="nav-item contactnav"><a href="#questionlist" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의내역</a>
                    </li>
                    
                </ul>
                
						<%if(loginUser != null){ %>
                        <div class="tab-content">
                            <div id="question" class="tab-pane">
                                
                                
                                <div class="col-md-12">
                                    <form action="<%=request.getContextPath()%>/contactInsert.cot" method="post">
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label for="sel1" >&nbsp; 질문유형</label>
                                            <select class="form-control" id="sel1" name="contactType">
                                                <option>----------------------------------------------------------------------------------</option>
                                                <option value="1">구독/서비스 이용문의</option>
                                                <option value="2">결제/취소/환불 문의</option>
                                                <option value="3">오류 문의</option>
                                                <option value="4">기타 문의</option>
                                                <option value="5">기타문의</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label>&nbsp; 제목</label>
                                            <input type="text" name="contactTitle" id="contactTitle" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label>&nbsp; 내용</label>
                                            <textarea name="contactContent" id="contactContent" class="textarea_editor form-control bg-light" style="resize:none;" "rows="15" placeholder="내용을 입력해주세요"></textarea>
                                        </div>
                                        
                                    </form>
                                </div>
                                
                                <div class="btncenter">
                                <button type="submit" id="inquiryBtn" class="btn-primary btn contactbtn">문의하기</button>
                                </div>
                            </div>
                            <div id="questionlist" class="tab-pane">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="table header-border table-hover text-center">
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" name="contactcheck" class="css-control-input"></th>
                                                    <th>날짜</th>
                                                    <th>질문유형</th>
                                                    <th>제목</th>
                                                    <th>처리상태</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableList">
                                            	<% if(list.isEmpty()){ %>
	                                            	<tr>
														<td colspan="5">조회된 리스트가 없습니다.</td>
													</tr>
												<% }else{ %>
                                                	
                                                <%} %>	
                                            </tbody>    
                                        </table>
                                    </div>
                                    <div class="btncenter">
                                        <input type="submit" value="삭제하기" class="btn btn-right" onclick="" >
                                        <input type="button" value="문의하기" class="btn btn-primary" onclick="" >
                                    </div>
                                </div>
                                
                            </div>
                        </div>       
                 		<%}else { %>
                 			<div>
                 			<textarea readonly rows="3" cols="60" style="resize:none;">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
                 			<button type="button" class="btn login-form__btn submit w-100" onclick="loginForm();">로그인</button>
                 			</div>
                 		<%} %>
                </div>
      
        </div>
      
 		<script>
 		function loginForm(){
    		location.href = "<%=request.getContextPath()%>/login.me";
    	}
 		
 		$(function(){
 			
 			window.setInterval(selectReplyList, 1000);
 			
 			$("#inquiryBtn").click(function(){
 				
 				var type =$("#sel1").val();
 				var title = $("#contactTitle").val();
 				var content = $("#contactContent").val();
 				
 				var conWt = <%=c.getContactWriter()%>;
 				
 				$.ajax({
 					url:"contactInsert.cot",
 					data : {
 						type:type,
 						title:title,
 						content:content,
 						conWt:conWt
 					},
 					type:"post",
 					success:function(result){
 						if(result==1){
 							contactListView();
 							$("#sel1").val("");
 							$("#contactType").val("");
 							$("#contactContent").val("");
 						}
 					},
 					error : function(){
 						
 					}
 				});
 			});
 			
 		});
	
 		function contactListView(){
 			var conWt = <%=c.getContactWriter()%>
 			
 			$.ajax({
 				url:"contactList.cot",
 				data:{conWt:conWt},
 				type:"get",
 				success:function(list){
 					var value = "";
 					
 					for(var i in list){
 						value += '<tr>' + 
 									'<td>' + '<input type="checkbox" name="contactcheck" class="css-control-input">' + '</td>' +
 								 	'<td>' + list[i].contactDate + '</td>' + 
 									'<td>' + list[i].contactType + '</td>' + 
 									'<td>' + list[i].contactTitle + '</td>' + 
 									'<td>' + list[i].contactStatus + '</td>' +
 								'</tr>'	
 								 	
 					},
 					$("#tableList").html(value); 
 				} 
 			});
 			
 		}
 		
 		
 		</script>
 		
 		
    
</body>
</html>