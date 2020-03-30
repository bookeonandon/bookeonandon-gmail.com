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
	padding: 0px;
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
</style>
</head>

<body>
	<%@ include file="../common/menubar.jsp"%>
	<br>
	<form method="post"
		action="<%=request.getContextPath()%>/myPageUpdate.my">
		<div class="body-content">
			<table align="center">
				<tbody>
					<tr>
						<th>아이디 :</th>
						<td class="td-content"><input type="text" name="memberId" value="<%=memberId%>" readonly></td>
						<td class="td-comment"></td>
						<th>휴대폰 :</th>
						<td class="td-content"><input type="text" name="phone" value="<%=phone%>" required></td>
						<td class="td-comment"></td>
					</tr>
					<tr>
						<th>닉네임 :</th>
						<td class="td-content"><input type="text" name="nickname" value="<%=nickname%>" required></td>
						<td class="td-comment"></td>
						<th>이메일 :</th>
						<td class="td-content"><input type="email" name="email" value="<%=email%>" required></td>
						<td class="td-comment"></td>
					</tr>
				</tbody>
			</table>

		</div>
		<br>
		<br>
		<div class="button">
			<button type="submit">저장</button>
			<button type="button" onclick="memberInfo();">취소</button>
			<button type="button" onclick="deleteMember();">회원탈퇴</button>
		</div>
	</form>
	<script>
		function deleteMember() {
			location.href = "<%=request.getContextPath()%>/myPageDelete.my";
		}
		
		function memberInfo() {
			location.href = "<%=request.getContextPath()%>/myPageInfo.my";
		}
	</script>
</body>

</html>