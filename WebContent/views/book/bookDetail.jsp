<%@page import="com.kh.book.model.vo.Book"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Book b = (Book)request.getAttribute("b");
	int bookNo = Integer.parseInt(request.getParameter("bookNo"));
	Member loginUser1 = (Member)session.getAttribute("loginUser");
	int userNo = 0;
	if(loginUser1 != null){
		userNo = loginUser1.getMemberNo();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="<%=request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"
	rel="javascript" type="text/javascript"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/5.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/fontawesome-stars.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.barrating.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<!-- 책 상세페이지 전체영역 -->
	<div id="book-detail-wrap">
		<!-- 책 상세정보 -->
		<div id="book-detail-content-wrap">
			<div id="thumbnail">
				<img
					src="<%=request.getContextPath()%>/resources/images/xxlarge.jfif"
					width="100%">
			</div>
			<div id="book-info">
				<div id="category"><%=b.getMainCategory()%></div>
				<div id="title"><%=b.getTitle() %></div>
				<hr id="info-hr">
				<div id="subTitle"><%=b.getSubTitle() %></div>
				<div id="author"><%=b.getAuthor() %>
					<p>저</p>
				</div>
				<div id="translator"><%=b.getTranslator()%>
					<p>역</p>
				</div>
			</div>
			<div id="star-rating">
				<div class="star-rating"
					style="font-size: 30px; margin-left: 40px; font-weight: 900; color: red">
					<%=b.getStarRating() %>
				</div>
				<div class="star-rating"
					style="margin-top: 8px; margin-left: 20px; color: red">
					<%=b.getStarRating() %>
				</div>
				<div class="star-rating" style="margin-top: 8px;">
					(<%=b.getReviewCount() %>명)
				</div>
			</div>
			<div id="buttonArea">
				<%if(loginUser != null){ %>
				<button id="likeBtn" onclick="likeBtn();">
					<img src="<%=request.getContextPath()%>/resources/images/like1.png"
						id="like_image" width="90%">
				</button>
				<button id="cartBtn">
					<img src="<%=request.getContextPath()%>/resources/images/cart1.png"
						id="cart_image" width="90%">
				</button>
				<button id="rentalBtn" onclick="rental();">대여하기</button>
				<button id="getBtn">소장하기</button>
				<%}else{ %>
				<button id="likeBtn" disabled>
					<img src="<%=request.getContextPath()%>/resources/images/like1.png"
						id="like_image" width="90%">
				</button>
				<button id="cartBtn" disabled>
					<img src="<%=request.getContextPath()%>/resources/images/cart1.png"
						id="cart_image" width="90%">
				</button>
				<button id="rentalBtn" disabled>대여하기</button>
				<button id="getBtn" disabled>소장하기</button>
				<%} %>
			</div>


			<!-- 대여하기 or 소장하기 조회  ajax -->
			<script>
			
			$(function(){
				// 위시리스트 조회
				var bookNo = <%=b.getBookNo()%>;
				$.ajax({
					url:"searchWish.lib",
					data:{bookNo:bookNo},
					type:"get",
					success:function(result){
						if(result == 1){
							$("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like2.png");
						}else{
							$("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like1.png");
						}
					}
				});
				$.ajax({
					url:"searchLibrary.lib",
					data:{bookNo:bookNo},
					type:"get",
					success:function(result){
						if(result == 1){
							$("#rentalBtn").attr("disabled",true);
							$("#rentalBtn").on("click",function(){
								insertLibrary();
							});
						}else{
							$("#rentalBtn").attr("disabled",false);
						}
					}
				});
				
			});
			

			
			function insertLibrary(){
				var bookNo = <%=b.getBookNo() %>
				$.ajax({
					url:"insertLibrary.lib",
					data:{bookNo:bookNo},
					type:"get",
					success:function(result){
						if(result==1){
							alert("안녕");
						}
					}
				});
			}
			
			function likeBtn(){
				var bookNo = <%=b.getBookNo()%>;
				$.ajax({
					url:"insertWishList.lib",
					data:{bookNo:bookNo},
					type:"get",
					success:function(result){
						if(result == 1){
							$("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like1.png");
						}else{
							alert("위시리스트에 담기성공");
							$("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like2.png");
							
						}
					},
					error:function(){
						alert("실패!");
					}
				})
			}
			
			
			
			</script>

			<!-- 버튼클릭 jQuery -->
			<script>
                $(function () {
                    $("#likeBtn").on("click", function () {
                        if ($("#like_image").attr("src") == "<%=request.getContextPath()%>/resources/images/like1.png") {
                            $("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like2.png");
                        } else {
                            $("#like_image").attr("src", "<%=request.getContextPath()%>/resources/images/like1.png");
                        }
                    });
                })
                $(function () {
                    $("#cartBtn").on("click", function () {
                        if ($("#cart_image").attr("src") == "<%=request.getContextPath()%>/resources/images/cart1.png") {
                            $("#cart_image").attr("src", "<%=request.getContextPath()%>/resources/images/cart2.png");
                        } else {
                            $("#cart_image").attr("src", "<%=request.getContextPath()%>/resources/images/cart1.png");
                        }
                    });
                })
            </script>

			<div id="info2">
				<div id="introduction">
					<div style="margin-left: 30px">책소개</div>
					<div id="introduction-1"><%=b.getIntroduction() %></div>
					<button class="more-infoBtn">전체보기</button>
				</div>
				<div id="publisher-review">
					<div style="margin-left: 30px">출판사 서평</div>
					<div id="publisher-review-1"><%=b.getPublisherNotice() %></div>
					<button class="more-infoBtn">전체보기</button>
				</div>
			</div>

			<!-- 책소개,출판사서평 jQuery -->

			<script>
                $(function () {
                    $(".more-infoBtn").on("click", function () {
                        if ($(this).prev().attr('id') == "introduction-1") {
                            $(this).prev().attr('id', 'introduction-2');
                            $(this).html("간략히");
                        } else if ($(this).prev().attr('id') == "publisher-review-1") {
                            $(this).prev().attr('id', 'publisher-review-2');
                            $(this).html("간략히");
                        } else if ($(this).prev().attr('id') == "introduction-2") {
                            $(this).prev().attr('id', 'introduction-1');
                            $(this).html("전체보기");
                        } else if ($(this).prev().attr('id') == "publisher-review-2") {
                            $(this).prev().attr('id', 'publisher-review-1');
                            $(this).html("전체보기");
                        }

                    });
                });
            </script>

			<%if(loginUser != null){ %>
			<form method="POST">

				<div id="review">
					<div style="margin-left: 30px; font-size: 25px; margin-top: 50px;">리뷰</div>
					<select id="example" style="width: 100px;" name="star-score">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<script type="text/javascript">
                        $(function () {
                            $('#example').barrating({ theme: 'fontawesome-stars' });
                        });
                        $('#example').barrating({ theme: 'fontawesome-stars', initialRating: 3 });
                    </script>
					<div id="review-contentArea">
						<p style="margin-left: 630px; margin-bottom: 2px">
							<span id="count">0</span> / 300
						</p>
						<textarea id="review-content" name="review-content" cols="70"
							rows="5"
							placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개될 수 있습니다."></textarea>
					</div>
					<button type="submit" id="reviewBtn">리뷰작성</button>
					
				</div>
			</form>
			<%}else{%>
			
			<div id="review">
				<div style="margin-left: 30px; font-size: 25px; margin-top: 50px;">리뷰</div>
				<select id="example" style="width: 100px;" name="star-score"
					disabled>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<script type="text/javascript">
                        $(function () {
                            $('#example').barrating({ theme: 'fontawesome-stars' });
                        });
                        $('#example').barrating({ theme: 'fontawesome-stars', initialRating: 3 });
                    </script>
				<div id="review-contentArea">
					<p style="margin-left: 630px; margin-bottom: 2px">
						<span id="count">0</span> / 300
					</p>
					<textarea id="review-content" name="review-content" cols="70"
						rows="5" placeholder="로그인후 리뷰작성 가능" disabled></textarea>
				</div>
				<button type="submit" id="reviewBtn" disabled>리뷰작성</button>
			</div>
			<%} %>

			<script>
                $(function () {
                    $("#review-content").on("keyup", function () {
                        var inputLength = $(this).val().length;

                        $("#count").text(inputLength);

                        var remain = 300 - inputLength;

                        if (remain < 0) {
                            $("#count").css("color", "red");
                        } else {
                            $("#count").css("color", "black");
                        }
                    });
                });
            </script>

			<div id="review-listArea">
				<div id="sortBtnForm">
					<button class="sortBtn" id="newest">최신순</button>
					<button class="sortBtn" id="popSort">추천순</button>
				</div>
				<div id="review-list">
					<table id="review-list1">
                        <tr>
                            <td width="80px">
                                <p style="font-size: 14px;">you****
                                    2020.02.03
                                    ★★★★☆
                                </p>
                            </td>
                            <td width="600px"
                                style="font-size: 13px; white-space:pre-line; padding-right:40px; padding-left:20px">이상의
                                생생하며, 얼마나 있을 산야에 있는 만천하의 거선의 때까지 운다.
                                옷을 우리 사는가 가치를 간에 교향악이다.
                                웅대한 구하지 같이, 청춘의 우리 풀이 때문이다.</td>
                            <td width="50px"><button id="review-likeBtn"><img src="image/like1.png" alt=""
                                        width="100%"></button></td>
                            <td style="padding-right:20px">0</td>
                            <td width="50px"><button id="reportBtn"><img src="image/report.png" alt=""
                                        width="100%"></button></td>
                        </tr>
                        <tr>
                            <td width="80px">
                                <p style="font-size: 14px;">you****
                                    2020.02.02
                                    ★★★★☆
                                </p>
                            </td>
                            <td width="600px"
                                style="font-size: 13px; white-space:pre-line; padding-right:40px; padding-left:20px;">찾아
                                방황하였으며, 청춘 장식하는 어디 교향악이다.</td>
                            <td width="50px"><button id="review-likeBtn"><img src="image/like1.png" alt=""
                                        width="100%"></button></td>
                            <td style="padding-right:20px">0</td>
                            <td width="50px"><button id="reportBtn"><img src="image/report.png" alt=""
                                        width="100%"></button></td>
                        </tr>
                        <tr>
                            <td width="80px">
                                <p style="font-size: 14px;">
                                    you****
                                    2020.02.01
                                    ★★★★☆
                                </p>
                            </td>
                            <td width="600px"
                                style="font-size: 13px; white-space:pre-line; padding-right:40px; padding-left:20px">찾아
                                방황하였으며, 청춘 장식하는 어디 교향악이다. 이상의 생생하며, 얼마나 있을 산야에 있는 만천하의 거선의 때까지 운다. 옷을 우리 사는가 가치를 간에
                                교향악이다. 할지니, 없으면 우는 놀이 생의 싹이 피가 그리하였는가? 장식하는 많이 천고에 힘차게 우리의 수 것이 길지 위하여서. 웅대한 구하지 같이, 청춘의
                                우리 풀이 때문이다. 아니한 스며들어 같으며, 이상은 되는 따뜻한 힘차게 관현악이며, 찾아다녀도, 철환하였는가? 끝까지 열락의 열매를 철환하였는가? 인간은
                                가는 끝에 싸인 수 하는 인간에 청춘의 것이다. 봄바람을 실로 얼마나 우는 이상은 귀는 그것은 그들의 그들은 것이다. 그것은 구할 무엇을 예가 풀이 그들에게
                                사막이다.</td>
                            <td width="50px"><button id="review-likeBtn"><img src="image/like1.png" alt=""
                                        width="100%"></button></td>
                            <td style="padding-right:20px">0</td>
                            <td width="50px"><button id="reportBtn"><img src="image/report.png" alt=""
                                        width="100%"></button></td>
                        </tr>
					</table>
				</div>
				<button id="review-more">리뷰 더보기</button>
				<br> <br> <br> <br>
			</div>
			<script>
                // 리뷰 정렬버튼
                $(document).ready(function () {
                    $("#popSort").on("click", function () {
                        $(this).css({ "background": "rgb(112,48,160,0.9)", "color": "white" });
                        $("#newest").css({ "background": "white", "color": "rgb(112,48,160)" });

                    });
                    $("#newest").on("click", function () {
                        $(this).css({ "background": "rgb(112,48,160,0.9)", "color": "white" });
                        $("#popSort").css({ "background": "white", "color": "rgb(112,48,160)" });

                    });
                });

                // 리뷰 추천, 신고

            </script>
		</div>

		<!-- 해당카테고리 내 인기도서 -->
		<div id="category-pop">
			<div
				style="background-color: rgb(112, 48, 160); padding-top: 1px; height: 60px">
				<h3
					style="color: white; padding: 0 10px 10px 20px; vertical-align: middle;">카테고리
					인기도서</h3>
			</div>
			<div id="list-area">
				<ol>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
					<li><a href="" class="category-pop-list">.</a></li>
				</ol>
			</div>
		</div>
	</div>



</body>
</html>