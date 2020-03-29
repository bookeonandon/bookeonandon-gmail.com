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
	
	
		<!--**********************************
            	내용 시작 // 업데이트 구문임
        ***********************************-->
        <div class="content-body">

            <!-- row -->

            <div class="container-fluid">

            <!-- 컨텐츠 헤더 -->
            <form class="content-form" action="<%=contextPath %>/faqInsert.afa" method="POST">
        
                <span class="content-header"> FAQ 관리 </span>
                <hr>
                
                <!-- 테이블 시작 -->
                <table class="content-table">
                    <tr>
                    <input type="hidden" name="writer" value="admin1">
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px"><input type="text" class="form-control input-default" name="title"></td>
                    </tr>
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">유 형</span></th>
                        <td height="45px">
                            <select class="form-control" id="sel1" name="status">
                                <option value="1">자주 묻는 질문</option>
                                <option value="2">서비스 이용</option>
                                <option value="3">MEET & ON</option>
                                <option value="4">결제 및 환불</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">내 용</span></th>
                        <td><textarea class="form-control h-150px" cols="150" rows="20" id="comment" name="content" style="resize:none"></textarea></td>
                    </tr>
                </table>
                
                <!-- 등록하기 버튼 -->
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