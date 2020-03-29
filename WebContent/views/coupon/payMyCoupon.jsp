<%@page import="com.kh.myCoupon.model.vo.MyCoupon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MyCoupon> list = (ArrayList<MyCoupon>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .wrap{
            width:600px;
            min-height:400px;
            margin:auto;
        }
        .proList{
            width:100%;
            height:100%;
        }
        .subList, .sumPayment{
        margin-top:20px;
        }
        .subList{
            width:100%;
            float:left;
            margin-top:30px;
            margin-bottom:20px;
        }
        .btnPay{
        margin-top:20px;
        float:right;
        width:150px;
        height:40px;
        background:#5c186b;
        color:white;
        font-size:17px;
        font-weight: bold;
        border-radius:5px;
        border:1px solid #5c186b;
        }
        .subList-th>tr>th{
            height:40px;
            border-top:1px solid black;
            font-size:14px;}
        .subList-table>tbody>tr>td{
            height:50px;
            font-size:14px;
            font-weight:bold;
        }
    </style>
</head>
<body>
	 <div class="wrap">
        <div class="proList">
            <h1>보유쿠폰</h1>
            <div class="subList">
                <table class="subList-table" width="100%">
                    <thead class="subList-th">
                        <tr>
                        <th></th>
                        <th width="60%">쿠폰명</th>
                        <th width="20%">기간</th>
                        <th>할인율</th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">
                    <%for (MyCoupon mc : list){ %>
                        <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td><%mc.getcName(); %></td>
                        <td><%=mc.getcLast() %>까지</td>
                        <td><%=mc.get %>20%</td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btnDiv">
            <button type="submit" class="btnPay">확인하기</button>
        </div>
    </div>
</body>
</html>