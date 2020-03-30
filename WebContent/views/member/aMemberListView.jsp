<%@page import="com.kh.mysub.model.vo.MySub"%>
<%@page import="com.kh.product.model.vo.Subscription"%>
<%@page import="com.kh.coupon.model.vo.Coupon"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	ArrayList<Coupon> cList = (ArrayList<Coupon>)request.getAttribute("cList");
	ArrayList<Subscription> sList = (ArrayList<Subscription>)request.getAttribute("sList");
	
	MySub ms = (MySub)request.getAttribute("ms");
	

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

                
                
                <form class="content-form">
                    
                    <!-- 컨텐츠 헤더 -->
                    <span class="content-header"> 회원관리 </span>
                    <hr>

                        <!-- 테이블 시작 -->
                        <!-- 클릭 시 해당 테이블의 도서 상세로 넘어가게 하나? -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration member-table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkall"></th>
                                        <th>아이디</th>
                                        <th>성함</th>
                                        <th>이메일</th>
                                        <th>핸드폰번호</th>
                                        <th>가입일</th>
                                        <th>탈퇴일</th>
                                        <th>신고</th>
                                        <th>구독권</th>
                                        <th>블랙리스트</th>
                                        </tr>
                                    </thead>
                                <tbody>
                                <% if(list.isEmpty()){ %>
                                	<tr>
                                	<td colspan="10">등록된 회원이 없습니다.</td>
                                	</tr>
                                <% }else{ %>
                                    <% for (Member m :  list){ %>
                                    <tr>
                                        <td>
                                        <input type="checkbox" class="chk" name="chk" value="<%=m.getMemberId()%>">
                                        <input type ="hidden" value="<%=m.getMemberNo()%>"></td>
                                        <td width="10%"><%=m.getMemberId()%></td>
                                        <td><%=m.getMemberName()%></td>
                                        <td><%=m.getEmail()%></td>
                                        <td><%=m.getPhone()%></td>
                                        <td><%=m.getJoinDate()%></td>
                                        <td><%=m.getDeleteDate()%></td>
                                        <td class="report" data-toggle="modal" id="test" data-target=".bd-example-modal-lg" data-no="<%=m.getMemberNo()%>"><%=m.getReportTime()%></td>
                                        <td>
                                        <% if(m.getSbNo() != 0){ %>
                                        Y
                                        <% }else{ %>
                                        N
                                        <% } %>
                                        </td>
                                        <td><%=m.getBlacklistDate()%></td>
                                    </tr>
                                    <% } %>
                                <% } %>
                                </tbody>
                           </table>
                        </div>
                        
                        
                    <div class="btn-submit-bottom">
                    <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target="#basicModal3">쿠폰관리</button>
                    <button type="button" class="btn mb-1 btn-primary btn-sm" id="subManage">구독권관리</button>
                    <button type="button" id="black" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target="#basicModal">블랙리스트</button>
                </div>

            </form>
            



        <!--**********************************
            	모달 시작
        ***********************************-->

            <!-- 신고내역 모달 -->

            <div class="modal fade bd-example-modal-lg" id="report-modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">신고 내역</h3>
                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                </button>
                        </div>
                        
                        
                            <!--  리뷰 신고 모달 내용부 -->
                            <div class="modal-wrap">

                            <form>
                                <span class="modal-content-title"> 리뷰 신고 </span>
                                        <!-- 테이블 시작 -->
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered zero-configuration report-table">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>신고일자</th>
                                                        <th>리뷰내용</th>
                                                        <th>신고내역</th>
                                                        <th>신고자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
                                                </tbody>
                                                
                                                </table>
                                          
                                        </div>
                                   <!-- 삭제, 수정, 등록 버튼 -->
                                       <div class="btn-submit-top">
                                           <button type="button" class="btn mb-1 btn-primary btn-sm" id="review-delete">삭제하기</button>
                                       </div>
                
                            </form>

                             <div class="modal-footer">
                                 <div class="btn-center">
                                 <button type="button" class="btn btn-primary" data-dismiss="modal">확인하기</button>
                                 </div>
                             </div>
                         </div>
                            
                        </div>
                    </div>

                                          

            </div>

            <!-- 블랙리스트 모달 -->

            <div class="modal fade" id="basicModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">블랙리스트</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <!-- 만약 블랙리스트에 들어간 회원이라면 블랙리스트를 취소하시겠습니까? 뜨도록 -->
                        <div class="modal-body">[<span id="blackId"></span>]회원을 블랙리스트 처리하시겠습니까?<br>*처리 시 리뷰 작성이 제한됩니다.</div>
                        <div class="modal-footer">
                            <button type="button" id="blackSubmit" class="btn btn-primary none-center" data-dismiss="modal">확인하기</button>
                        </div>
                    </div>
                </div>
            </div>
            

			
			
            <!-- 구독권 모달 -->

            <div class="modal fade" id="basicModal2">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">구독권관리</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <span>기존 구독권</span>
                            <select class="form-control sub1" id="sel1" style="margin:15px 0px;">
                            	<%if(ms != null){ %>
                                <option value="<%= ms.getSbNo() %>">성공시 나옴</option>
                                <%} %>
                            </select>
                            
                            <span>수정할 구독권</span>
                            <select class="form-control sub2" id="sel1" style="margin:15px 0px;">
                                <%for (Subscription s : sList){ %>
                                <option value="<%=s.getSbNo()%>"><%=s.getSbName()%></option>
                                <% } %>
                            </select>
                            <br>
                            <span>* 적용 시 기존 구독일에서 기간이 연장됩니다.</span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary none-center" data-dismiss="modal">확인하기</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 쿠폰 모달 -->

            <div class="modal fade" id="basicModal3">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">쿠폰관리</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <!-- 만약 블랙리스트에 들어간 회원이라면 블랙리스트를 취소하시겠습니까? 뜨도록 -->
                        <div class="modal-body">
                            <span>적용할 쿠폰</span>
                            <select class="form-control selectCoupon" id="sel1" style="margin:15px 0px;">
                            	<%if(cList.isEmpty()){ %>
                            	<option value="none">등록된 쿠폰이 없습니다.</option>
                            	<%}else{ %>
	                            	<%for (Coupon c :  cList){ %>
	                                <option class="selectCoupon" value="<%=c.getCouponNo()%>"><%=c.getCouponName() %></option>
	                            	<% } %>
                            	<%} %>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary none-center" onclick="couponSubmit()" data-dismiss="modal">발급하기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
	
	</div>
	
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/js/adminMember.js"></script>
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
    
	

</body>
</html>