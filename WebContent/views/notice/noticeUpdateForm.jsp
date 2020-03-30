<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("n");
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
            <form class="content-form" action="<%=contextPath %>/update.no" method="POST">
        
                <span class="content-header"> 공지사항 관리 </span>
                <hr>
                <!-- 테이블 시작 -->
                <table class="content-table">
                	<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px"><input type="text" class="form-control input-default" name="noticeTitle" value="<%=n.getNoticeTitle()%>"></td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">내 용</span></th>
                        <td><textarea class="form-control h-150px" cols="150" rows="20" name="noticeContent" style="resize:none"><%=n.getNoticeContent()%></textarea></td>
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