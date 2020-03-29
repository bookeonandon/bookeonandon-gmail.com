<%@page import="com.kh.myCoupon.model.vo.MyCoupon"%>
<%@page import="com.kh.book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Book b = (Book)request.getAttribute("b");
	MyCoupon mc = (MyCoupon)request.getAttribute("mc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/bPayment.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="wrap">

        <div class="proList">
            <h1>주문결제</h1>

            <div class="subList">
                <table class="subList-table" width="100%">
                    <thead class="subList-th">
                        <tr>
                        <th width="15%">결제번호</th>
                        <th width="10%"></th>
                        <th width="60%">상품명</th>
                        <th>금액</th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">
                        <tr>
                        <td><%= b.getBookNo() %></td>
                        <td><img src="<%= contextPath %>/resources/board_upfiles/<%= b.getMoThumbnail() %>"></td>
                        <td><%= b.getTitle() %></td>
                        <td><%= b.getPrice() %>원</td>
                    </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                        <td colspan="4"><span style="color:#5c186b">총 상품액</span><span><%= b.getPrice() %>원</span></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="middleList">
               <div class="couponList">
                <h2 class="hcTitle">보유 쿠폰</h2>
                <span class="couponLabel">쿠폰</span>
                <span class="admitCoupon">3000원</span><button type="button" class="btn-admit-coupon" onclick="openCoupon();">보유 쿠폰</button>
               </div>

               <div class="lastPay">
                   <table class="lastPay-table">
                       <tr>
                        <td class="title title1">결제금액</td>
                        <td class="price price1">1900원</td>
                       </tr>
                       <tr>
                        <td class="title">총 상품액</td>
                        <td class="price">4900원</td>
                       </tr>
                       <tr>
                        <td class="title">쿠폰</td>
                        <td class="price">-3000원</td>
                       </tr>
                   </table>
               </div>
            </div>
            <div class="btnDiv">
                <button type="submit" class="btnPay">결제하기</button>
            </div>
        </div>
    </div>
    
    <script>
    
    function openCoupon(){
    	uNo = <%=loginUser.getMemberNo()%>
    	bNo = <%= b.getBookNo() %>
    	window.open("'<%=request.getContextPath()%>/open.cp?uNo='+uNo+'&bNo'+bNo", "보유 쿠폰", "width=500, height=400");
    	
    }
    </script>
</body>
</html>