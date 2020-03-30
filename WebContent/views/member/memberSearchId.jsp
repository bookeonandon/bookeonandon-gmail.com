<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.member.model.vo.Member"%>
<%
	Member mem = (Member)request.getAttribute("mem");
	String result = (String)request.getAttribute("result");
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>memberSearchId</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="margintop">
	<div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href=""> <h4>BOOK E ON & ON</h4></a>
                                <form class="mt-5 mb-3 login-input" method="post" action="idSearchEmail.me">
                                    <div class="form-group">
                                        <div>
                
                                            <blockquote class="text-center">개인정보 보호를 위해 뒤 4글자는 보이지 않습니다.<br>
                                                <span> <%=result %> </span>
                                            </blockquote>
                                            <input type="hidden" name="idSearch" value="<%= mem.getEmail()%>">
                                            <input type="hidden" name="idSearchId" value="<%= mem.getMemberId()%>">
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="card-subtitle text-center">전체 아이디 + 임시 비밀번호</h6>
                                        <button type="submit" class="btn login-form__btn submit w-100">Email 발송</button>
                                    </div>
                                    <div id="idsearch">
                                        <a onclick="loginForm();" style="cursor:pointer;" class="text-primary">로그인</a>
                                    </div>
                                        
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<script>
	
		
		
		function idSearchEmail(){
			location.href= "<%=request.getContextPath()%>/idSearchEmail.me";
		}
		
	
		function loginForm(){
			location.href = "<%=request.getContextPath()%>/loginPath.me";
		}
		
		
	</script>
	
    
</body>
</html>