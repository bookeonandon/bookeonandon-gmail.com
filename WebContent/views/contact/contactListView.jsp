<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
	<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
	<title>memberSearchEmail</title>
	<script src="<%=request.getContextPath() %>/resources/plugins/common/common.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/settings.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/gleek.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/styleSwitcher.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body class="bodycolor">
<%@ include file="../common/menubar.jsp" %>
	
	  <div class="contact-body">

          
            <!-- row -->

            <div class="contactul">
                <ul class="nav testnav text-center">
                    <li class="nav-item contactnav"><a href="#question" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의하기</a>
                    </li>
                    <li class="nav-item contactnav"><a href="#questionlist" class="nav-link fontcolor" data-toggle="tab" aria-expanded="false">문의내역</a>
                    </li>
                    
                </ul>
                <div>

                        <div class="tab-content">
                            <div id="question" class="tab-pane">
                                
                                <div class="col-md-12">
                                    <form action="">
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label for="sel1" >&nbsp; 질문유형</label>
                                            <select class="form-control" id="sel1" value="contacttype">
                                                <option>----------------------------------------------------------------------------------</option>
                                                <option value="1">구독/서비스 이용문의</option>
                                                <option value="2">결제/취소/환불 문의</option>
                                                <option value="3">오류 문의</option>
                                                <option value="4">기타 문의</option>
                                                <option value="5">기타문의</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label>&nbsp; 제목</label>
                                            <input type="text" class="form-control bg-transparent" placeholder="제목을 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <span class="text-danger">*</span><label>&nbsp; 내용</label>
                                            <textarea class="textarea_editor form-control bg-light" rows="15" placeholder="내용을 입력해주세요"></textarea>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="btncenter">
                                <button type="submit" class="btn-primary btn contactbtn">문의하기</button>
                                </div>
                            </div>
                            <div id="questionlist" class="tab-pane active">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table class="table header-border table-hover text-center">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>날짜</th>
                                                    <th>질문유형</th>
                                                    <th>제목</th>
                                                    <th>처리상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox" name="contactcheck" value="1" class="css-control-input"></td>
                                                    <td>2020.02.01</td>
                                                    <td>기타문의</td>
                                                    <td>얄라리얄리얄라셩</td>
                                                    <td>답변완료</td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" name="contactcheck" value="2" class="css-control-input"></td>
                                                    <td>2020.02.09</td>
                                                    <td>이용문의</td>
                                                    <td>돈은 어떻게 내는거죠?</td>
                                                    <td>처리중</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" name="contactcheck" value="3" class="css-control-input"></td>
                                                    <td>2020.02.10</td>
                                                    <td>결제/취소/환불문의</td>
                                                    <td>구독권 환불해주세요</td>
                                                    <td>처리중</td>
                                                </tr>
                                            </tbody>    
                                        </table>
                                    </div>
                                    <div class="btncenter">
                                        <input type="button" value="삭제하기" class="btn btn-right" onclick="" >
                                        <input type="button" value="문의하기" class="btn btn-primary" onclick="" >
                                    </div>
                                </div>
                                
                            </div>
                        </div>       
                    </div>
                </div>
      
        </div>
      <%@ include file="../common/footer.jsp" %>
     
</body>
</html>