<%@page import="com.kh.mysub.model.vo.MySub"%>
<%@page import="com.kh.myCoupon.model.vo.MyCoupon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
	MySub ms = (MySub)request.getAttribute("ms");
	ArrayList<MyCoupon> list = (ArrayList<MyCoupon>)request.getAttribute("list");
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
	
	
	<!--**********************************
            내용 시작
        ***********************************-->

	<div class="content-body">

            <!-- row -->

            <div class="container-fluid">

                <!-- 컨텐츠 헤더 -->
                <div class="form-validation">
                    <form class="content-form" action="#" method="post">
                
                <span class="content-header"> 회원 상세페이지 </span>
                <hr>

                <!-- 테이블 시작 -->
                <div class="product-block">
                    <label for="userId">회원아이디</label>
                    <input type="text" class="form-control col-md-2" id="userid" name="userid" value="<%=m.getMemberId() %>" disabled>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="username">회원명</label>
                        <input type="text" class="form-control col-md-8" id="username" name="username" value="<%=m.getMemberName() %>">
                    </div>
                    <div class="product-inline">
                        <label for="nickname">닉네임</label>
                        <input type="text" class="form-control col-md-8" id="nickname" name="nickname" value="<%=m.getNickname() %>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="email">이메일</label>
                        <input type="email" class="form-control col-md-8" id="email" name="email" value="<%=m.getEmail() %>">
                    </div>
                    <div class="product-inline">
                        <label for="birthday">생년월일</label>
                        <input type="date" class="form-control col-md-8" id="birthday" name="birthday" value="<%=m.getBirth() %>">
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="phone">핸드폰번호</label>
                        <input type="text" class="form-control col-md-8" id="phone" name="phone" value="<%=m.getPhone() %>">
                    </div>
                    <div class="product-inline">
                        <label for="joindate">회원가입일</label>
                        <input type="date" class="form-control col-md-8" id="joindate" name="joindate" value="<%=m.getJoinDate() %>" disabled>
                    </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label for="blacklistdate" style="color:red;">블랙리스트일자</label>
                        <input type="date" class="form-control col-md-8" id="blacklistdate" name="blacklistdate" value="<%=m.getBlacklistDate() %>" disabled>
                    </div>
                    <div class="product-inline">
                        <label for="deldate">탈퇴일자</label>
                        <input type="date" class="form-control col-md-8" id="deldate" name="deldate" value="<%=m.getDeleteDate() %>" disabled>
                    </div>
                </div>
                <div class="product-block">
                    <label>밋앤온 리스트</label>
                        <div class="product-inline product-half" style="width:869px;">
                        <ul>
                          <li class="list-li">소모임소모임소모임</li>
                          <li class="list-li">자바의정석소모임소모임소모임</li>
                          <li class="list-li">자바의정석소모임소모임소모임</li>
                          <li class="list-li">자바의정석소모임소모임소모임</li>
                        </ul>
                        </div>
                </div>
                <div class="product-block">
                    <div class="product-inline">
                        <label>보유 구독권</label>
                            <div class="product-half" style="width:346px;">
                                <ul>
                                <%if(ms == null){ %>
                                <li class="list-li">보유구독권이 없습니다.</li>
                                <%}else{ %>
                                    <li class="list-li"><%=ms.getSbName() %> I <%= ms.getSbEnd() %>까지</li>
                                <%} %>
                                </ul>
                            </div>
                    </div>
                    
                 <div class="product-inline">
                        <label>보유 쿠폰</label>
                            <div class="product-half" style="width:346px;">
                                <ul>
                                <%if(list.isEmpty()){ %>
                                <li class="list-li">보유한 쿠폰이 없습니다.</li>
                                <%}else{ %>
                                   <%for (MyCoupon mc :  list){ %>
                                    <li class="list-li"><%=mc.getcName() %> I <%=mc.getcLast() %>까지 </li>
                                    <% } %>
                                <%} %>
                                </ul>
                            </div>
                    </div>
                
                   
                   
                </div>
                

                        <div class="form-group row">
                            <div class="col-lg-8 ml-auto">
                                <button type="submit" class="btn btn-primary">수정하기</button>
                            </div>
                        </div>
                    </form>
                </div>

    

            </div>
        
       </div>
       
       
     	<%@ include file="../common/adminFooter.jsp" %>
            
   	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
            
</body>
</html>