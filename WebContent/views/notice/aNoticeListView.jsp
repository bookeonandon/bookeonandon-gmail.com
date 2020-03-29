<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

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
	
	<div class="content-body">

            <div class="container-fluid">
             <!-- 컨텐츠 헤더 -->
                    
            <form class="content-form" action="<%=contextPath%>/deleteList.no" method="POST">
        
                <span class="content-header"> 공지사항 </span>
                <hr>

                        <!-- 테이블 시작 -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkall"></th>
                                        <th>글번호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        </tr>
                                </thead>
                                <tbody>
                                
                                <%if(list.isEmpty()){%>
                                	<tr>
                                        <td colspan="5">존재하는 공지사항이 업습니다.</td>
                                    </tr>
                               	<% }else{ %>
	                                <% for ( Notice n : list ) { %>
	                                    <tr>
	                                        <td class="nonechk"><input type="checkbox" class="chk" name="chk" value="<%=n.getNoticeNo()%>"></td>
	                                        <td><%= n.getNoticeNo() %></td>
	                                        <td width="60%" class="none-center"><%=n.getNoticeTitle() %></td>
	                                        <td><%= n.getNoticeWriter() %></td>
	                                        <td><%= n.getNoticeDate() %></td>
	                                    </tr>
	                                    
	                               	<% } %>
                               	
                               	<% } %>
                                
                                </tbody>
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
                           </table>
                        </div>
                        <!-- 삭제, 수정, 등록 버튼 -->
                            <div class="btn-submit-top">
                                <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target=".bd-example-modal-sm">삭제하기</button>
                                <button type="button" class="btn mb-1 btn-primary btn-sm" onclick="location.href='<%=contextPath%>/insertForm.no';">등록하기</button>
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
                            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>	
            
        </form>
	
            </div>
            <!-- #/ container -->
        </div>
        
	        <!-- 테이블 클릭 시 수정 페이지로 넘어가게 -->
        	<script>
	    		$(function(){
	    			
	    			$(".table>tbody>tr>td").not(".nonechk").click(function(){
	    				var nno = $(this).parent().children().eq(1).text();
	    				
	    				location.href="<%=contextPath%>/detail.ano?nno=" + nno;
	    				
	    			})
	 
	    		});
			</script>
                            
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

</body>
</html>