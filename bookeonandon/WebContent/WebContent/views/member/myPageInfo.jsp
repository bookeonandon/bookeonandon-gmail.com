<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member"%>
<%
	Member mem = (Member) request.getAttribute("mem");

	String memberId = mem.getMemberId();
	String memberPwd = mem.getMemberPwd();
	String email = mem.getEmail();
	String nickname = mem.getNickname();
	String phone = mem.getPhone();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>My 정보</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
body {
	width: 1200px;
	margin: auto;
	padding:0px;
}

.body-content {
	width: 1100px;
	margin: auto;
	border: 1px solid purple;
	border-bottom-left-radius: 20px;
	border-top-left-radius: 20px;
	border-bottom-right-radius: 20px;
	border-top-right-radius: 20px;
}

tr {
	height: 50px;
}

th {
	width: 130px;
	padding-right: 10px;
	text-align: right;
}

.td-content {
	width: 250px;
	text-align: left;
}

.td-comment {
	width: 170px;
	text-align: left;
}

.button {
	text-align: center;
	margin: auto;
}

button {
	width: 120px;
	height: 35px;
	border-bottom-left-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
	margin-left: 5px;
	margin-right: 5px;
}

#confirm-password {
	visibility: hidden;
}
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<br>
	<div class="body-content">
		<table align="center">
			<tbody>
				<tr>
					<th>아이디 :</th>
					<td class="td-content"><%=memberId%></td>
					<td class="td-comment"></td>
					<th>휴대폰 :</th>
					<td class="td-content"><%=phone%></td>
					<td class="td-comment"></td>
				</tr>
				<tr>
					<th>닉네임 :</th>
					<td class="td-content"><%=nickname%></td>
					<td class="td-comment"></td>
					<th>이메일 :</th>
					<td class="td-content"><%=email%></td>
					<td class="td-comment"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br><br>
	<div class="button">
		<button onclick="memberDetail();">수정</button>
		<button onclick="updatePwd();">비밀번호 변경</button>
		<button onclick="deleteMember();">회원탈퇴</button>
	</div>
	<script>
		function deleteMember() {
			location.href = "<%=request.getContextPath()%>/myPageDelete.my";
		}
		
		function updatePwd() {
			location.href = "<%=request.getContextPath()%>/updatePwdForm.me";
		}
		
		function memberDetail() {
			location.href = "<%=request.getContextPath()%>/myPageDetail.my";
		}
	</script>
</body>

</html>