<%@page import="com.kh.search.model.vo.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Search> titleList = (ArrayList<Search>) request.getAttribute("list1");
	ArrayList<Search> authorList = (ArrayList<Search>) request.getAttribute("list2");
	String keyword = (String) request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/4.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 검색 전체영역 -->
	<div id="search-wrap">

		<!-- 검색페이지 검색폼 -->
		<div id="search2-form">
			<form action="<%=request.getContextPath()%>/searchList.sc">
				<div id="search2">
					<input type="text" id="search-2" name="search"
						placeholder="도서, 작가 검색" value="<%=keyword%>">
				</div>
				<div id="search2-btnForm">
					<button id="search2-btn" onmouseover="search3();"
						onmouseout="search4();">
						<img
							src="<%=request.getContextPath()%>/resources/images/search.png"
							id="search-image2" width="60%">
					</button>
				</div>
			</form>
		</div>

		<!-- 검색 결과 영역 -->
		<div id="search-content">
			<div class="search-category">
				<h3 id="search-title">
					<div style="color: rgb(92, 24, 107)">
						'<%=keyword%>'
					</div>
					<div style="margin-left: -12px">도서 검색결과</div>
					<div style="margin-left: -12px">
						(<%=titleList.size()%>)
					</div>
				</h3>
			</div>

			<div id="search-contentArea">

				<% for (int i = 0; i < titleList.size(); i++) {%>
				<% if (i == 3) {break;}	%>
				<div class="search-title-area">
					<div class="thumbnail" value="<%=titleList.get(i).getBookNo()%>">
						<img
							src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg"
							alt="" style="width: 80%; height: 100%;">
					</div>
					<div class="book-info1">
						<div class="title" value="<%=titleList.get(i).getBookNo()%>"> <%=titleList.get(i).getTitle()%>
						</div>
					</div>
					<div class="book-info2">
						<div class="star-rating">
							<span class="star-prototype"><%=titleList.get(i).getStarRating()%></span>
							(<%=titleList.get(i).getStarRating()%>)
						</div>
						<div class="review-number" style="margin-left: 5px"><%=titleList.get(i).getReviewCount()%>명
						</div>
						<div class="author" onclick="location.href=''"><%=titleList.get(i).getAuthor()%></div>
						<div><%=titleList.get(i).getPublisher()%></div>
					</div>
					<div class="book-info3" value="<%=titleList.get(i).getBookNo()%>"
						style="font-size: 18px;">
						<%=titleList.get(i).getIntroduction()%>
					</div>
				</div>

				
				<%}%>
				
				<% if (titleList.size() > 3) {%>
				<button onclick="moreBtn();" id="search-more">검색결과 더보기</button>
				<%}	%>

			</div>
			
			<script>
				$(function(){
					$(".thumbnail").click(function(){
						goDetail($(this).attr("value"));
					});
					$(".title").click(function(){
						goDetail($(this).attr("value"));
					});
					$(".book-info3").click(function(){
						goDetail($(this).attr("value"));
					});
				});
				
				function goDetail(value){
					location.href = "<%=request.getContextPath()%>/bookDetail.bk?bookNo=" + value;
				}
			</script>

			<script>
			$.fn.generateStars = function() {
			    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
			};

			// 숫자 평점을 별로 변환하도록 호출하는 함수
			$('.star-prototype').generateStars();
	        </script>


			<!-- 작가검색 -->
			<div class="search-category" style="margin-top: 80px;">
				<h3 id="search-author">
					<div style="color: rgb(92, 24, 107)">
						'<%=keyword%>'
					</div>
					<div style="margin-left: -12px">작가 검색결과</div>
					<div style="margin-left: -12px">
						(<%=authorList.size()%>)
					</div>

				</h3>
			</div>
			<div id="search-authorArea">
				<table>
					<%
						for (int i = 0; i < authorList.size(); i++) {
					%>
					<tr>
						<th width="180px" height="50px" onclick=""
							style="color: rgb(92, 24, 107)"><%=authorList.get(i).getAuthor()%></th>
						<td style="font-size: 15px;">도서명 : <%=authorList.get(i).getTitle()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>

		</div>



		<!-- 인기검색어 -->
		<div id="popular-search">
			<div
				style="background-color: rgb(112, 48, 160, 0.2); padding-top: 1px; height: 60px">
				<h3
					style="color: rgb(112, 48, 160); padding: 0 10px 10px 20px; vertical-align: middle;">인기검색어</h3>
			</div>
			<div id="list-area">
				<ol>

				</ol>
			</div>
		</div>
	</div>

	<script>
		function moreBtn(){
			location.href = "<%=request.getContextPath()%>/moreTitle.sc?search=<%=keyword%>";	
		}


		function statusChange( statusItem ){
		   var strText = $(statusItem).text();

		   location.href = "<%=request.getContextPath()%>/searchList.sc"+ '?search=' + strText;
			// strText 에 전체 문자열이 입력된다.
		}

		// 인기검색어 ajax
		$(function() {
			$.ajax({
				url : "popSearch.sc",
				type : "get",
				success : function(list) {
					var value = "";

					for (var i = 0; i < list.length; i++) {
						value += '<li>'
						+ '<a href="#" onclick="statusChange(this)" class="popular-search-list">'
						+ list[i].keyword + '</a>' + '</li>'
					}
						$("#list-area>ol").html(value);
				},
				error : function() {
					console.log("ajax 통신실패!");
				}
			})
		})
	</script>

</body>
</html>