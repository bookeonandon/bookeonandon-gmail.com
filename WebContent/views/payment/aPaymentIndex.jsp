<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.payment.model.vo.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Payment sbCount = (Payment)request.getAttribute("sPC");
	Payment manySP = (Payment)request.getAttribute("mP");
	ArrayList<Payment> recentSP = (ArrayList<Payment>)request.getAttribute("rP");
	
	Payment bCount = (Payment)request.getAttribute("bPC");
	Payment manyBP = (Payment)request.getAttribute("mBP");
	ArrayList<Payment> recentBP = (ArrayList<Payment>)request.getAttribute("rBP");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <!-- Chartist -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/plugins/chartist/css/chartist.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>

	<div class="content-body">

            <div class="container-fluid">

            <!-- 컨텐츠 헤더 -->
            <div class="content-form">
        
                <span class="content-header"> 통계보고서 </span>
                <hr>

                <!-- 가장 많이 ~ 영역 -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white">검색어</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">검색어 컬럼에서 불러오기</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white">구독권</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"><%=manySP.getSbName() %></h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white">소장하기</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"><%=manyBP.getSbName() %></h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white">장르</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">내서재에 많이 담긴 책 장르</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- 통계 -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">결제 카테고리 통계</h4>
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">결제 건수 통계</h4>
                                <div id="morris-area-chart0"></div>
                            </div>
                        </div>
                    </div>
                </div>



                

                <!-- 구독권 정산관리 -->
                <div class="content-header-inner">
                    <span onclick=""> 구독권 정산관리 </span>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr>
                                                	<th>번호</th>
                                                    <th>구매자 아이디</th>
                                                    <th>닉네임</th>
                                                    <th>구매상품</th>
                                                    <th>가격</th>
                                                    <th>구매일시</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%for (Payment sp : recentSP ){ %>
                                                <tr>
                                                    <td><%=sp.getrNum() %></td>
                                                    <td><%=sp.getUserId() %></td>
                                                    <td><%=sp.getUserNick() %></td>
                                                    <td>
                                                        <span><%=sp.getSbName() %></span>
                                                    </td>
                                                    <td>
                                                        <span><%=sp.getPayPrice() %></span>
                                                    </td>
                                                    <td><%=sp.getSubPayDate() %></td>
                                                </tr>
                                             <%} %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>



                <!-- 소장하기 정산관리 -->
                <div class="content-header-inner">
                    <span onclick=""> 소장하기 정산관리 </span>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr>
                                                	<th>번호</th>
                                                    <th>구매자 아이디</th>
                                                    <th>닉네임</th>
                                                    <th>구매상품</th>
                                                    <th>가격</th>
                                                    <th>구매일시</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <%for (Payment bp : recentBP ){ %>
                                                <tr>
                                                    <td><%=bp.getrNum() %></td>
                                                    <td><%=bp.getUserId() %></td>
                                                    <td><%=bp.getUserNick() %></td>
                                                    <td>
                                                        <span><%=bp.getSbName() %></span>
                                                    </td>
                                                    <td>
                                                        <span><%=bp.getPayPrice() %></span>
                                                    </td>
                                                    <td><%=bp.getSubPayDate() %></td>
                                                </tr>
                                             <%} %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>



            </div>

            </div>
            <!-- #/ container -->
        </div>
        
        
        <%@ include file="../common/adminFooter.jsp" %>

        
        <script>
        $(function () {
        	
            "use strict";
            
            
		
        // !------- 통계에 담을 변수 --------!!
        
        var sbCount =<%=sbCount.getSubPayCount()%>
        var bCount = <%=bCount.getSubPayCount()%>
        	
        
        // 결제 카테고리 통계
        Morris.Donut({
            element: 'morris-donut-chart',
            data: [{
                label: "구독권",
                value: sbCount,

            }, {
                label: "소장하기",
                value: bCount
            }],
            resize: true,
            colors: ['#4d7cff', '#7571F9', '#9097c4']
        });
        
        
        // 결제 건수 통계
        Morris.Area({
            element: 'morris-area-chart0',
            data: [{
                period: '2011',
	                	소장하기: 0,
	                	구독권: 0,

            }, {
                period: '2012',
                	소장하기: 130,
                	구독권: 100,

            }, {
                period: '2013',
                	소장하기: 80,
                	구독권: 60,

            }, {
                period: '2014',
                	소장하기: 70,
               	 구독권: 200,

            }, {
                period: '2015',
                	소장하기: 180,
               	 구독권: 150,

            }, {
                period: '2016',
                	소장하기: 105,
                	구독권: 90,

            },
            {
                period: '2017',
	               	 소장하기: 250,
	               	 구독권: 150,

            }],
            xkey: 'period',
            ykeys: ['소장하기', '구독권'],
            labels: ['소장하기', '구독권'],
            pointSize: 0,
            fillOpacity: 0.4,
            pointStrokeColors: ['#b4becb', '#4d7cff'],
            behaveLikeLine: true,
            gridLineColor: 'transparent',
            lineWidth: 0,
            smooth: false,
            hideHover: 'auto',
            lineColors: ['#b4becb', '#4d7cff'],
            resize: true

        });
        
        });

        </script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/raphael/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/morris/morris.min.js"></script>
        

</body>
</html>