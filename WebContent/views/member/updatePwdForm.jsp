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
	<title>updatePwdForm</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<body style="margin-top:1rem;">
    
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                
                                    <a class="text-center" href=""> <h4>BOOK E ON & ON</h4></a>
                                    <p id="idsearch" class="text-center">비밀번호 재설정</p>
                                <form class="mt-5 mb-5 login-input" id="newPwdSet" action="updatePwd.me" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="memberId"  placeholder="아이디" required>
                                    </div>
                                     <div class="form-group">
                                        <input type="password" class="form-control" name="ranNum" placeholder="임시 비밀번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="newPwd" placeholder="비밀번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="newPwd" placeholder="비밀번호 확인" required>
                                    </div>
                                    <div id="loginthreebtn">
                                        <button type="button" id="backbutton" class="btn login-form__btn submit" onclick="history.back();">뒤로</button>
                                        <button type="submit" class="btn login-form__btn submit" onclick="updatePwd();">설정</button>
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
    	
    	
    		function updatePwd(){
    			if(ranNum == "<%=  %>"){
    				$("#newPwdSet").submit();
    			}else{
    				alert("임시 비밀번호가 잘못 됐습니다. 다시 입력해주세요");
    			}
    			
    		}
    	</script>

    
</body>
</html>