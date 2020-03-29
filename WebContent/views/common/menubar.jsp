<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
	String contextPath = request.getContextPath();
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/1.css">
    <script src="<%=request.getContextPath() %>/resources/js/1.js" rel="javascript" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <!-- 헤더 -->

    <div id="header">
        <div id="header-1">
            <div id="logoForm">
                    <a href="" style="text-decoration: none; color:black; font-weight: 300;"><img src="<%=request.getContextPath() %>/resources/images/logo1.png" width="30px" height="30px" style="float: left; margin-top:10px">
                    <p style="float: left; vertical-align: middle; margin-left:15px; font-size: 25px; margin-top:7px;">BOOK E ON&ON</p>
                    </a>
                </div>
            <div id="searchForm">
                <form>
                <div id="search"><input type="text" id="search-1" placeholder="도서,작가 검색"></div>
                <div id="searchBtnForm">
                    <button type="submit" id="searchBtn" onmouseover="search1();" onmouseout="search2();"><img src="<%=request.getContextPath() %>/resources/images/search.png" id="search-image" width="80%" height="auto"></button></div>
                </form>
            </div>
            <%if(loginUser == null){ %>
            <div class="joinForm">
                <div class="joinForm-1"><button type="button" onClick="loginForm();" class="joinBtn">로그인</button></div>
                <div class="joinForm-2"><button type ="button" onClick="joinForm();" class="joinBtn">회원가입</button></div>
            </div>
            
            <%}else {%>
            <div class="joinForm">
                <div class="joinForm-1"><button type="button" onClick="logout();" class="joinBtn" >로그아웃</button></div>
            </div>
            <%} %>
        </div>

        <!-- 네비게이터 -->

        <div id="navigator">
            <ul id="navi">
                <li><a href="">홈</a>
                    <ul id="navi-1" class="home">
                        <li><a href="" class="menu">베스트셀러</a></li>
                        <li><a href="" class="menu">인기도서</a></li>
                        <li><a href="" class="menu">신간도서</a></li>
                        <li><a href="" class="menu">ON&ON 추천</a></li>
                    </ul>
                </li>
                
                <li><a href="">카테고리</a></li>

                <li><a href="">MEET & ON</a>
                    <ul id="navi-1" class="group">
                        <li><a href="<%=request.getContextPath()%>/meetMain.mt" class="menu">전체모임</a></li>
                        <li><a href="" class="menu">참여중인 모임</a></li>
                        <li><a href="" class="menu">내모임</a></li>
                        <li><a href="" class="menu">스케쥴 캘린더</a></li>
                    </ul>
                </li>
                <li><a href="">마이페이지</a>
                    <ul id="navi-1" class="myPage">
                        <li><a href="" class="menu">My 홈</a></li>
                        <li><a href="" class="menu">My 정보</a></li>
                        <li><a href="" class="menu">My 계정</a></li>
                        <li><a href="" class="menu">My 보관함</a></li>
                        <li><a href="" class="menu">My 결제내역</a></li>
                    </ul>
                </li>
                <li><a href="">고객센터</a>
                    <ul id="navi-1" class="service">
                        <li><a onclick="goNotice();" class="menu">공지사항</a></li>
                        <li><a onClick="goContact();" class="menu">1:1문의</a></li>
                        <li><a onClick="goFaq();" class="menu">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <hr class="menubar-hr">
    <script>
    function logout(){
    	location.href="<%=request.getContextPath()%>/logout.me";
    }
    
    
    function loginForm(){
		location.href = "<%=request.getContextPath()%>/loginForm.me";
	}
    
    function joinForm(){
		location.href = "<%=request.getContextPath()%>/memberJoin.me";
	}
    
    function goNotice(){
    	location.href="<%=request.getContextPath()%>/noticeList.no";
    		
    }
    
    function goFaq(){
    	location.href="<%=request.getContextPath()%>/faqList.f";
    }
    
    function goContact(){
    	location.href="<%=request.getContextPath()%>/contactView.cot";
    }
    </script>
    
</body>
</html>