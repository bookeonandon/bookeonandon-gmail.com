<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>memberJoinForm</title>
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>Insert title here</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
</head>
<body id="margintop">
    
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-5">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href=""><h4>BOOK E ON & ON</h4></a>
        
                                <form class="mt-5 mb-5">
                                    <div class="joinpagebtn">
                                        <button type="button" onclick="enrollTerms();" class="btn mb-1 btn-rounded btn-primary">일반 회원가입</button>
                                        <button type="button" class="btn mb-1 btn-rounded btnnaver">네이버로 회원가입</button>
                                        <button type="button" class="btn mb-1 btn-rounded btnkakao">카카오로 회원가입</button>
                                        <button type="button" onclick="loginForm();" class="btn mb-1 btn-rounded btn-light">로그인</button>
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
   		 function enrollTerms(){
			location.href="<%=request.getContextPath()%>/enrollTerms.me";
		}
	    function loginForm(){
			location.href = "<%=request.getContextPath()%>/loginForm.me";
		}
    </script>

    

   
</body>
</html>