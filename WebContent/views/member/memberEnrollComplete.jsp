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
	<title>memberEnrollComplete</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="header joinheader">

        <div class="joinlogo"><img src="" alt="">BOOK E ON & ON</div>
    </div>
    <div class="col p-md-0 joinlist">
        <ul class="pagination pagination-sm">
            <li class="page-item"><a class="joinpagelink joinpage">●</a>
            </li>
            <li class="page-item"><a class="joinpagelink joinpage">●</a>
            </li>
            <li class="page-item"><a class="joinpagelink fontcolor">●</a>
            </li>
        </ul>
    </div>
    <div class="content-body joinbody">

        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-validation">
                                <div class="text-center divheight">
                                    	회원가입이 완료됐습니다.    
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn mb-1 btn-primary loginbtn" onclick="loginForm();">로그인</button>
            </div>
        </div>
      
    </div>
    <script>
    	function loginForm(){
    		location.href = "<%=request.getContextPath()%>/loginPath.me";
    	}
    	
    </script>
</body>
</html>