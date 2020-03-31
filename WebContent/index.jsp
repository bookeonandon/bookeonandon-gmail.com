<%@page import="com.kh.search.model.vo.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Search> list1 = (ArrayList<Search>)request.getAttribute("list1");
	ArrayList<Search> list2 = (ArrayList<Search>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/2.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/3.css">

</head>
<body>

	<%@ include file="views/common/menubar.jsp"%>

	<!-- 광고배너 -->

	<div class="banner">
		<div class="banner-1">
			<a href=""><img src="<%=request.getContextPath()%>/resources/images/event/event1.png" width="100%"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="<%=request.getContextPath()%>/resources/images/event/event2.jpg" width="100%"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="<%=request.getContextPath()%>/resources/images/event/event3.jpg" width="100%"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="<%=request.getContextPath()%>/resources/images/event/event4.jfif" width="100%"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="<%=request.getContextPath()%>/resources/images/event/event5.jpg" width="100%"></a>
		</div>
	</div>

	<script>
        $(document).ready(function(){
            $('.banner').slick({
            infinite: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            arrows: true,
            dots:true,
            autoplaySpeed:5000,
            speed:1000,
            pauseOnHover:true,
            });
        });
        
    </script>


	<!-- 구독 광고배너 -->
	<div id="banner-2">
		<a href=""></a>
	</div>

	<!-- 베스트셀러 -->

	<hr class="line">

	<div id="wrap">
		<div>
			<button id="menuBtn">인기도서</button>
		</div>
		
	</div>

	<hr class="line">

	<div id="wrap">
		<div>
			<button id="menuBtn">최신도서</button>
		</div>

	</div>

	<hr class="line">

	<div id="wrap"></div>


</body>
</html>