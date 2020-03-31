<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">



<head>

<meta charset="UTF-8">

<title>회원탈퇴</title>

<style>
.body-content {
	width: 1100px;
	margin: auto;
}

#confirm-checkbox {
	width: 13px;
	height: 13px;
	padding: 0;
	margin: 0;
	vertical-align: bottom;
	position: relative;
	top: -1px;
	overflow: hidden;
}

.btn {
	text-align: center;
	vertical-align: middle;
	padding: 5px;
	font-size: 13px;
	line-height: 1.5;
	border-radius: .25rem;
}

#btn-cancel {
	background-color: white;
	border: 1px solid lightgrey;
}

#btn-del-acc {
	background-color: indianred;
	color: white;
	border: 1px solid lightgrey;
}
</style>

</head>



<body>

	<%@ include file="../common/menubar.jsp"%>

	<div class="body-content">
	
		<h2>회원 탈퇴 안내</h2>

		<dl>

			<h4 style="color: purple;">&emsp;회원탈퇴 전 안내 사항을 꼭 확인해주세요.</h4>

			<br>

			<h5>&emsp;사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h5>

			<h5>&emsp;탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</h5>

			<br>

			<h5>&emsp;보유한 BOOK E ON & ON 구독권이 자동 해지됩니다.</h5>

			<h5>&emsp;My 서제 사용이 불가능합니다.</h5>

			<h5>&emsp;구독권 및 소장하신 상품은 환불받을 수 없습니다.</h5>

			<br>

			<h5>&emsp;탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h5>

			<h5>&emsp;리뷰, MEET & ON 같은 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아
				있습니다.</h5>

			<h5>&emsp;삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</h5>

			<h5>&emsp;탈퇴 후 게시글 수정 및 삭제가 불가능합니다.</h5>

		</dl>

		<br> <br>

		<table style="text-align: center; margin: auto;">

			<tr>

				<td colspan="2"><input type="checkbox" id="confirm-checkbox" name="agree"><label
					style="font-size: 12px;">&nbsp;위 내용을 이해했으며, 모두 동의합니다.</label></td>

			</tr>

			<tr>

				<td style="width: 50%; text-align: right;"><button class="btn" type="button"
						id="btn-cancel" style="margin-top: 10px; width: 80%;" onclick="memberInfo();">취소</button>

				</td>

				<td style="width: 50%; text-align: left;"><button type="button" class="btn"
						id="btn-del-acc" style="margin-top: 10px; width: 80%;" onclick="memberDelete();">회원탈퇴</button></td>

			</tr>

		</table>
	
	</div>

	<br><br>

	<script>
		function memberInfo() {
			location.href = "<%=request.getContextPath()%>/myPageInfo.my";
		}
		
		function memberDelete() {
			if($("input:checkbox[name='agree']").is(":checked") == false) {
				alert("동의 필요");
			}else{
				location.href = "<%=request.getContextPath()%>/deleteMember.my";
			}
		}
	</script>

</body>



</html>