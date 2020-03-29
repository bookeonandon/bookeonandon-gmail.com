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
	<title>memberSearchEmail</title>
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
                                <a class="text-center" onclick=""> <h4>BOOK E ON & ON</h4></a>
                                <form class="mt-5 mb-3 login-input">
                                    <div class="form-group">
                                        <div>
                
                                            <blockquote class="text-center">
                                                <span>dahuin4566@hanmail.net</span>
                                                <p>발송완료</p>
                                            </blockquote>
                                            
                                            
                                        </div>
                                    </div>
                                    <div>
                                        
                                        <button type="button" class="btn login-form__btn submit w-100" onclick="loginForm();">로그인</button>
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
		function loginForm(){
			location.href = "<%=request.getContextPath()%>/login.me";
		}
	</script>
    
	
</body>
</html>