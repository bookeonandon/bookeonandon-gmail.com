<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form class="content-form" enctype="multipart/form-data" action="<%=contextPath%>/insert.aev" method="POST">
			<input type="hidden" name="writer" value="admin1">
                <span class="content-header"> 이벤트 관리 </span>
                <hr>
                <!-- 테이블 시작 -->
                <table class="content-table">
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px"><input type="text" class="form-control input-default" name="title"></td>
                    </tr>
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">적용기간</span></th>
                        <td height="45px"><input type="date" class="form-control input-default" name="date"></td>
                    </tr>
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">상세이미지</span></th>
                        <td height="45px"><input type="file" style="float:left; margin-left:14px;" name="detailImg"></td>
                    </tr>
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">썸네일이미지</span></th>
                        <td height="45px"><input type="file" style="float:left; margin-left:14px;" name="thumbnail"></td>
                    </tr>
                </table>
                <hr>
                <div class="btn-submit">
                    <button type="submit" class="btn mb-1 btn-primary">등록하기</button>
                </div>

            </form>

            </div>
            <!-- #/ container -->
        </div>
        
        
        <%@ include file="../common/adminFooter.jsp" %>
        
        
</body>
</html>