<%@page import="com.kh.book.model.vo.Book"%>
<%@page import="com.kh.product.model.vo.Subscription"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	ArrayList<Subscription> list = (ArrayList<Subscription>)request.getAttribute("list");
	ArrayList<Book> bList = (ArrayList<Book>)request.getAttribute("bList");

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
            <form class="content-form" action="delete.asb" method="POST">
        
                <span class="content-header"> 상품관리 </span>
                <hr>

                <!-- 구독권 관리 -->
                <div class="content-header-inner">
                    <span> 구독권관리 </span>
                </div>

                        <!-- 테이블 시작 -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="checkall1"></th>
                                        <th>상품번호</th>
                                        <th>상품명</th>
                                        <th>상품 정보</th>
                                        <th>이용기간</th>
                                        <th>가격</th>
                                        </tr>
                                    </thead>
                                <tbody>
                                	<%if(list.isEmpty()){ %>
                                		<tr>
                                		<td colspan="6">조회된 구독권이 없습니다.</td>
                                		</tr>
                                	<% }else{ %>
                                		<%for (Subscription s : list){ %>
			                               	<tr>
		                                       <td class="nonechk"><input type="checkbox" class="chk" name="chk1" value="<%=s.getSbNo() %>"></td>
		                                       <td><%=s.getSbNo() %></td>
		                                       <td><%=s.getSbName() %></td>
		                                       <td width="40%" class="none-center"><%=s.getSbContent() %></td>
		                                       <td><%=s.getSbDate() %>일</td>
		                                       <td><%=s.getSbPrice() %></td>
			                                  </tr>       
                                		<% } %>
                                	<%} %>
                                                        
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
                                <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target=".bd-example-modal-sm2">삭제하기</button>
                                <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg">등록하기</button>
                            </div>
              
              
              <!-- 삭제하기 모달 -->   
              <div class="modal fade bd-example-modal-sm2" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">삭제하기</h5>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">삭제하시겠습니까?</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" >취소하기</button>
                            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-sm">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>	

            </form>
                   

            <!-- 도서 관리 -->
            <form class="content-form" action="<%=contextPath%>/delete.abk" method="POST">

                <div class="content-header-inner">
                    <span> 도서관리 </span>
                </div>
                

	                <!-- 테이블 시작 -->
	                <div class="table-responsive">
	                    <table class="table table-striped table-bordered zero-configuration booktable">
	                        <thead>
	                            <tr>
	                                <th><input type="checkbox" id="checkall2"></th>
	                                <th>도서번호</th>
	                                <th>도서명</th>
	                                <th>저자</th>
	                                <th>출판사</th>
	                                <th>출간일</th>
	                                <th>가격</th>
	                                <th>성인물</th>
	                                </tr>
	                            </thead>
	                        <tbody>
	                            <%if(bList.isEmpty()){ %>
	                        		<tr>
	                        		<td colspan="8">등록된 도서가 없습니다.</td>
	                        		</tr>
	                        	<% }else{ %>
	                        		<%for (Book b : bList){ %>
	                          	<tr>
	                                 <td class="nonechk"><input type="checkbox" class="chk" name="chk2" value="<%=b.getBookNo() %>"></td>
	                                 <td><%=b.getBookNo() %></td>
	                                 <td width="30%"><%=b.getTitle() %></td>
	                                 <td><%=b.getAuthor() %></td>
	                                 <td><%=b.getPublisher() %></td>
	                                 <td><%=b.getIssueDate() %></td>
	                                 <td><%=b.getPrice() %></td>
	                                 <td><%=b.getAdult() %></td>
	                           </tr>       
	                        		<% } %>
	                        	<%} %>                       
	                        </tbody>
	                   </table>
                           
                           
                      <script> 
                            $(document).ready(function(){
                                //최상단 체크박스 클릭
                                $("#checkall2").click(function(){
                                    //클릭되었으면
                                    if($("#checkall2").prop("checked")){
                                        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                                        $("input[name=chk2]").prop("checked",true);
                                        //클릭이 안되있으면
                                    }else{
                                        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                                        $("input[name=chk2]").prop("checked",false);
                                    }
                                })
                            })

                        </script>
                        </div>
                        <!-- 삭제, 수정, 등록 버튼 -->
                            <div class="btn-submit-top">
                                <button type="button" class="btn mb-1 btn-primary btn-sm" data-toggle="modal" data-target=".bd-example-modal-sm">삭제하기</button>
                                <button type="button" class="btn mb-1 btn-primary btn-sm" onclick="location.href='<%=contextPath%>/insertForm.abo'">등록하기</button>
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
        
        
       
        
       <!-- 구독권 상품등록 모달 -->

        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">구독권 상품등록</h3>
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                            </button>
                    </div>
                        <div class="modal-wrap">

                            <form action="insert.asb" method="POST">

                                <!-- 테이블 시작 -->
                                <div class="table-responsive">
                                    <div class="product-block">
                                        <div class="product-inline">
                                            <label for="subName">상품명</label>
                                            <input type="text" class="form-control col-md-7" placeholder="내용을 입력해주세요" id="book-name" name="subName">
                                        </div>
                                        <div class="product-inline">
                                            <label for="subPricer">가격</label>
                                            <input type="number" class="form-control col-md-7" placeholder="내용을 입력해주세요" id="subPrice" name="subPrice">
                                        </div>
                                    </div>
                                    <div class="product-block">
                                        <div class="product-inline">
                                            <label for="subDate">적용기간</label>
                                            <input type="number" class="form-control col-md-7" placeholder="ex)30, 60, 90" id="subDate" name="subDate">
                                        </div>
                                        <div class="product-inline">
                                            <label for="subContents">상품설명</label>
                                            <input type="text" class="form-control col-md-7" placeholder="내용을 입력해주세요" id="subContents" name="subContents">
                                        </div>
                                    </div>
                                </div>
                

                                <div class="modal-footer">
                                    <div class="btn-center">
                                    <button type="submit" class="btn btn-primary">등록하기</button>
                                    </div>
                                </div>
                        
                            </form>
                            </div>
                    </div>
                </div>


        </div>
        
	
	        <!-- 테이블 클릭 시 수정 페이지로 넘어가게 -->
        	<script>
	    		$(function(){
	    			
	    			$(".booktable>tbody>tr>td").not(".nonechk").click(function(){
	    				var bNo = $(this).parent().children().eq(1).text();
	    				
	    				location.href="<%=contextPath%>/updateForm.abk?bNo=" + bNo;
	    				
	    			})
	 
	    		});
			</script>
                            
	
	<%@ include file="../common/adminFooter.jsp" %>
	
	<script src="<%=contextPath %>/resources/admin/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="<%=contextPath %>/resources/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>
	
	
</body>
</html>