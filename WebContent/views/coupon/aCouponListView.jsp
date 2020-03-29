<%@page import="com.kh.coupon.model.vo.Coupon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/admin/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	

        <div class="content-body">

            <div class="container-fluid">

            <!-- 컨텐츠 헤더 -->
                       
            <form class="content-form" action="insert.aco" method="POST">
                <span class="content-header"> 쿠폰관리 </span>
                <hr>

                <!-- 1. 쿠폰등록 -->
                <div class="content-header-inner">
                    <span> 쿠폰등록 </span>
                </div>
                
                <!-- 쿠폰등록폼 -->
                <div class="product-block">
                     <div class="product-inline">
                         <label for="coupon-name">쿠폰명</label>
                         <input type="text" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="coupon-name" name="name">
                     </div>
                     <div class="product-inline">
                         <label for="coupon-expdate">유효기간</label>
                         <input type="date" class="form-control col-md-8" placeholder="내용을 입력해주세요" id="coupon-expdate" name="expdate">
                     </div>
                </div>
                
                <div class="product-block">
                    <div class="product-inline">
                        <label for="coupon-price">할인가</label>
                        <input type="number" class="form-control col-md-8" placeholder="ex) 20" id="coupon-price" name="sale">
                    </div>
                    <div class="product-inline">
                        <label for="coupon-range">적용범위</label>
                        <input type="text" class="form-control col-md-8" placeholder="ex) 전체, 30000" id="coupon-range" name="range">
                    </div>
                </div>
                <div class="product-block">
                    <label for="coupon-contents">쿠폰내용</label>
                    <input type="text" class="form-control col-md-10" id="coupon-contents" name="content">
                </div>

                 <!-- 등록하기 버튼 -->
                <div class="btn-submit-top">
                    <button type="submit" class="btn mb-1 btn-primary btn-sm">등록하기</button>
                </div>

            </form>



	            <!-- 2. 쿠폰관리 -->
	
	            <form class="content-form" action="<%=contextPath%>/delete.aco" method="POST">
	                <div class="content-header-inner">
	                    <span> 쿠폰관리 </span>
	                </div>
	
	
                    <!-- 테이블 시작 -->
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered zero-configuration">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="checkall"></th>
                                    <th>쿠폰명</th>
                                    <th>쿠폰 내용</th>
                                    <th>적용기간</th>
                                    <th>할인가(%)</th>
                                    <th>적용범위</th>
                                    </tr>
                                </thead>
                            <tbody>
                            
                            <% if(list.isEmpty()) {%>
                          		<tr>
                                  <td colspan="6">존재하는 이벤트가 없습니다.</td>
                                </tr>
                            <% }else{ %>
                            
                              <% for(Coupon c : list){ %>
                                <tr>
                                    <td class="nonechk"><input type="checkbox" class="chk" name="chk" value="<%=c.getCouponNo() %>"></td>
                                    <td><%=c.getCouponName() %></td>
                                    <td width="40%" class="none-center"><%=c.getCouponContent() %></td>
                                    <td><%=c.getCouponExp() %></td>
                                    <td><%=c.getCouponSale() %>%</td>
                                    <%if(c.getCouponRange() == 0) {%>
                                    	<td>전체</td>
                                    <% }else{ %>
                                    <td><%=c.getCouponRange() %></td>
                                    <% } %>
                                </tr>
                            	<% } %>
                            
                            <% } %>
                            
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
                    
                    <!-- 삭제, 수정 버튼 -->
                        <div class="btn-submit-top">
                            <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target=".bd-example-modal-sm">삭제하기</button>
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
                            <button type="submit" class="btn btn-primary" onclick="<%=contextPath%>/delete.aco">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>
                        
	            </form>

            </div>
            <!-- #/ container -->
        </div>
        
       
        
			
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
        
        
</body>
</html>