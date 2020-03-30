<%@page import="com.kh.search.model.vo.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Search> titleList = (ArrayList<Search>)request.getAttribute("list");
	String keyword = request.getParameter("search");
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
					<input type="text" id="search-2" name="search" placeholder="도서, 작가 검색">
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
						'<%=keyword %>'
					</div>
					<div style="margin-left: -12px">도서 검색결과</div>
					<div style="margin-left: -12px">
						(<%=titleList.size() %>)
					</div>
				</h3>
			</div>

			<div id="sortBtnForm">
            	<button class="sortBtn" id="popSort">인기순</button>
            	<button class="sortBtn" id="highScoreSort">별점순</button>
            	<button class="sortBtn" id="newest">출간순</button>
            </div>
            
            <div id="search-contentArea">
				<% for (int i = 0; i < titleList.size(); i++) {%>
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
            </div>
            
            <div id="search-contentArea2">
            
            </div>

			<!-- 정렬버튼 ajax -->
            <script>
                $(document).ready(function(){
                	
                    var keyword = "<%= keyword%>";
                	
                	$("#popSort").on("click",function(){
                        $(this).css({"background":"rgb(112,48,160,0.9)","color":"white"});
                        $("#newest").css({"background":"white","color":"rgb(112,48,160)"});
                        $("#highScoreSort").css({"background":"white","color":"rgb(112,48,160)"});
                        

                        $.ajax({
                        	url:"sortCriteria.sc",
                        	data:{keyword:keyword,
                        		 sortCriteria:"pop"},
                        	type:"get",
                        	success:function(list){

                        		var value = "";
                					for(var i=0; i<list.length;i++){
                					value +=
                    				'<div class="search-title-area">' +
                    					'<div class="thumbnail">' +
                    						'<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' +
                    					'</div>'+
                    					'<div class="book-info1">'+
                    						'<div class="title">' + list[i].title +
                    						'</div>' +
                    					'</div>' +
                    					'<div class="book-info2">' +
                    						'<div class="star-rating">' +
                    							'<span class="star-prototype">' + list[i].starRating + '</span>' +
                    							'(' + list[i].starRating + ')' +
                    						'</div>' +
                    						'<div class="review-number" style="margin-left: 5px">' + list[i].reviewCount + '명' +
                    						'</div>' +
                    						'<div class="author">' + list[i].author + '</div>' +
                    						'<div>' + list[i].publisher + '</div>' +
                    					'</div>' +
                    					'<div class="book-info3" style="font-size: 18px;">' +
                    						list[i].introduction + '</div>' +
                    				'</div>';
                					}
                				$("#search-contentArea").hide();
                				$("#search-contentArea2").show();
                				$("#search-contentArea2").html(value);
                        		
                        		
                        	},
                        	error:function(){
                        		console.log("ajax통신실패");
                        	}
                        });

                    });
                    $("#highScoreSort").on("click",function(){
                        $(this).css({"background":"rgb(112,48,160,0.9)","color":"white"});
                        $("#popSort").css({"background":"white","color":"rgb(112,48,160)"});
                        $("#newest").css({"background":"white","color":"rgb(112,48,160)"});
                        
                        var keyword = "<%= keyword%>";
                        
                        $.ajax({
                        	url:"sortCriteria.sc",
                        	data:{keyword:keyword,
                        		 sortCriteria:"highScore"},
                        	type:"get",
                        	success:function(list){

                        		var value = "";
                        		
                					for(var i=0; i<list.length;i++){
                					var bookNo = list[i].bookNo;
                					value +=
                    				'<div class="search-title-area">' +
                    					'<div class="thumbnail">' +
                    						'<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' +
                    					'</div>'+
                    					'<div class="book-info1">'+
                    						'<div class="title">' + list[i].title +
                    						'</div>' +
                    					'</div>' +
                    					'<div class="book-info2">' +
                    						'<div class="star-rating">' +
                    							'<span class="star-prototype">' + list[i].starRating + '</span>' +
                    							'(' + list[i].starRating + ')' +
                    						'</div>' +
                    						'<div class="review-number" style="margin-left: 5px">' + list[i].reviewCount + '명' +
                    						'</div>' +
                    						'<div class="author">' + list[i].author + '</div>' +
                    						'<div>' + list[i].publisher + '</div>' +
                    					'</div>' +
                    					'<div class="book-info3" style="font-size: 18px;">' +
                    						list[i].introduction + '</div>' +
                    				'</div>';
                					}
                				
                    				$("#search-contentArea").hide();
                    				$("#search-contentArea2").show();
                    				$("#search-contentArea2").html(value);
                        		
                        		
                        	},
                        	error:function(){
                        		console.log("ajax통신실패");
                        	}
                        })

                    });
                    $("#newest").on("click",function(){
                        $(this).css({"background":"rgb(112,48,160,0.9)","color":"white"});
                        $("#popSort").css({"background":"white","color":"rgb(112,48,160)"});
                        $("#highScoreSort").css({"background":"white","color":"rgb(112,48,160)"});
                        
                        var keyword = "<%= keyword%>";
                        
                        $.ajax({
                        	url:"sortCriteria.sc",
                        	data:{keyword:keyword,
                        		 sortCriteria:"issueDate"},
                        	type:"get",
                        	success:function(list){

                        		var value = "";
                					for(var i=0; i<list.length;i++){
                					value +=
                    				'<div class="search-title-area">' +
                    					'<div class="thumbnail">' +
                    						'<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' +
                    					'</div>'+
                    					'<div class="book-info1">'+
                    						'<a class="title">' + list[i].title +
                    						'</a>' +
                    					'</div>' +
                    					'<div class="book-info2">' +
                    						'<div class="star-rating">' +
                    							'<span class="star-prototype">' + list[i].starRating + '</span>' +
                    							'(' + list[i].starRating + ')' +
                    						'</div>' +
                    						'<div class="review-number" style="margin-left: 5px">' + list[i].reviewCount + '명' +
                    						'</div>' +
                    						'<div class="author">' + list[i].author + '</div>' +
                    						'<div>' + list[i].publisher + '</div>' +
                    					'</div>' +
                    					'<div class="book-info3" style="font-size: 18px;">' +
                    						list[i].introduction + '</div>' +
                    				'</div>';
                					}
                				
                    				$("#search-contentArea").hide();
                    				$("#search-contentArea2").show();
                    				$("#search-contentArea2").html(value);
                        		
                        	},
                        	error:function(){
                        		console.log("ajax통신실패");
                        	}
                        })

                    });
                    
                });
            </script>

			<div id="search-contentArea">
			
			</div>
		</div>

				<script>
	            $.fn.generateStars = function() {
	                return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	            };
	
	            // 숫자 평점을 별로 변환하도록 호출하는 함수
	            $('.star-prototype').generateStars();
	            </script>


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