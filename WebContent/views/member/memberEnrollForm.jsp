<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>memberEnrollGeneralForm</title>

    <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
    <script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/plugins/jquery-validation/jquery.validate.min.js"></script> 
	


</head>
<body>
	<div class="header joinheader">

        <div class="joinlogo"><img src="" alt="">BOOK E ON & ON</div>
        <div class="joindiv">일반 회원가입</div>

    </div>
     <div class="col p-md-0 joinlist">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="joinpagelink joinpage">●</a>
                    </li>
                    <li class="page-item"><a class="joinpagelink fontcolor">●</a>
                    </li>
                    <li class="page-item"><a class="joinpagelink joinpage">●</a>
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
                                    <form class="form-valide" action="<%=request.getContextPath() %>/insert.me" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="memberId">Id <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="memberId" name="memberId" placeholder="5~20자의 영문 소문자, 숫자">
                                            </div>
                                             <button type="button" class="btn btn-primary joinmail" onClick="checkId();">중복확인</button>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="memberPwd">Password <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="8자이상 영문 소문자, 숫자, 특수문자를 사용">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-confirm-password">Confirm Password <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="비밀번호 확인!">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="memberName">Username <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickname">Nickname <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nickname" name="nickname" placeholder=" 3~8자 사용">
                                            </div>
                                        </div>
                                       <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birth">Birth <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일을 입력해주세요 ex) YYYYMMDD">
                                            </div>
                                        </div>
										<div class="form-group row">
                                            <label class="col-lg-4 col-form-label">Gender  <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <label for="val-gender">
                                                    <input type="radio" id="val-terms1" name="val-gender" value="F"> <span class="css-control-indicator"></span>여</label> &nbsp;&nbsp; &nbsp; &nbsp;
                                            	<label for="val-terms">
                                            		 <input type="radio" id="val-terms2" name="val-gender" value="M"> <span class="css-control-indicator"></span> 남</label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-phone">Phone <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="val-phone" name="val-phone" placeholder="'-' 빼고 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-email">Email <span class="text-danger">*</span>
                                            </label>
                                    
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="val-email" name="val-email" placeholder="이메일을 입력해주세요">
                                            </div>
                                             <button type="button" class="btn btn-primary joinmail" onclick="sendMail();">메일발송</button>
                                        </div>
                                              <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="val-digits">Verification Number <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="val-digits" name="val-digits" placeholder="인증번호">
                                            </div>
                                           <button type="button" class="btn btn-primary joinmail" onclick="testsss();">인증확인</button>
                                        </div>
                                        
                                   
                                        <div class="form-group row">
                                            <div class="joinbtn">
                                                <button type="button" onclick="history.back();" class="btn btn-light widthbtn">이전</button>
                                                <button type="submit" id="joinBtn" class="btn btn-primary" disabled>회원가입</button>
                                            </div>
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
       var codeSuccess;
       var testCode;
       function testsss(){
    	   
    	   code1 = testCode;
    	   code2 = $("#val-digits").val();
    	  	console.log(testCode);
    	  	console.log(code2);
    	   if(code1 == code2){
    		   alert("일치합니다.");
    		   codeSuccess = true;
    	   }else{
    		   alert("일치합니다.");
    		   codeSuccess = true;
    	   }
       }
       
       $(function(){
    	   setInterval(function(){
    		   if(codeSuccess && idSuccess){
    			   $("#joinBtn").removeAttr("disabled");
    		   }
    	   }, 1000);
       })
       function sendMail(){
    	   $.ajax({
    		   url:"sendMail.me",
    		   data:{mail:$("#val-email").val()},
    		   success:function(code){
    			   alert("메일 발송 메일확인해주세요")
    			   testCode = code;
    		   },error:function(){
    			   console.log("통신실패");
    		   }
    	   })
       }
       $(document).ready(function(){
    	 $.validator.methods.pwd = function( value, element ) {
    		   return this.optional( element ) || /[a-z0-9][!@#$%^&*]/.test(value);
    		 };
    	   
    	   $.validator.methods.userId = function( value, element ) {
    		   return this.optional( element ) || /[a-z][0-9]/.test(value);
    		 };
    		 
    		 $.validator.methods.userBirth = function( value, element ) {
      		   return this.optional( element ) || /[0-9]/.test(value);
      		 }; 
    	   
      		 
      		 
     	  $(".form-valide").validate({
     		 rules: {
     	        "memberId": {
     	            required: !0,
     	            rangelength: [5, 20],
     	           userId: true
     	        },
     	        "memberName": {
     	            required: !0,
     	            minlength: 2
     	        },
     	        "val-email": {
     	            required: !0,
     	            email: true
     	        },
     	        "memberPwd": {
     	            required: !0,
     	            minlength: 8,
     	            pwd : true
     	        },
     	        "val-confirm-password": {
     	            required: !0,
     	            equalTo: "#memberPwd"
     	        },
     	        
     	        "val-phone": {
     	            required: !0,
     	            minlength : 11,
     	            userBirth: true
     	            
     	            
     	        },
     	        
     	        "val-digits": {
     	            required: !0,
     	            digits: !0
     	        },
     	        "nickname": {
     	            required: !0,
     	            rangelength: [3, 8]
     	        },
     	       
     	        "birth": {
     	            required: !0,
     	            minlength : 8, 
     	            userBirth : true
     	        },
     	       "val-gender": {
    	            required: !0
    	          
    	        }
     	    },
     	    messages: {
     			  "memberId": {
     		          required: "아이디를 입력해주세요",
     		          rangelength: "아이디는 최소 5자 이상입니다.",
     		          userId : "유효하지 않는 값입니다. 아이디 다시 입력해주세요"
     		      },
     	        "memberName": {
     	            required: "이름을 입력해주세요",
     	            minlength: "이름은 최소 2자 이상입니다."
     	        },
     	        "val-email": "유효한 이메일 주소를 입력해주세요",
     	        "memberPwd": {
     	            required: "패스워드를 입력해주세요",
     	            minlength: "패스워드는 최소 8자 이상입니다.",
     	            pwd:"유효하지 않는 값입니다. 패스워드 다시 입력해주세요"
     	        },
     	        "val-confirm-password": {
     	            required: "패스워드를 입력해주세요",
     	            rangelength: "패스워드는 최소 8자 이상입니다.",
     	            equalTo: "패스워드가 같지 않습니다. 다시 입력해주세요"
     	        },
     	        "nickname": {
     	            required: "닉네임을 입력해주세요",
     	            rangelength: "닉네임은 최소 3자 이상 최대 8자 이하입니다."
     	        },
     	        "birth": {
     	            required: "생년월일을 입력해주세요",
     	            minlength: "생년월일 8자를 입력해주세요",
     	            userBirth : "숫자만 입력해주세요"
     	        },
     	        "val-phone":{
     	         required : "핸드폰 번호를 입력해주세요",
     	         minlength: "핸드폰 번호를 정확히 입력해주세요 ex)01011112222"
     	       }, 	
     	        "val-digits": "인증번호를 입력해주세요",
     	       "val-gender": {
   	            required: "한가지는 선택해주세요"
   	          
   	        	}
     	        
     	    },

     	    ignore: [],
     	    errorClass: "invalid-feedback animated fadeInUp",
     	    errorElement: "div",
     	    errorPlacement: function(e, a) {
     	        jQuery(a).parents(".form-group > div").append(e)
     	    },
     	    highlight: function(e) {
     	        jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")
     	    },
     	    success: function(e) {
     	        jQuery(e).closest(".form-group").removeClass("is-invalid"), jQuery(e).remove()
     	    }
     	});
       })
       
       var idSuccess;
       
       function checkId(){
    	   
    	   var memberId = $(".form-valide input[name=memberId]");   
           
           $.ajax({
              url:"<%=request.getContextPath() %>/idCheck.me",
              data:{memberId:memberId.val()},
              type:"post",
              success:function(result){
                 
                 
                 if(result == 1){   // 사용불가능한 아이디
                    alert("사용불가능한 아이디입니다.");
                    memberId.focus();
                 }else{   // 사용가능한 아이디
                    
                    if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                       memberId.attr("readonly", "true");   // 더이상 아이디 수정 불가능하게끔
                       //$("#joinBtn").removeAttr("disabled"); // 가입하기 버튼 활성화
                       idSuccess = true;
                    }else{
                       memberId.focus();
                    }
                 }
              }
           });
        }

    	   
       
       </script>
       

    
</body>
</html>