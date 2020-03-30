<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/4.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

    <!-- 검색 전체영역 -->
    <div id="search-wrap">

        <!-- 검색페이지 검색폼 -->
        <div id="search2-form">
            <form action="<%=request.getContextPath()%>/searchList.sc">
                <div id="search2"><input type="text" id="search-2" name="search" placeholder="도서, 작가 검색" value="<%=keyword%>"></div>
                <div id="search2-btnForm"><button id="search2-btn" onmouseover="search3();" onmouseout="search4();"><img src="<%=request.getContextPath()%>/resources/images/search.png" id="search-image2" width="60%"></button></div>
            </form>
        </div>

        <!-- 검색 결과 영역 -->
        <div id="search-content">
			<div id="search-result-none">
			'<%=keyword%>'<%=msg %>
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
		function statusChange( statusItem ){
		   var strText = $(statusItem).text();

		   location.href = "<%=request.getContextPath()%>/searchList.sc"+'?search='+strText;
		   // strText 에 전체 문자열이 입력된다.
		}
		// 인기검색어 ajax
		$(function(){
			$.ajax({
				url:"popSearch.sc",
				type:"get",
				success:function(list){
					var value = "";
					
					for(var i=0; i<list.length; i++){
						value += '<li>' + 
							'<a href="#" onclick="statusChange(this)" class="popular-search-list">' + list[i].keyword + '</a>' + 
						'</li>'
					}
					$("#list-area>ol").html(value);					
				},
				error:function(){
					console.log("ajax 통신실패!");
				}
			})
		})
	</script>

</body>
</html>