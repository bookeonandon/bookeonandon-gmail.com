<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.myCoupon.model.vo.MyCoupon"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<MyCoupon> couponList = (ArrayList<MyCoupon>)request.getAttribute("couponList");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>My 계정</title>
  <style>
    body {
      width: 1200px;
      margin: auto;
      padding: 0px;
    }

    .body-content {
      width: 1100px;
      margin: auto;
      padding: 0px;
      margin-bottom: 40px;
    }

    .table-main {
      width: 100%;
    }

    .content {
      width: 520px;
      height: 250px;
      border: 1px solid purple;
      border-bottom-left-radius: 20px;
      border-top-left-radius: 20px;
      border-bottom-right-radius: 20px;
      border-top-right-radius: 20px;
      margin: 0px;
      padding: 0px;
    }

    fieldset>legend {
      margin-left: 30px;
      font-size: 16px;
      padding-left: 5px;
      padding-right: 5px;
    }

    fieldset>div {
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 10px;
      margin-right: 10px;
    }

    .table-sub {
      width: 100%;
      border-collapse: collapse !important
    }

    .table-sub td, .table-sub th {
      padding: .25rem;
      vertical-align: top;
      border: 1px solid #dee2e6
    }

    .table-sub thead th {
      vertical-align: bottom;
      border-bottom: 3px solid #dee2e6;
      border-top: 0px;
      border-right: 0px;
      border-left: 0px;
    }

    .table-sub tbody tr:hover {
      color: #212529;
      background-color: rgba(0, 0, 0, .075)
    }

    
  </style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
  <br>
  <div class="body-content">
    <table class="table-main">
      <tr>
        <td>
          <fieldset class="content">
            <legend>My 소모임</legend>
            <div>
              <table class="table-sub">
                <thead>
                  <tr>
                    <th>방번호</th>
                    <th>방이름</th>
                    <th>장르</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>200506</td>
                    <td>자바공부방</td>
                    <td>호러</td>
                  </tr>
                </tbody>
                
              </table>
            </div>
          </fieldset>
        </td>
        <td style="width: 40px;"></td>
        <td>
          <fieldset class="content">
            <legend>My 쿠폰</legend>
            <div>
              <table class="table-sub">
                <thead>
                  <tr>
                    <th>쿠폰명</th>
                    <th>이용시작일</th>
                    <th>만료일자</th>
                    <th>적용범위</th>
                  </tr>
                </thead>
                <tbody>
                  <% if(couponList.isEmpty() || couponList == null){ %>
        	<tr>
        		<td colspan="4" align="center">조회된 쿠폰이 없습니다.</td>
        	</tr>
        	<% }else{ %>
        		<% for(MyCoupon c : couponList){ %>
            <tr>
                <td><%= c.getcName() %></td>
                <td><%= c.getcStart() %></td>
                <td><%= c.getcLast() %></td>
                <td><%= c.getcRange() %></td>
            </tr>
            <% } %>
            <% } %>
                </tbody>
              </table>
            </div>
          </fieldset>
        </td>
      </tr>
      <tr>
        <td colspan="3" style="height: 30px;"></td>
      </tr>
      <tr>
        <td>
          <fieldset class="content">
            <legend>My 리뷰</legend>
            <div>
              <table class="table-sub">
                <thead>
                  <tr>
                    <th>도서명</th>
                    <th>리뷰내용</th>
                    <th>리뷰작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>자바의정석</td>
                    <td>모니터받침^^</td>
                    <td>2020/02/02</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </fieldset>
        </td>
        <td></td>
        <td>
          <fieldset class="content">
            <legend>My 문의</legend>
            <div>
              <table class="table-sub">
                <thead>
                  <tr>
                    <th>문의번호</th>
                    <th>문의제목</th>
                    <th>문의일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>001213</td>
                    <td>환불되나요?</td>
                    <td>2020/01/11</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </fieldset>
        </td>
      </tr>
    </table>
  </div>
<%@ include file="../common/footer.jsp" %>
</body>


</html>