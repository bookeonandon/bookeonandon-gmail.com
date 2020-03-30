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
<style>
	.none-center>p{
		margin-bottom:2px;
	}
	.notice-content{
		font-size:1.15em;
	}
</style>
</head>
<body>


		<%@ include file="../common/adminMenubar.jsp" %>
		
		
		<div class="content-body">

            <!-- row -->

            <div class="container-fluid">

                <!-- 컨텐츠 헤더 -->
            <form class="content-form">
        
                <span class="content-header"> 공지사항 관리 </span>
                <hr>
                <!-- 테이블 시작 -->
                <table class="content-table">
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px" class="none-center"><p class="content-text"><%= n.getNoticeTitle() %></p></td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">내 용</span></th>
                        <td class="none-center"><p class="notice-content"><%= n.getNoticeContent().replace("\r\n","<br>") %></p></td>
                    </tr>
                </table>
                <hr>
                <div class="btn-submit">
                    <button type="button" class="btn mb-1 btn-primary" onclick="updateForm();">수정하기</button>
                    <button type="button" class="btn mb-1 btn-primary" onclick="deleteNotice();">삭제하기</button>
                </div>

            </form>

            </div>
            <!-- #/ container -->
        </div>
		
		
		<%@ include file="../common/adminFooter.jsp" %>
		
        <script>
        	function updateForm(){
        		
        		location.href="<%=contextPath%>/updateForm.no?nno=<%=n.getNoticeNo()%>";
        		
        	}
        	
        	function deleteNotice(){
        		
        		location.href="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>";
        	}
        
        
        </script>
		
		
</body>
</html>