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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            <form class="content-form" action="update.afa" method="POST">
        
                <span class="content-header"> FAQ 관리 </span>
                <hr>
                
                <!-- 테이블 시작 -->
                <table class="content-table">
                	<input type="hidden" name="nno" value="<%=f.getFaqNo()%>">
                    <tr>
                        <th class="content-th content-th1"><span class="content-text">제 목</span></th>
                        <td height="45px"><input type="text" class="form-control input-default" name="title" value="<%=f.getFaqTitle()%>"></td>
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
                        <td><textarea class="form-control h-150px" cols="150" rows="20" id="comment" name="comment" style="resize:none"><%=f.getFaqContent()%></textarea></td>
                    </tr>
                </table>
                
                <!-- 등록하기 버튼 -->
                <hr>
                <div class="btn-submit">
                    <button type="submit" class="btn mb-1 btn-primary">수정하기</button>
                </div>

            </form>

            </div>
            <!-- #/ container -->
        </div>
        

	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script>
		$(function(){
			
			$("option").each(function(){
				if($(this).val() == <%=f.getFaqType()%>){
					$(this).prop("selected", true);
				}
			});
			
		});
	</script>
	
</body>
</html>