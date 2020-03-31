<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    footer{
        width:1200px;
        height:200px;
        border-top: 1px solid #5c186b;
        color:white;
        position: absolute;
    }
    .footer_wrap{
        position: relative;
        max-width: 1200px;
        margin: 0 auto;
        padding: 74px 0 70px;
        text-align:center;
        box-sizing:border-box;
    }

    .footer_menu{
    position: absolute;
    left: 105px;
    top: 74px;
    font-size: 0;
    }
    .footer_menu>li{
        display: inline-block;
        position: relative;
        margin: 4px 14px;
        font-size: 14px;
    }
    .footer_logo{
    position: absolute;
    left: 10px;
    top: 76px;
    width: 170px;
    height: 15px;
    margin: 0 auto;
    }
    .footer_menu_item{
        text-decoration: none;
        color: white;
    }
    .footer_meetandon{
        margin-left:50px;
    }
    .footer_copy{
    margin: 0 auto;
    width: 600px;
    height: 20px;
    }
    
</style>
</head>
<body>
    <footer>
        <div class="footer_wrap">
            <p class="footer_copy" style="color:#5c186b;">Copyright ⓒ <strong>BOOK E ON AND ON Corp.</strong> All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>