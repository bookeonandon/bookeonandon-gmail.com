<%@page import="com.kh.book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Book b = (Book)request.getAttribute("b");

	String adChk = b.getAdult();
	
	if(adChk.equalsIgnoreCase("y")){
		adChk = "checked";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	
	       
	       <div class="content-body">

            <!-- row -->

            <div class="container-fluid">

                <!-- 컨텐츠 헤더 -->
                <div class="form-validation">
                    <form class="content-form" action="<%=contextPath %>/update.abk" enctype="multipart/form-data" method="post">
                	<input type="hidden" name="bNo" value="<%=b.getBookNo()%>">
                <span class="content-header"> 상품등록 </span>
                <hr>

                <!-- 테이블 시작 -->
                <div class="product-block">
                    <div class="product-inline">
                        <label for="book-name ">도서명</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-name" name="name" value="<%=b.getTitle()%>">
                    </div>
                    <div class="product-inline">
                        <label for="book-author">저자명</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-author" name="author" value="<%=b.getAuthor()%>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="book-subname">부제명</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-subname" name="subName" value="<%=b.getSubTitle()%>">
                    </div>
                    <div class="product-inline">
                        <label for="book-translator">옮긴이</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-translator" name="translator" value="<%=b.getTranslator()%>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="book-category">메인카테고리</label>
                        <select class="form-control col-md-8" name="category">
	                        <option value="소설">소설</option>
	                        <option value="경제/경영">경제/경영</option>
	                        <option value="자기계발">자기계발</option>
	                        <option value="문학">문학</option>
	                        <option value="컴퓨터/IT">컴퓨터/IT</option>
	                        <option value="사회">사회</option>
	                        <option value="과학">과학</option>
	                        <option value="역사">역사</option>
	                        <option value="예술/스포츠">예술/스포츠</option>
	                        <option value="종교">종교</option>
						</select>
                    </div>
                    <div class="product-inline">
                        <label for="book-subcategory">서브카테고리</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-subcategory" name="subCategory" value="<%=b.getSubCategory()%>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="publish">출판사</label>
                        <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="publish" name="publish" value="<%=b.getPublisher()%>">
                    </div>
                    <div class="product-inline">
                        <label for="book-price">가격</label>
                        <input type="number" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="book-price" name="price" value="<%=b.getPrice()%>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="page">페이지</label>
                    	<input type="number" class="form-control col-md-8" id="page" name="page" value="<%=b.getPrice()%>">
                    </div>
                    <div class="product-inline">
                        <label for="issue-date">출간일</label>
                        <input type="date" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="issue-date" name="date" value="<%=b.getIssueDate()%>">
                    </div>
                </div>

                <div class="product-block">
                    <label for="book-thumbnail">썸네일등록</label>
                    <input type="file" name="thumbnail" id="book-thumbnail">
                </div>
                <div class="product-block">
                    <label for="book-contents">책 등록</label>
                    <input type="file" name="bookPdf" id="bookContents">
                </div>
                <div class="product-block">
                    <label for="book-introduce">책 소개</label>
                        <div class="product-inline2">
                        <textarea class="form-control h-150px" cols="100" rows="4" id="book-introduce" name="introduce"><%=b.getIntroduction()%></textarea>
                        </div>
                </div>
                <div class="product-block">
                    <label for="publish-review">출판사 서평</label>
                        <div class="product-inline2">
                        <textarea class="form-control h-150px" cols="100" rows="4" id="publish-review" name="review"><%=b.getPublisherNotice()%></textarea>
                        </div>
                </div>
                <div class="product-block">
                    <label for="contents">목차</label>
                        <div class="product-inline2">
                        <textarea class="form-control h-150px" cols="100" rows="4" id="contents" name="contents"><%=b.getContents()%></textarea>
                        </div>
                </div>
                <div class="product-block">
                    <label for="adult">성인물</label>
                    <input type="checkbox" name="adult" id="adult" value="y" <%=adChk%>>
                </div>

                        <div class="form-group row">
                            <div class="col-lg-8 ml-auto">
                                <button type="submit" class="btn btn-primary">등록하기</button>
                            </div>
                        </div>
                    </form>
                </div>
                

    

            </div>
            <!-- #/ container -->
        </div>
        
           <script>
              	$(function(){
              		$("option").each(function(){
              			if($(this).val() == <%=b.getMainCategory()%>){
              				$(this).prop("selected", true);
              			}
              		})
              	})
            </script>
        
                            
	
	<%@ include file="../common/adminFooter.jsp" %>
</body>
</html>