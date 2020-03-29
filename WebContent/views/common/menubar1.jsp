<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);



body{
	font-family: 'Nanum Gothic';
	width: 100%;
	max-width: 1200px;
	min-width: 300px;
	margin: auto;
}

.navTop{
	margin-bottom: 50px;
}

/* 메뉴바 영역 관련 스타일 */
.navWrap {
	background-color: white;
	width: 100%;
	height: 50px;
}

.nav {
	align: center;
}

.menu {
	color: black;
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 19%;
	text-align: center;
	height: 50px;
	vertical-align: middle;
	margin: auto;
	padding: auto;
}

.menu:hover {
	cursor: pointer;
	color: purple;
}

.navLogo{
	margin: 30px 30px;
	width: 100%;
}

.logoImg{
	width : 40px;
	text-align: center;
	vertical-align: middle;
	
}

.logoName{
	margin: auto;
	display: inline-block;
	margin-bottom:3px;
	vertical-align: middle;
	font-weight: normal;
}

.searchDiv{
	display: inline-block;
	width:430px;
	margin-left: 10%;
	margin-right: 10%;
	vertical-align : middle;
	text-align: center;
}

.search{
	padding-left : 10px;
	width: 90%;
	height: 30px;
	font-size: 15px;
	border : 1px solid black;
	border-radius: 5px;
	display: inline-block;
}

.searchDiv > img {
	width : 20px;
	margin-left : 5px;
	text-align: center;
	vertical-align: middle;
}

.searchDiv > img:hover {
	cursor: pointer;
	background: url("<%=request.getContextPath()%>/resources/images/searchHover.png") no-repeat;
}

.nav > hr{
	border: 1px solid rgb(112 48 160);
	margin: 10px 30px;
}



</style>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>		
		function meetandon(){
			location.href = "<%=request.getContextPath()%>/meetMain.mt";
	}
</script>
</head>
<body>
	<div class ="navTop">
		<div class="navLogo">
			<img class="logoImg" src="<%=request.getContextPath()%>/resources/images/logo1.png">
			<h2 class="logoName" align="center">BOOK E ON & ON</h2>
			<div class="searchDiv">
			<input type="text" id="search" name="search" class="search" placeholder="제목, 저자, 출판사">
			<img src="<%=request.getContextPath()%>/resources/images/search.png">
			</div>
		</div>

		<!-- <br clear="both"> -->
		<br>

		<!-- 메뉴바 영역 -->
		<div class="navWrap">
			<div class="nav">
				<div class="menu" onclick="">홈</div>
				<div class="menu" onclick="">카테고리</div>
				<div class="menu" onclick="meetandon();">MEET & ON</div>
				<div class="menu" onclick="">마이페이지</div>
				<div class="menu" onclick="">고객센터</div>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>