<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width:1100px;
        min-height:500px;
        margin:auto;
    }
    .proList{
        width:100%;
        height:100%;
        margin-top:50px;
        margin-bottom:150px;

    }
    .subList{
        width:60%;
        height:300px;
        margin-left:auto;
        margin-right:auto;
        margin-top:150px;
        padding-top:50px;
        background-color: #f9f7f7;
    }
    .subComCetner{
        text-align:center;
    }
    .subCom{
        width:500px;
        margin-left:auto;
        margin-right:auto;
    }
    .btn-sbCom, .btn-home{
        margin-top:20px;
        width:200px;
        height:50px;
        background:#5c186b;
        color:white;
        font-size:20px;
        font-weight: bold;
        border-radius:5px;
        border:1px solid #5c186b;
    }
    .btn-sbCom{
        background:#c5c5c5;
        border:1px solid #d3d3d3;
    }
    .btn-sbCom{
        margin-right:10px;
    }
    .subComMent{
        font-size:20px;
        font-weight: bold;
    }
    .wrap{
        margin-top:8%;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<div class="wrap">

  
        <div class="proList">
            <h1>결제완료</h1>

            <div class="subList">

                <div class="subComCetner">
                    <h1>결제완료</h1>
                    <p class="subComMent">주문하신 결제가 완료되었습니다.</p>
                    <div class="subCom">
                        <button class="btn-sbCom">주문내역</button>
                        <button class="btn-home" onclick="goHome();">홈으로</button>
                    </div>
                </div>
            </div>
        
        </div>
    </div>
    
    <script>
    function goHome(){
    	location.href="<%=contextPath%>";
    }
    
    </script>
    

</body>
</html>