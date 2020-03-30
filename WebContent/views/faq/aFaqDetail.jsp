<%@page import="com.kh.faq.model.vo.Faq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Faq f = (Faq)request.getAttribute("f");
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
	
	
		<!--**********************************
           
        ***********************************-->
        <div class="content-body">

            <!-- row -->

            <div class="container-fluid">

            <!-- 컨텐츠 헤더 -->
            <form class="content-form">
        
                <span class="content-header"> FAQ 관리 </span>
                <hr>
                
                <!-- 테이블 시작 -->
                <table class="content-table">
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px" class="none-center"><p class="content-text"><%= f.getFaqTitle() %></p></td>
                    </tr>
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">유 형</span></th>
                        <td height="45px" class="none-center">
                                <p class="content-text">
                                 <% switch(f.getFaqType()){
                                 	 	case 1 :  out.print("자주 묻는 질문"); break;
                                 		case 2 :  out.print("서비스 이용"); break;
                                 		case 3 :  out.print("밋앤온"); break;
                                 		case 4 :  out.print("결제/환불"); break;
                                 } %>
                                 </p>
                               
                        </td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">내 용</span></th>
                        <td class="none-center"><p class="notice-content"><%= f.getFaqContent().replace("\r\n","<br>") %></p></td>
                    </tr>
                </table>
                
                <!-- 등록하기 버튼 -->
                <hr>
                <div class="btn-submit">
                    <button type="button" class="btn mb-1 btn-primary" onclick="updateForm();">수정하기</button>
                    <button type="button" class="btn mb-1 btn-primary" onclick="deleteFaq();">삭제하기</button>
                </div>

            </form>

            </div>
            <!-- #/ container -->
        </div>
        

	
	<%@ include file="../common/adminFooter.jsp" %>
	
	
	<script>
		function updateForm(){
			
			location.href="<%=contextPath%>/updateForm.afa?nno=<%=f.getFaqNo()%>";
		}
		
		function deleteFaq(){
			
			location.href="<%=contextPath%>/delete.afa?nno=<%=f.getFaqNo()%>";
		}
	
	
	</script>
	
	
	
</body>
</html>