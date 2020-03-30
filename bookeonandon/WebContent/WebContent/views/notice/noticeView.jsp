<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
                            <div class="card-body"><%=list.get(i).getNoticeContent() %></div>
                        </div>
                    </div>
                    <% } %>   
                    
                </div>
                <div class="bootstrap-pagination">
                    <nav>
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></a>
                            </li>
                        </ul>
                    </nav>
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