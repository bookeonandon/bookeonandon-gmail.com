<%@page import="com.kh.product.model.vo.Subscription"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    	Subscription s = (Subscription)request.getAttribute("s");
    
    	
    %>
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
    }
    div{
        border: 1px solid #fff;
        box-sizing:border-box;
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

    .btnDiv{
        width:100%;
        height:15%;
    }
    .btnPay{
        margin-top:20px;
        float:right;
        width:200px;
        height:50px;
        background:#5c186b;
        color:white;
        font-size:20px;
        font-weight: bold;
        border-radius:5px;
        border:1px solid #5c186b;
    }
    th{
        height:80px;
        border-top:1px solid black;
        font-size:18px;}
    tbody>tr>td{
        height:80px;
        font-size:16px;
        font-weight:bold;
    }
    tfoot>tr>td{
        height:80px;
        font-size:30px;
        font-weight:bold;
        background-color: #f9f7f7;
        border-bottom:1px solid black;
        text-align:right;
        }
    tfoot>tr>td>span{
        margin-right:30px;
    }
   .wrap{
   		margin-top:7%;
   	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	 <div class="wrap">

  
        <div class="proList">
            <h1>주문결제</h1>

	      <form>
            <div class="subList">
                <table class="subList-table" width="100%">
                    <thead>
                        <tr>
                        <th width="15%">결제번호</th>
                        <th width="60%">상품명</th>
                        <th>금액</th>
                        </tr>
                    </thead>
                    <tbody style="text-align: center;">
                        <tr>
                        <td><%=s.getSbNo() %></td>
                        <td><%=s.getSbName() %></td>
                        <td><%=s.getSbPrice() %>원</td>
                    </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                        <td colspan="3"><span style="color:#5c186b">총 상품액</span><span><%=s.getSbPrice() %>원</span></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        
            <div class="btnDiv">
                <button type="button" class="btnPay" onclick="goPay();">결제하기</button>
            </div>
        </form>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
    
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <script>
    		price = <%=s.getSbPrice() %>
    		
    		
    	function payment(){
    		uNo = <%=loginUser.getMemberNo()%>;
    		sNo = <%=s.getSbNo() %>
    	}
    	function goPay(){
	    	var IMP = window.IMP;
	    	IMP.init('imp14072240');
	    	
	    	IMP.request_pay({
	    	    pg : 'inicis', // version 1.1.0부터 지원.
	    	    pay_method : 'card',
	    	    merchant_uid : 'merchant_' + new Date().getTime(),
	    	    name : '<%=s.getSbName()%>',
	    	    amount : price,
	    	    //amount : s.getSbPrice()*1.1,
	    	    // 로그인 유저값 먹이기
	    	    buyer_email : '<%=loginUser.getEmail()%>',
	    	    buyer_name : '<%=loginUser.getMemberName()%>',
	    	    buyer_tel : '<%=loginUser.getPhone()%>',
	    	    buyer_addr : '서울특별시 강남구 삼성동',
	    	    buyer_postcode : '123-456',
	    	    m_redirect_url : '<%=request.getContextPath()%>'
	    	}, function(rsp) {
	    	    if ( rsp.success ) {
	    	        var msg = '결제가 완료되었습니다.';
	    	        msg += '고유ID : ' + rsp.imp_uid;
	    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	        msg += '결제 금액 : ' + rsp.paid_amount;
	    	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    	        
	    	        payment();
	    	        var type = "신용카드";

	    	        location.href="<%=request.getContextPath()%>/insert.sb?uNo=" + uNo + "&sNo=" + sNo + "&type=" + type;
	    	        
	    	    } else {
	    	        var msg = '결제에 실패하였습니다.';
	    	        msg += '에러내용 : ' + rsp.error_msg;
	    	    }
	    	    alert(msg);
	    	})
    	};
    </script>
</body>
</html>