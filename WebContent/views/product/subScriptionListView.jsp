<%@page import="com.kh.product.model.vo.Subscription"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Subscription> list = (ArrayList<Subscription>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
    .wrap{
        width:1100px;
        margin-right:auto;
        margin-left:auto;
    }
    .sub-body{
        width:100%;
        margin-left:auto;
        margin-right:auto;
    }
    .subInner{
        width:260px;
        height:400px;
        border:1px solid;
        margin-left:30px;
        margin-right:30px;
        margin-top:50px;
        margin-bottom:100px;
        padding:20px;
        display:inline-block;
        background-color:#f9f7f7;
    } 

    .content-body{
        padding-top:50px;
    }
    .title{
        color:#5c186b;
        font-size:36px;
        margin-bottom:30px;
    }
    .content{
        font-size:20px;
    }
    .sub-footer{
        width:100%;
        padding:20px;
        background-color: #f9f7f7;
    }
    .subTop{
        height:270px;
    }
    .wrap{
   		margin-top:7%;
   	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	 <div class="wrap">

        <h1>구독권 구매</h1>

        <div class="sub-body">
        		<% for(Subscription s : list){ %>
	        		<% if(s.getSbStatus().equalsIgnoreCase("y")){ %>
	                <div class="subInner">
	                    <div class="subTop">
		                    <span class="subNo" style="display:none;"><%=s.getSbNo() %></span>
		                    <h1 class="title"><%=s.getSbName() %></h1>
		                    <span class="content"><%=s.getSbContent() %></span>
	                   	</div>
	                    <h1 class="price"><%=s.getSbPrice() %>원</h1>
	                </div>
	                <% } %>
                <% } %>

        </div>

        <div class="sub-footer">
            <h3>구독안내</h3>
            <p style="color:red;">제휴 이용권 상세 혜택 및 할인기간, 유의사항을 각 이용권 별 상세 페이지에서 꼭 확인해 주세요.</p>
            <p>부가세 포함여부가 표기되지 않은 이용권 금액은 부가세 10% 별도입니다.</p>
            <p>자동결제 해지예약은 PC로 내 정보>이용권 관리에서, 모바일로는 구독권 구매>MY 탭에서 가능합니다.</p>
            <p>이용권은 1:1문의 시 해지할 수 있습니다.</p>
            <p>각 할인 혜택은 사전 예고 없이 종료될 수 있습니다.</p>
        </div>

    </div>
    
 

    <script>
        $(function(){
            $(".subInner").hover(function(){
                $(this).css('background', '#5c186b');
                $(this).children().children().css('color','#fff');
                $(this).children().css('color','#fff');
            },function(){   
                $(this).css('background', '#f9f7f7');
                $('.subInner *').not('.title').css('color','#000');
                $('.title').css('color', '#5c186b');
            })
        })
        
        $(function(){
        	$(".subInner").click(function(){
        			var sNo = $(this).children().children().eq(0).text();
        			console.log(sNo);
        			// var uNo = loginUser.getUserNo();
        			location.href ="<%=request.getContextPath()%>/sPayForm.sp?sNo=" + sNo;
        	})
        })
    </script>

</body>
</html>