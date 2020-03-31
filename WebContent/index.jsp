<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>
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
			<a href=""><img src="images/logo.png"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="images/logo.png"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="images/logo.png"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="images/logo.png"></a>
		</div>
		<div class="banner-1">
			<a href=""><img src="images/logo.png"></a>
		</div>
	</div>

	<script type="text/javascript">
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
		<%for(int i=0; i<10; i++) {%>
		<div class="menu1"></div>
		<%} %>

	</div>

	<hr class="line">

	<div id="wrap">
		<div>
			<button id="menuBtn">최신도서</button>
		</div>
		<%for(int i=0; i<10; i++) {%>
		<div class="menu2"></div>
		<%} %>
	</div>

	<hr class="line">

	<div id="wrap"></div>

	<script>
    	$(function(){
    		$.ajax({
    			url:"best.mg",
    			type:"get",
    			success:function(list){
    				var value = ""
    				for(var i=0; i<list.length; i++){
    				value += '<div class="menu1">' + 
    	            '<div class="thumbnail">' + '<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' + '</div>' +
    	            '<div class="title">'+ list[i].title + '</div>' +
    	            '<div class="star-rating">' + list[i].starRating + '</div>' +
    	            '<div class="review-number">' + list[i].reviewCount + '</div>' +
    	        	'</div>';
    				}
    				$(".menu1").html(value);
    				
   				},
				error:function(){
					console.log("ajax통신실패");
				}
    			
    		});

    		
    		$.ajax({
    			url:"newest.mg",
    			type:"get",
    			success:function(list){
    				var value = ""
    				for(var i=0; i<list.length; i++){
    				value += '<div class="menu1">' + 
    	            '<div class="thumbnail">' + '<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' + '</div>' +
    	            '<div class="title">'+ list[i].title + '</div>' +
    	            '<div class="star-rating">' + list[i].starRating + '</div>' +
    	            '<div class="review-number">' + list[i].reviewCount + '</div>' +
    	        	'</div>';
    				}
    				$(".menu2").html(value);
    			},
				error:function(){
					console.log("ajax통신실패");
				}
    		});
    	});
    </script>

</body>
</html>