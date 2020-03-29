<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.contact.model.vo.Contact, com.kh.member.model.vo.Member, java.util.ArrayList" %> 
<%
	
	Member loginUser1 = (Member)session.getAttribute("loginUser");

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
    <script>
    	$(function(){
    		
    		
    		//$("#tableList>tr").click(function(){
    		$("#tableList").on("click", "tr",function(){
    		 	console.log($(this).children().eq(0).val());
    			
    			location.href="contactDetail.cot?cNo=" + $(this).children().eq(0).val();
    		
    		});	
    		
    		
    	
			contactListView();
			//window.setInterval(contactListView, 2000);
			
			$("#inquiryBtn").click(function(){
			//$(document).on("click", "#inquiryBtn", function(){
				
			
				var type =$("#sel1").val();
				var title = $("#contactTitle").val();
				var content = $("#contactContent").val();
				
				var conWt = <%=loginUser1.getMemberNo()%>;
				
				$.ajax({
					url:"contactInsert.cot",
					data : {
						contactType:type,
						contactTitle:title,
						contactContent:content,
						memberNo:conWt
					},
					type:"post",
					success:function(result){
						if(result==1){
							
							contactListView();
							$("#sel1").val("");
							$("#contactTitle").val("");
							$("#contactContent").val("");
						}
						
					},
					error : function(){
						
					}
				}); 
			});
		});
			
    	function contactListView(){
 			var conWt = <%=loginUser1.getMemberNo()%>;
 			var str = '문의된 내역이 없습니다.';
 			
 			$.ajax({
 				url:"contactList.cot",
 				data:{memberNo:conWt},
 				type:"get",
 				success:function(list){
 					
 					var value = "";
 					
 					var contactArr = new Array();
					
 					var statusArr = new Array();
 					
 					if(!list.length){
 						
 						value='<td colspan="5">' + str + '</td>';
 					
 					}else{
 						
 						for(var j in list){
 							switch(list[j].ContactType) {
 							case 1: contactArr[j] = '구독/서비스 이용 문의'; break;
 							case 2:	contactArr[j] = '결제/취소/환불 문의'; break;
 							case 3: contactArr[j] = '오류 문의'; break;
 							case 4: contactArr[j] = '밋앤온 문의'; break;
 							case 5: contactArr[j] = '기타문의'; break;
 							}
 						}
 					
 					
 						for(var s in list){
 					
 							switch(list[s].ContactStatus.toUpperCase()){
 							case 'N' : statusArr[s] = '처리중'; break;
 							case 'Y' : statusArr[s] = '답변완료'; break;
 							}
 						}
 					
	 					for(var i in list){
	 						
	 					
		 						value += '<tr>' + 
		 						 '<input type="hidden" name="conCheck" value="' + list[i].ContactNo + '">' +
		 									'<td onclick="event.cancelBubble=true">' + '<input type="checkbox" value="' + list[i].ContactNo + '" name="contactcheck" class="css-control-input">' + '</td>' +
		 								 	'<td>' + list[i].ContactDate + '</td>' + 
		 									'<td>' + contactArr[i] + '</td>' + 
		 									'<td>' + list[i].ContactTitle + '</td>' + 
		 									'<td>' + statusArr[i] + '</td>' +
		 								'</tr>'	
	 								
		 					 
	 					}
 					}	
 					
 					$("#tableList").html(value); 
 				} 
 			});
 			
 		}	
    	
    
    	function deleteContact(){
    		if(confirm("삭제하시겠습니까?")){
    			//location.href = "<%=request.getContextPath()%>/delete.cot";
    			
    			$.each($("#tableList :checkbox:checked"),function(){
    				$("#deleteForm").append("<input type='hidden' name='deleteNo' value='"+ $(this).val()   +"'>");
    			});
    			
    			
    			$("#deleteForm").submit();
    		}
    			
    	}
    	
    	
    	$(function(){
    		$("#contactcheck").on("click", function(){
    	   // $("#contactcheck").click(function(){
    	   // $(document).on("click", "#contactcheck", function(){
    	        if($("#contactcheck").prop("checked")){
    	         
    	            $("input[name=conCheck]").prop("checked",true);
    	      
    	        }else{
    	            
    	            $("input[name=conCheck]").prop("checked",false);
    	        }
    	    })
    	});


    	
    	
    	
    </script>
</head>
<body>
<body class="bodycolor">
  
	<%@ include file="../common/menubar.jsp" %>
    
   
        <div class="contact-body">

          
            <!-- row -->

            <div class="contactul">
                <ul class="nav testnav text-center">
                    <li class="nav-item contactnav"><a href="#question" class="nav-link fontcolor active" data-toggle="tab" aria-expanded="false">문의하기</a>
                    </li>
                    <li class="nav-item contactnav"><a href="#questionlist" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의내역</a>
                    </li>
                    
                </ul>
                
					
                        <div class="tab-content">
                            <div id="question" class="tab-pane active">
                                
                                <div class="col-md-12">
                                    <form method="post">
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
                                            <textarea name="contactContent" id="contactContent" class="textarea_editor form-control bg-light" style="resize:none;" rows="15" placeholder="내용을 입력해주세요"></textarea>
                                        </div>
                                        
		                                <div class="btncenter">
		                                
		                               		 <button type="button" class="btn-primary btn contactbtn" data-toggle="modal" data-target=".inquiryModal">문의하기</button>
		                               		 <div class="modal inquiryModal" tabindex="-1" role="dialog" aria-hidden="true">
	                                         <div class="modal-dialog modal-sm">
	                                            <div class="modal-content">
	                                                <div class="modal-header">
	                                                    <h5 class="modal-title">1:1 문의</h5>
	                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
	                                                    </button>
	                                                </div>
	                                                <div class="modal-body">문의 하시겠습니까?</div>
	                                                <div class="modal-footer">
	                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	                                                    <button type="button"  id="inquiryBtn"  class="btn btn-primary" data-dismiss="modal">등록하기</button>
	                                                </div>
	                                            </div>
	                                        </div>
                                    </div>
		                                </div>
                                	</form>
                                </div>
                                
                            </div>
                            <div id="questionlist" class="tab-pane">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="table header-border table-hover text-center">
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" name="contactcheck" id="contactcheck" class="css-control-input"></th>
                                                    <th>날짜</th>
                                                    <th>질문유형</th>
                                                    <th>제목</th>
                                                    <th>처리상태</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableList">
                                          
	                                            	<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
												 
                                            </tbody>    
                                        </table>
                                    </div>
                                    <div class="btncenter">
		                                
		                               		 <button type="button" class="btn-primary btn contactbtn" onclick="deleteContact();">삭제하기</button>
		                               		
		                            </div>
                                </div>
                                
                            </div>
                        </div>       
                 	
                </div>
      
        </div>
        
        <form id="deleteForm" action ="delete.cot" method="post">
        
        
        </form>


 		
    
</body>
</html>