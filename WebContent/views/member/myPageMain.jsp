<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.member.model.vo.Wishlist"%>
<%@page import="java.util.ArrayList"%>
<%
	Member mem = (Member) request.getAttribute("mem");
	ArrayList<Wishlist> memberWishlist = (ArrayList<Wishlist>)request.getAttribute("memberWishlist");

	String nickname = mem.getNickname();
	String phone = mem.getPhone();
	String email = mem.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 홈</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<style>
body {
	width: 1200px;
	margin: auto;
	padding: 0px;
}

.body-content {
	width: 1100px;
	margin: auto;
}

.hr-sect {
	width: 100%;
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.5);
	font-size: 14px;
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.card-text {
	font-size: 14px;
	margin: 10px;
}

.card-text-book {
	font-size: 14px;
	margin: 0px;
	text-align: center;
}

#button-center {
	text-align: center;
	margin: 10px;
}

.progress {
	margin-top: 10px;
}

.br-l {
	display: block;
	content: "";
	margin-top: 10px;
}

.card-body {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

a:link {
	text-decoration: none;
	color: grey;
}

a:visited {
	text-decoration: none;
	color: grey;
}

a:hover {
	text-decoration: underline;
	color: darkslategrey;
}

.card-list {
	width: 1100px;
	margin: auto;
}

.card-title {
	width: 100%;
	height: 100%;
	padding: 5px;
	overflow: hidden !important;
}
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<br>
	<div class="body-content">
		<div class="card-group">
			<div class="card bg-light" id="card-body" style="flex-grow: 0.5">
				<div class="card-body">
					<p class="card-text">
						닉네임: <%=nickname%>
					</p>
					<p class="card-text">
						휴대폰: <%=phone%>
					</p>
					<p class="card-text">
						이메일: <%=email%>
					</p>
					<div id="button-center">
						<button type="button" class="btn btn-secondary">로그아웃</button>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="container">
						<div class="row">
							<div class="col" align="center" onclick="toAccount();">
								<img src="<%=contextPath%>/resources/images/review_image.png" width="100%"><br>
								My 리뷰<br class="br-l">
							</div>
							<div class="col" align="center" onclick="toAccount();">
								<img src="<%=contextPath%>/resources/images/meeting_image.jpg" width="100%"><br>
								My 소모임<br class="br-l">
							</div>
							<div class="col" align="center" onclick="toAccount();">
								<img src="<%=contextPath%>/resources/images/faq_image.jpg" width="100%"><br>
								My 문의<br class="br-l">
							</div>
							<div class="col" align="center" onclick="toAccount();">
								<img src="<%=contextPath%>/resources/images/coupon_image.png" width="100%"><br>
								My 쿠폰<br class="br-l">
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="progress">
									<div class="progress-bar" role="progressbar"
										style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">25%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div class="hr-sect">&emsp;My 관심서적&emsp;</div>
		<br>
		<div class="body-content">

		<br>

		<div class="card-list" style="margin-bottom:50px;">
			<% if(memberWishlist.isEmpty()){ %>
				<div align="center"><h6>조회된 관심서적이 없습니다.</h4></div>
			<% }else{ %>
			<div class="row row-cols-1 row-cols-md-6">
				<% for(Wishlist w : memberWishlist){ %>
				<div class="col mb-4">
					<div style="height: 12px;">
					</div>
					<div class="card">
						<img src="<%= w.getBook_image() %>" class="card-img-top">
						<div class="card-body">
							<div class="card-title"><%= w.getBook_title() %></div>
						</div>
					</div>
				</div>
					<% } %>
				<% } %>
			</div>
		</div>
		<br>
		<div align="center" style="font-size: 12px;">
			<a href="<%=request.getContextPath() %>/myPageWishlist.my">더보기</a>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<Script>
		function toAccount(){
			location.href = "<%=request.getContextPath()%>/myPageAccount.my";
		}
	</Script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>

</html>