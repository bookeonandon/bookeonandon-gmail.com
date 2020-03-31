<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>contactNoView</title>
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

      
            <div class="contactul">
                <ul class="nav testnav text-center">
                    <li class="nav-item contactnav"><a href="#question" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false" >문의하기</a>
                    </li>
                    <li class="nav-item contactnav"><a href="#questionlist" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의내역</a>
                    </li>
                    
                </ul>
                <div>
					<%if(loginUser != null){ %>
                        
                    <%}else { %>
                 		<div class="col-md-12">
                 			<h5 class="text-center">로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요.</h5>
                 			<div id="loginthreebtn">
                 			
                 			<button type="button" class="btn mb-1 btn-primary loginbtn" onclick="loginForm();">로그인</button>
                 			</div>
                 		</div>
                 	<%} %>
                </div>
      
        </div>
         </div>
         
         <%@ include file="../common/footer.jsp" %>
      <script>
 		
 		function loginForm(){
    		location.href = "<%=request.getContextPath()%>/loginPath.me";
    		
    	}
 		
 		
 		
 		
 		</script>
     
</body>
</html>