<%@page import="com.kh.contact.model.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Contact c = (Contact)request.getAttribute("c");    
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
	.detail-content{
		font-size:1.15em;
	}
</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	<div class="content-body">

            <div class="container-fluid">
                <form class="content-form" action="<%=contextPath%>/update.act" method="POST">
                    <!-- 컨텐츠 헤더 -->
        
                <span class="content-header"> 1:1 문의 </span>
                <hr>
                    <!-- 컨텐츠 뷰  -->
                <table class="content-table-view">
                <input type="hidden" name=nno value="<%=c.getContactNo() %>">
                <input type="hidden" name=rewriter value="admin1">
                <!--   <input type="hidden" name=rewriter value="<%=c.getContactReWriter() %>"> -->
                <input type="hidden" name=status value="<%=c.getContactStatus() %>">
                    <tr>
                        <th class="content-th content-th-2"><span class="content-text">제 목</span></th>
                        <td class="content-td none-center"><span class="content-text"><%=c.getContactTitle() %></span></td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">작성자</span></th>
                        <td class="content-td none-center"><span class="content-text"><%=c.getContactWriter() %></span></td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">작성일자</span></th>
                        <td class="content-td none-center"><span class="content-text"><%=c.getContactDate() %></span></td>
                    </tr>
                    <tr>
                        <th class="content-th"><span class="content-text">유 형</span></th>
                        <td class="content-td none-center">
                       		<span class="content-text">
		                        <% switch(c.getContactType()){
		                        case 1 : out.print("구독/서비스 이용 문의"); break;
		                   		case 2 : out.print("결제/취소/환불 문의"); break;
		                   		case 3 : out.print("오류 문의"); break;
		                   		case 4 : out.print("밋앤온 문의"); break;
		                   		case 5 : out.print("기타 문의"); break;
		                        }
		                        
		                        %>
	                        </span>
                        </td>
                    </tr>
                    
                    <tr>
                        <th class="content-th"><span class="content-text">내 용</span></th>
                        <td class="none-center"><p class="detail-content" style="padding-top:3px;"><%= c.getContactContent().replace("\r\n","<br>") %></tr>
                </table>
                <hr>
                
                
                <!-- 답변달기 -->
                
                <% if(c.getContactStatus().equalsIgnoreCase("y")){ %>
	                <div class="comment-view">
	                    <p class="comment-title"><b>답변하기</b></p>
	                    <textarea class="form-control" cols="150" rows="10" name="comment" style="resize:none"><%= c.getComment() %></textarea>
	                </div>
                <% }else{ %>
	                <div class="comment-view">
	                    <p class="comment-title"><b>답변하기</b></p>
	                    <textarea class="form-control" cols="150" rows="10" name="comment" style="resize:none"></textarea>
	                </div>
                <% } %>
	                <div class="btn-submit">
	                    <button type="submit" class="btn mb-1 btn-primary">등록하기</button>
	                </div>

            </form>

            </div>
            
        </div>
        
	
	
	<%@ include file="../common/adminFooter.jsp" %>


</body>
</html>