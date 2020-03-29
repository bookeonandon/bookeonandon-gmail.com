<%@page import="com.kh.payment.model.vo.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	ArrayList<Payment> bList = (ArrayList<Payment>)request.getAttribute("bList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath() %>/resources/admin/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	
	
	
		<div class="content-body">

            <!-- row -->

            <div class="container-fluid">

                <!-- 컨텐츠 헤더 -->
            <div class="content-form">
        
                <span class="content-header"> 정산내역 </span>
                <hr>


                <!-- 테이블 시작 -->

                <div class="col-md-12">
                    <!-- Nav tabs -->
                    <div class="custom-tab-1">
                        <ul class="nav nav-tabs mb-3">
                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#subscript">구독권</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#buy">소장하기</a>
                            </li>
                        </ul>

                        <!-- 구독권 탭 시작 -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="subscript" role="tabpanel">
                                <div class="p-t-15">

                                <form>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" id="checkall1"></th>
                                                    <th>아이디</th>
                                                    <th>성함</th>
                                                    <th>상품명</th>
                                                    <th>금액</th>
                                                    <th>주문일자</th>
                                                    <th>환불여부</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                	<%for (Payment p : list){ %>
                                                <tr>
                                                    <td class="nonechk"><input type="checkbox" class="chk" name="chk1"></td>
                                                    <td><%=p.getUserId() %></td>
                                                    <td><%=p.getUserName() %></td>
                                                    <td width="30%"><%=p.getSbName() %></td>
                                                    <td><%=p.getPayPrice() %>원</td>
                                                    <td><%=p.getSubPayDate() %></td>
                                                    <% if(p.getSubRefund().equalsIgnoreCase("y")){ %>
                                                    <td>Y</td>
                                                    <%}else{ %>
                                                    <td>N</td>
                                                    <% } %>
                                                </tr>
                                                    <% } %>
                                                
                                            </tbody>
                                       </table>
                                                
                                            
                                            <script> 
                                                $(document).ready(function(){
                                                    //최상단 체크박스 클릭
                                                    $("#checkall1").click(function(){
                                                        //클릭되었으면
                                                        if($("#checkall1").prop("checked")){
                                                            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                                                            $("input[name=chk1]").prop("checked",true);
                                                            //클릭이 안되있으면
                                                        }else{
                                                            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                                                            $("input[name=chk1]").prop("checked",false);
                                                        }
                                                    })
                                                })
                    
                                            </script>
                                    </div>
                                    
                                    <!-- 삭제, 수정, 등록 버튼 -->
                                        <div class="btn-submit-top">
                                            <button type="button" class="btn mb-1 btn-primary btn-sm" onclick="">환불하기</button>
                                        </div>
                    
                                </form>

                                </div>
                            </div>

                    <!-- 소장하기 탭 시작 -->
                    <div class="tab-pane fade" id="buy">
                        <div class="p-t-15">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="subscript" role="tabpanel">
                                <div class="p-t-15">

                                
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th>주문번호</th>
                                                    <th>아이디</th>
                                                    <th>성함</th>
                                                    <th>상품명</th>
                                                    <th>금액</th>
                                                    <th>주문일자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                               <%for (Payment p : bList){ %>
                                                <tr>
                                                	<td><%=p.getSubPayNo() %></td>
                                                    <td><%=p.getUserId() %></td>
                                                    <td><%=p.getUserName() %></td>
                                                    <td width="30%"><%=p.getbName() %></td>
                                                    <td><%=p.getPayPrice() %>원</td>
                                                    <td><%=p.getSubPayDate() %></td>
                                                </tr>
                                                    <% } %>
                                            </tbody>
                                       </table>
                                    </div>
                    
                                </div>

                                </div>
                            </div>


                                </div>
                            </div>
                        </div>
                </div>
            
            </div>


            </div>
            <!-- #/ container -->
        </div>
        </div>
	
	
	        
                            
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

</body>
</html>