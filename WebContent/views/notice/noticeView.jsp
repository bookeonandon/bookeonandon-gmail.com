<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.*" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	NoticePageInfo npi = (NoticePageInfo)request.getAttribute("npi");
	
	int NoticeListCount = npi.getNoticeListCount();
	int noticeCurrentPage = npi.getNoticeCurrentPage();
	int noticeMaxPage = npi.getNoticeMaxPage();
	int noticeStartPage = npi.getNoticeStartPage();
	int noticeEndPage = npi.getNoticeEndPage();
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>noticeView</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="bodycolor">
<%@ include file="../common/menubar.jsp" %>
	<div id="main-wrapper">
      
        <div class="contact-body">
            <div class="noticelist">
                <div id="accordion-three" class="accordion">
                     <% for(int i=0; i<list.size(); i++){ %>
                      <div class="card">
                        <div class="card-header">
                        
                        
                            <h5 class="collapsed" data-toggle="collapse" data-target="#noticeList<%= (i+1) %>" aria-expanded="false" aria-controls="collapseOne4">
                            <i class="fa" aria-hidden="true"></i><%= list.get(i).getNoticeTitle() %></h5>
                            
                        </div>
                        <div id="noticeList<%= (i+1) %>" class="collapse" data-parent="#accordion-three">
                        	<h6 class="noticeDate"><%=list.get(i).getNoticeDate() %></h6>
                            <div class="card-body"><%=list.get(i).getNoticeContent().replace("\r\n","<br>") %></div>
                        </div>
                    </div>
                    <% } %>   
                    
                </div>
                 <div class="justify-content-center pagination">
                 	<!--  <button class="page-item" onclick="location.href='<%=contextPath%>/noticeList.no';">&lt;&lt;</button> -->
                 	
                 	<%if(noticeCurrentPage ==1){ %>
                 	<button class="page-item page-link" disabled>previous</button>
                 	<%}else{ %>
                 	<button class="page-item page-link" onclick="location.href='<%=contextPath%>/noticeList.no?noticeCurrentPage=<%=noticeCurrentPage-1%>';">previous</button>
					<%} %>	                
					
					<%for(int p=noticeStartPage; p<=noticeEndPage; p++){ %>
					
						<%if(noticeCurrentPage ==p){ %>
						<button class="page-item page-link" disabled><%=p %></button>
						<%}else{ %>
 						<button class="page-item page-link" onclick="location.href='<%=contextPath%>/noticeList.no?noticeCurrentPage=<%=p%>';"><%=p %></button> 
 						<%} %>
 					<%} %>	
 					
 					<%if(noticeCurrentPage == noticeMaxPage){ %>
 					<button class="page-item page-link" disabled>next</button>
 					<%}else{ %>
 					<button onclick="location.href='<%=contextPath %>/noticeList.no?noticeCurrentPage=<%=noticeCurrentPage+1 %>';"></button>
 					<%} %>
                 </div>
            </div>       
                
          
        </div>
    </div>
     <script>
    
    	 
		     $(document).ready(function(){
		        var i=0;
		        var color=["#8e6dae","black"];
		        var fontweight=["bold","normal"];
		        $("h5").click(function(){
		            $(this).css("color",color[i]);
		            $(this).css("font-weight",fontweight[i]);
		            i++;
		            if(i==2){i=0};
		    	});
			});
		     
		     
    </script>
</body>
</html>