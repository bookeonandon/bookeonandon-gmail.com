<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>   
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");


%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>memberLoginForm</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body style="margin-top:1rem;">

    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-3">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center"> <h4>BOOK E ON & ON</h4></a>
                                
        						<%if(loginUser == null) {%>
                                <form class="mt-5 mb-5 login-input" action="<%= request.getContextPath()%>/login.me" method="post" onsubmit="return loginValidate();">
                                    <div class="form-group">
                                        <input type="text" id="memberId" name="memberId" class="form-control" placeholder="Id">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" id="memberPwd" name="memberPwd" class="form-control" placeholder="Password">
                                        
                                      
                                    </div>   
                                    
                                    <div id="idsearch" class="mt-5 login-form__footer">
                                          <a onclick="idSearchForm();" class="text-primary lobinlink"> &nbsp;아이디 찾기</a>               
	                               		  
            
                                    </div>
                                    
                                    
                                  
	                                    
	                                 
	                                 
                                    
                                    <div id="loginthreebtn">
                                        <button type="button" class="btn mb-1 btn-light loginbtn" onclick="memberJoin();">회원가입</button>
                                        <button type="submit" class="btn mb-1 btn-primary loginbtn">로그인</button>
                                        <button type="button" class="btn mb-1 btn-light loginbtn" onclick="location.href='<%=request.getContextPath() %>'">홈</button>
                                    </div>
                                </form>
                               
                                
                                <%}  %>
                                	
                                
                      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <script>
      	function loginValidate(){
      		if($("#memberId").val().trim().length == 0){
      			alert("아이디를 입력하세요");
      			$("#memberId").focus();
      			return false;
      		}
      		
      		if($("#memberPwd").val().trim().length ==0){
      			alert("비밀번호를 입력하세요");
      			$("#memberPwd").focus();
      			return false;
      		}
      		
      		return true;
      	}
      
      
      	function idSearchForm(){
      		location.href= "<%=request.getContextPath()%>/idSearchForm.me";
      	}
      	
      	
    	function memberJoin(){
    		location.href = "<%=request.getContextPath()%>/memberJoin.me";
    	}
    	
    	
    	
    	
    </script>

    
</body>
</html>