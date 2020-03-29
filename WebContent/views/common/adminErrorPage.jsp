<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String message = (String)request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="content-body">

		<div class="login-form-bg h-100">
	        <div class="container h-100">
	            <div class="row justify-content-center h-100">
	                <div class="col-xl-6">
	                    <div class="error-content">
	                        <div class="card mb-0">
	                            <div class="card-body text-center">
	                                <h1 class="error-text text-primary">error</h1>
	                                <p><%= message %></p>
	                                <form class="mt-5 mb-5">
	                                    
	                                    <div class="text-center mb-4 mt-4"><a href="javascript:history.back();" class="btn btn-primary">뒤로가기</a>
	                                    </div>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
    </div>
    
    
    <%@ include file="../common/adminFooter.jsp" %>
    
    
</body>
</html>