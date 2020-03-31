<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.member.model.vo.Wishlist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.PageInfo"%>
<%
	ArrayList<Wishlist> memberLibrary = (ArrayList<Wishlist>)request.getAttribute("memberLibrary");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!doctype html>

<html lang="en">



<head>

<meta charset="utf-8">

<title>My 서재</title>

<style>
.body-content {
	width: 1100px;
	margin: auto;
	text-align: center;
}

#select-checkbox {
	width: 13px;
	height: 13px;
	padding: 0;
	margin: 0;
	vertical-align: top;
	position: relative;
	top: -1px;
	overflow: hidden;
}

.card-list {
	width: 900px;
	margin: auto;
}

.card-body {
	height: 30px;
	margin: auto;
	padding: 0 !important;
}

.card-title {
	width: 100%;
	height: 100%;
	padding: 5px;
	overflow: hidden !important;
}

.btn {
	text-align: center;
	vertical-align: middle;
	padding: 5px;
	font-size: 13px;
	line-height: 1.5;
	border-radius: .25rem;
}

#btn-sel-all {
	background-color: white;
	border: 1px solid lightgrey;
}

#btn-del-sel {
	background-color: indianred;
	color: white;
	border: 1px solid lightgrey;
}
</style>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">



<title>My 관심도서</title>

</head>



<body>

	<%@ include file="../common/menubar.jsp"%>

	<br>

	<div class="body-content">

		<br>

		<div class="card-list">
			<% if(memberLibrary.isEmpty()){ %>
				<div><h4>조회된 서적이 없습니다.</h4></div>
			<% }else{ %>
			<div class="row row-cols-1 row-cols-md-6">
				<% for(Wishlist w : memberLibrary){ %>

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
		
 		<nav aria-label="Page navigation example">

			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="location.href='<%=contextPath%>/myPagePayment.my"
					aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span></a></li>
				<% if(currentPage ==1){%>
				<li class="page-item"><a class="page-link" href=""
					aria-label="Previous" disabled> <span aria-hidden="true">&lt;</span></a></li>
				<% }else{ %>
				<li class="page-item"><a class="page-link" href="<%=contextPath%>/myPageWishlist.my?currentPage=<%=currentPage-1%>"
					aria-label="Previous"> <span aria-hidden="true">&lt;</a></span></li>
				<% } %>
				<% for(int p=startPage; p<=endPage; p++){%>
    			<%if(currentPage ==p){ %>
				<li class="page-item"><a class="page-link" href="#" disabled><%=p%></a></li>
				<%}else{%>
				<li class="page-item"><a class="page-link" href="<%=contextPath%>/myPageWishlist.my?currentPage=<%=p%>"><%=p%></a></li>
				<% } %>
    			<% } %>
    			<% if(currentPage == maxPage){%>
    			<li class="page-item"><a class="page-link" href=""
					aria-label="Previous" disabled> <span aria-hidden="true">&gt;</span></a></li>
				<% }else{ %>
				<li class="page-item"><a class="page-link" href="<%=contextPath%>/myPageWishlist.my?currentPage=<%=currentPage+1%>"
					aria-label="Previous"> <span aria-hidden="true">&gt;</span></a></li>
				<% } %>
				<li class="page-item"><a class="page-link" href="location.href='<%=contextPath%>/myPagePayment.my"
					aria-label="Previous"> <span aria-hidden="true">&gt;&gt;</span></a><li>
			</ul>

		</nav>

	</div>

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