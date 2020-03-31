<%@page import="com.kh.member.model.vo.Administrator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Administrator loginUser = (Administrator)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


	<div id="main-wrapper">
	
	<!--**********************************
            	왼쪽 상단 로고
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="<%=request.getContextPath()%>/payRe.apm">
                    <b class="logo-abbr"><img src="<%=request.getContextPath()%>/resources/admin/images/logo.png" alt=""> </b>
                    <span class="brand-title">
                        <img src="<%=request.getContextPath()%>/resources/admin/images/adminLogo.png" alt="">
                    </span>
                </a>
            </div>
        </div>

        <!--**********************************
            		헤더
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons">
                        <!--  홈으로  -->
                            <a href="<%=request.getContextPath()%>">
                                <img src="<%=request.getContextPath()%>/resources/admin/icons/aHome.PNG">
                            </a>
                        </li>
                        <!--  로그아웃  -->
                        <li class="icons">
                            <a href="javascript:void(0)">
                                <img src="<%=request.getContextPath()%>/resources/admin/icons/aOff.PNG">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
        <!--**********************************
            		사이드바
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="#" onclick="goMember();" aria-expanded="false">
                            <span class="nav-text">회원관리</span>
                        </a>
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <span class="nav-text">상품관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="#" onclick="goSubmit();">상품등록</a></li>
                            <li><a href="#" onclick="goReview();">리뷰관리</a></li>
                            <li><a href="#" onclick="goProduct();">상품현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <span class="nav-text">이벤트관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="#" onclick="goCoupon();">쿠폰관리</a></li>
                            <li><a href="#" onclick="goEvent();">이벤트관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <span class="nav-text">정산관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="#" onclick="goPay();">정산내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <span class="nav-text">문의관리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="#" onclick="goFaq();">FAQ관리</a></li>
                            <li><a href="#" onclick="goContact();">1:1 문의</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" onclick="goNotice();" aria-expanded="false">
                            <span class="nav-text">공지사항</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        

	
	</div>
	
		
	
	
		<script>
		
			// 1. 회원관리 가기
			function goMember(){
				location.href="<%=request.getContextPath()%>/list.ame";
			}
		
			// 2. 상품등록 하기
			function goSubmit(){
				location.href="<%=request.getContextPath()%>/insertForm.abo";
			}
			
			// 3. 리뷰관리 가기
			function goReview(){
				location.href="<%=request.getContextPath()%>/list.are";
			}
			
			// 4. 상품현황 가기 (구독권, 책)
			function goProduct(){
				location.href="<%=request.getContextPath()%>/list.apr";
			}
			
			// 5. 쿠폰관리 가기
			function goCoupon(){
				location.href="<%=request.getContextPath()%>/list.aco";
			}
			
			// 6. 이벤트관리 가기
			function goEvent(){
				location.href="<%=request.getContextPath()%>/list.aev";
			}
			
			// 7. 정산관리 가기
			function goPay(){
				location.href="<%=request.getContextPath()%>/list.apm";
			}
			
			// 8. 통계보고서 가기
			function goReport(){
				location.href="<%=request.getContextPath()%>/payRe.apm";
			}
			
			// 9. faq관리 가기
			function goFaq(){
				location.href="<%=request.getContextPath()%>/list.afa";
			}
			
			// 10. 1:1문의 가기
			function goContact(){
				location.href="<%=request.getContextPath()%>/list.act";
			}
			
			// 11. 공지사항 가기
			function goNotice(){
				location.href="<%=request.getContextPath()%>/list.ano";
			}
		
		</script>
			

	
	
	
	
	
	<!--**********************************
        Scripts
    ***********************************-->
    <script src="<%=request.getContextPath() %>/resources/admin/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/js/styleSwitcher.js"></script>
	
	
</body>
</html>