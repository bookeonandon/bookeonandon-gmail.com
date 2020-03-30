<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
   String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/1.css">

</head>
<body>
   <!-- 헤더 테스트 -->

   <div id="header">
      <div id="header-1">
         <div id="logoForm">
            <a href="<%=request.getContextPath() %>"
               style="text-decoration: none; color: black; font-weight: 300;">
               <img src="<%=request.getContextPath() %>/resources/images/logo1.png" width="30px" height="30px" style="float: left; margin-top: 10px">
               <p style="float: left; vertical-align: middle; margin-left: 15px; font-size: 25px; margin-top: 7px;">BOOK E ON&ON</p>
            </a>
         </div>
      <div id="searchForm">
         <form action="<%=request.getContextPath()%>/searchList.sc">
            <div id="search">
            <input type="text" id="search-1" name="search" value="" placeholder="도서,작가 검색"></div>
               <div id="searchBtnForm">
                  <button type="submit" id="searchBtn" onmouseover="search1();" onmouseout="search2();"><img src="<%=request.getContextPath() %>/resources/images/search.png" id="search-image" width="80%" height="auto"></button></div>
            </form>
         </div>
         <%if(loginUser == null){ %>
         <div id="joinForm">
            <div id="joinForm-1"><button type="button" onclick="loginForm();" class="joinBtn">로그인</button></div>
            <div id="joinForm-2"><button type="button" onclick="joinForm();" class="joinBtn">회원가입</button></div>
         </div>
         <%}else{ %>
            <div id="joinForm-1">
               <button type="button" onclick="library();" class="joinBtn">내서재</button>
            </div>
            <div id="joinForm-2">
               <button type="button" onclick="logout();" class="joinBtn">로그아웃</button>
            </div>
         <%} %>
      </div>

      <script>
         function search1(){
             var search_image = document.getElementById("search-image").src="<%=request.getContextPath() %>/resources/images/search-hover.png";
         }
         function search2(){
             var search_image = document.getElementById("search-image").src="<%=request.getContextPath() %>/resources/images/search.png";
         }
         function search3(){
             var search_image = document.getElementById("search-image2").src="<%=request.getContextPath() %>/resources/images/search-hover.png";
         }
         function search4(){
             var search_image = document.getElementById("search-image2").src="<%=request.getContextPath() %>/resources/images/search.png";
         }      
         
      </script>

      <!-- 네비게이터 -->

      <div id="navigator">
         <ul id="navi">
            <li><a href="<%=request.getContextPath()%>">홈</a>
               <ul id="navi-1" class="home">
                  <li><a href="<%=request.getContextPath()%>" class="menu">베스트셀러</a></li>
                  <li><a href="<%=request.getContextPath()%>" class="menu">인기도서</a></li>
                  <li><a href="<%=request.getContextPath()%>" class="menu">신간도서</a></li>
                  <li><a href="<%=request.getContextPath()%>" class="menu">ON&ON 추천</a></li>
               </ul></li>

            <li><a href="<%=request.getContextPath()%>/categoty.ct">카테고리</a></li>

            <li><a href="<%=request.getContextPath()%>">MEET & ON</a>
               <ul id="navi-1" class="group">
                  <li><a href="<%=request.getContextPath()%>/meetMain.mt"
                     class="menu">전체모임</a></li>
                  <li><a href="" class="menu">참여중인 모임</a></li>
                  <li><a href="" class="menu">내모임</a></li>
                  <li><a href="" class="menu">스케쥴 캘린더</a></li>
               </ul></li>
            <li><a href="<%=request.getContextPath() %>/myPageMain.my">마이페이지</a>
                    <ul id="navi-1" class="myPage">
                        <li><a href="<%=request.getContextPath() %>/myPageMain.my" class="menu">My 홈</a></li>
                        <li><a href="<%=request.getContextPath() %>/myPageInfo.my" class="menu">My 정보</a></li>
                        <li><a href="<%=request.getContextPath() %>/myPageAccount.my" class="menu">My 계정</a></li>
                        <li><a href="<%=request.getContextPath() %>/myPageWishlist.my" class="menu">My 관심서적</a></li>
                        <li><a href="<%=request.getContextPath() %>/myPagePayment.my" class="menu">My 결제내역</a></li>
                    </ul>
                </li>
            <li><a href="">고객센터</a>
               <ul id="navi-1" class="service1">
                  <li><a onclick="goNotice();" class="menu">공지사항</a></li>
                  <li><a onClick="goContact();" class="menu">1:1문의</a></li>
                  <li><a onClick="goFaq();" class="menu">FAQ</a></li>
               </ul></li>
         </ul>
      </div>
   </div>
   <hr id="header-hr">
   <script>
    
    /* 고객센터  */
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
       location.href="<%=request.getContextPath()%>/contactList.cot";
    }
    
    /* MEET & ON  */
   function meetandon(){
      location.href = "<%=request.getContextPath()%>/meetMain.mt";
      }
    

    
    </script>
</body>
</html>