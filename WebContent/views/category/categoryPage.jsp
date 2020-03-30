<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/6.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

    <div id="category-wrap">

        <div id="selectCategory-wrap">
            <form action="categorySearch.sc" method="get">
            <div style="float:left; position: relative; width:120px; top:15px; font-size:17px">카테고리 선택</div>
            <div id="selectCategory">
                <select name="category" id="category">
                    <option selected value="novel">소설</option>
                    <option value="economy">경제/경영</option>
                    <option value="self-improvement">자기계발</option>
                    <option value="literature">문학</option>
                    <option value="computer">컴퓨터/IT</option>
                    <option value="society">사회</option>
                    <option value="science">과학</option>
                    <option value="history">역사</option>
                    <option value="art">예술/스포츠</option>
                    <option value="religion">종교</option>
                    <option value="hobby">취미/생활</option>
                    <option value="language">어학</option>
                </select>
            </div>

            <!-- 카테고리페이지 검색폼 -->
            <div id="search2-form">
                    <div id="search2"><input type="text" id="search-2" name="categorySearch" placeholder="해당 카테고리 내 도서 검색"></div>
                    <div id="search2-btnForm">
                        <button id="search2-btn" onmouseover="search3();" onmouseout="search4();" onclick="categorySearch();">
                        <img src="<%=request.getContextPath()%>/resources/images/search.png" id="search-image2" width="60%">
                        </button>
                    </div>
            </div>
            </form>
            
            <script>
            	
            	$(function(){
            		var novel = $("#category").attr("value");
            		$.ajax({
            			url:"categorySearch.sc",
            			data:{category:novel},
            			type:"get",
            			success:function(list){
            				var value="";
            				for(var i=0; i<list.length; i++){
            					value += '<div class="bookArea">' +
            	                '<div class="thumbnail">' + '<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' + '</div>' +
            	                '<div class="title">' + list[i].title + '</div>' +
            	                '<div class="author">' + list[i].author + '</div>' +
            	                '<div class="starRating">' + list[i].starRating + '</div>' +
            	            '</div>';
            				}
            				$("#bookListArea").html(value);
            			}
            			
            		});
            		           		
        			$(".subCategoryBtn").on("click",function(){
        				var category = $(".category").val();
        				var subCategory = $(this).val();
        			
        				$.ajax({
                			url:"categorySearch.sc",
                			data:{category:category, subCategory:subCategory},
                			type:"get",
                			success:function(list){
                				var value="";
                				for(var i=0; i<list.length; i++){
                					value += '<div class="bookArea">' +
                	                '<div class="thumbnail">' + '<img src="<%=request.getContextPath()%>/resources/images/book-thumbnail.jpg" alt="" style="width: 80%; height: 100%;">' + '</div>' +
                	                '<div class="title">' + list[i].title + '</div>' +
                	                '<div class="author">' + list[i].author + '</div>' +
                	                '<div class="starRating">' + list[i].starRating + '</div>' +
                	            '</div>';
                				}
                				$("#bookListArea").html(value);
                			}
                			
                		});
        			});
            		
            		
            	});
            
            
	</script>
            
            <!-- 서브카테고리 버튼 -->
            <div id="subCategoryBtnForm">
                <div id="novel" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>로맨스</button>
                    <button>판타지</button>
                    <button>SF</button>
                    <button>미스터리</button>
                    <button>기타</button>
                </div>
                <div id="economy" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>마케팅</button>
                    <button>재태크</button>
                    <button>금융</button>
                    <button>부동산</button>
                    <button>기타</button>
                </div>
                <div id="self-improvement" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>취업</button>
                    <button>창업</button>
                    <button>자격증</button>
                    <button>기타</button>
                </div>
                <div id="literature" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>시</button>
                    <button>에세이</button>
                    <button>동화</button>
                    <button>희극</button>
                    <button>수필</button>
                    <button>글모음</button>
                    <button>기타</button>
                </div>
                <div id="computer" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>컴퓨터</button>
                    <button>앱</button>
                    <button>개발/프로그래밍</button>
                    <button>기타</button>
                </div>
                <div id="society" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>정치</button>
                    <button>사회</button>
                    <button>행정</button>
                    <button>법률</button>
                    <button>기타</button>
                </div>
                <div id="science" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>수학</button>
                    <button>자연과학</button>
                    <button>기술과학</button>
                    <button>기타</button>
                </div>
                <div id="history" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>지리</button>
                    <button>전기</button>
                    <button>신화</button>
                    <button>한국사</button>
                    <button>세계사</button>
                    <button>기타</button>
                </div>
                <div id="art" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>음악</button>
                    <button>미술</button>
                    <button>연극</button>
                    <button>스포츠</button>
                    <button>기타</button>
                </div>
                <div id="religion" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>기독교</button>
                    <button>불교</button>
                    <button>카톨릭</button>
                    <button>기타</button>
                </div>
                <div id="hobby" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>요리</button>
                    <button>운동</button>
                    <button>건강</button>
                    <button>기타</button>
                </div>
                <div id="language" class="subCategoryBtn">
                    <button class="allList">전체</button>
                    <button>영어</button>
                    <button>중국어</button>
                    <button>일본어</button>
                    <button>프랑스어</button>
                    <button>기타</button>
                </div>
            </div>

            <!-- 서브카테고리버튼 jQuery -->
            <script>
                $(function () {
                    $(".subCategoryBtn").children().on("click", function () {
                        $(this).css({ "background": "rgb(112 48 160)", "color": "white" });
                        $(".subCategoryBtn").children().not(this).css({ "background": "white", "color": "black", "outline": "none" });
                    });
                });

                
                $(function () {
                    
                    $("#subCategoryBtnForm>*").css("display", "none");
                    $("#novel").css("display", "flex");

                    $("#category").change(function(){
                        // var category = document.getElementById("category").value;
                        // var selectValue = category.options[category.selectedIndex].val();
                        var selectValue = $("#category>option:selected").val();

                        switch (selectValue){
                            case "novel":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#novel").css("display", "flex"); break;
                            case "economy":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#economy").css("display", "flex"); break;
                            case "self-improvement":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#self-improvement").css("display", "flex"); break;
                            case "literature":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#literature").css("display", "flex"); break;
                            case "computer":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#computer").css("display", "flex"); break;
                            case "society":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#society").css("display", "flex"); break;
                            case "science":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#science").css("display", "flex"); break;
                            case "history":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#history").css("display", "flex"); break;
                            case "art":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#art").css("display", "flex"); break;
                            case "religion":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#religion").css("display", "flex"); break;
                            case "hobby":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#hobby").css("display", "flex"); break;
                            case "language":
                                $("#subCategoryBtnForm>*").css("display", "none");
                                $("#language").css("display", "flex"); break;
                        }
                        $(".allList").css({ "background": "rgb(112 48 160)", "color": "white" })
                    })
                });
            </script>
        </div>
        <div class="bookListArea">

        </div>
    </div>

    

</body>

</html>