<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="com.kh.payment.model.vo.Payments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.PageInfo"%>
<%
   ArrayList<Payments> list = (ArrayList<Payments>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");

   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
   <%@ include file="../common/menubar.jsp"%>
   <br>
    <table class="table table-bordered">
        <thead style="background-color: lightgray;">
            <tr align="center">
                <th>구매일</th>
                <th>결제내역</th>
                <th>결제금액</th>
                <th>결제수단</th>
            </tr>
        </thead>
        <tbody>
           <% if(list.isEmpty()){ %>
           <tr>
              <td colspan="4" align="center">조회된 결제내역이 없습니다.</td>
           </tr>
           <% }else{ %>
              <% for(Payments p : list){ %>
            <tr>
                <td><%= p.getPayDate() %></td>
                <td><%= p.getTitle() %></td>
                <td><%= p.getPayPrice() %></td>
                <td><%= p.getPayType() %></td>
            </tr>
            <% } %>
            <% } %>
        </tbody>
    </table>
    
    <br><br>
    
    <div class="pagingArea" align="center">
       <button onclick="location.href='<%=contextPath%>/myPagePayment.my';">&lt;&lt;</button>
       <% if(currentPage ==1){%>
       <button disabled>&lt;</button>
       <% }else{ %>
       <button onclick="location.href='<%=contextPath%>/myPagePayment.my?currentPage=<%=currentPage-1%>';">&lt;</button>
       <% } %>
       <% for(int p=startPage; p<=endPage; p++){%>
          <%if(currentPage ==p){ %>
          <button disabled> <%=p%> </button>
          <%}else{%>
          <button onclick="location.href='<%=contextPath%>/myPagePayment.my?currentPage=<%=p%>';"><%=p%></button>
       <% } %>
       <% } %>
       <% if(currentPage == maxPage){%>
       <button disabled>&gt;</button>
       <% }else{ %>
       <button onclick="location.href='<%=contextPath%>/myPagePayment.my?currentPage=<%=currentPage+1%>';">&gt;</button>
       <% } %>
       <button onclick="location.href='<%=contextPath%>/myPagePayment.my?currentPage=<%=maxPage%>';">&gt;&gt;</button>
    </div>
</body>

</html>