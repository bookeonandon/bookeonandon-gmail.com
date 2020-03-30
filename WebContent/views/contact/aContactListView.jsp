<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.contact.model.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	ArrayList<Contact> list = (ArrayList<Contact>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table>tbody>tr:hover{
		cursor:pointer;
	}
</style>
<link href="<%=request.getContextPath() %>/resources/admin/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
	
	<%@ include file="../common/adminMenubar.jsp" %>
	
	
	<!--**********************************
            내용 시작
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid">

            <!-- 컨텐츠 헤더 -->
            <form class="content-form" onclick="">
        
                <span class="content-header"> 1:1 문의 </span>
                <hr>

                        <!-- 테이블 시작 -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkall"></th>
                                        <th>글번호</th>
                                        <th>유형</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>상태</th>
                                        </tr>
                                    </thead>
                                <tbody>
                                    <% if (list.isEmpty()){ %>
                                    
                                    <tr>
                                    	<td colspan="7">작성된 1:1 문의가 없습니다.</td>
                                    </tr>
                                    
                                    <%}else{ %>
                                    <tr>
                                    
	                                    <% for (Contact c : list){ %>
	                                        <td class="nonechk"><input type="checkbox" class="chk" name="chk"></td>
	                                        <td><%= c.getContactNo() %></td>
	                                        <td>
	                                        	<% switch(c.getContactType()){
				                                       	 	case 1 : out.print("구독/서비스 이용 문의"); break;
				                                       		case 2 : out.print("결제/취소/환불 문의"); break;
				                                       		case 3 : out.print("오류 문의"); break;
				                                       		case 4 : out.print("밋앤온 문의"); break;
				                                       		case 5 : out.print("기타 문의"); break;
				                                } %>
	                                        </td>
	                                        <td width="40%" class="none-center"><%= c.getContactTitle() %></td>
	                                        <td><%= c.getContactWriter() %></td>
	                                        <td><%= c.getContactDate() %></td>
	                                        <td>
	                                           <% switch(c.getContactStatus()){
				                                     case "y" :
				                                     case "Y" : out.print("답변완료"); break;
				                                     case "n" : 
				                                     case "N" : out.print("미답변"); break;
				                                } %>
	                                        </td>
                                    </tr>
                                    <% } %>
                                    
                                    <%} %>                         
                                </tbody>
                           </table>
                           <script> 
                            $(document).ready(function(){
                                //최상단 체크박스 클릭
                                $("#checkall").click(function(){
                                    //클릭되었으면
                                    if($("#checkall").prop("checked")){
                                        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                                        $("input[name=chk]").prop("checked",true);
                                        //클릭이 안되있으면
                                    }else{
                                        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                                        $("input[name=chk]").prop("checked",false);
                                    }
                                })
                            })

                        </script>
                        </div>

            </form>

            </div>
            <!-- #/ container -->
        </div>

            <!-- 삭제하기 모달 -->
            <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">삭제하기</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">삭제하시겠습니까?</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                            <button type="button" class="btn btn-primary" onclick="">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        
        
	        <!-- 테이블 클릭 시 수정 페이지로 넘어가게 -->
        	<script>
	    		$(function(){
	    			
	    			$(".table>tbody>tr>td").not(".nonechk").click(function(){
	    				var nno = $(this).parent().children().eq(1).text();
	    				
	    				location.href="<%=contextPath%>/updateForm.act?nno=" + nno;
	    				
	    			})
	 
	    		});
			</script>
        
                            
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>



</body>
</html>