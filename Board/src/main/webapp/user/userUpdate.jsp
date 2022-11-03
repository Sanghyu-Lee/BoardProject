<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>
<script>
	function check() {
			if (update.userNickname.value == "") {
			alert("닉네임을 입력해주세요.");
			update.userNickname.focus();
			return false;
		} else if (update.email.value == "") {
			alert("이메일을 입력해주세요.");
			update.email.focus();
			return false;
		}
	}
	
	function passwordCheckFunction() {
		
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		
		if (password1 != password2) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}

	}
</script>
<div class="container">
	<h3
		style="padding-top: 20px; padding-bottom: 20px; text-align: center;">회원수정</h3>
	<form action="${path}/updateUser.do" method="post" id="update"
		onSubmit="return check()">
		<input type="hidden" name="userID" value="${user.userID}">
		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td class="td1"><h5>아이디</h5></td>
					<td>${user.userID}</td>
				</tr>
				<tr>
					<td class="td1"><h5>비밀번호</h5></td>
					<td colspan="2"><input type="password" name="password"
						class="form-control" id="password1" onkeyup="passwordCheckFunction()" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td class="td1"><h5>비밀번호 확인</h5></td>
					<td colspan="2"><input type="password" class="form-control"
						id="password2" onkeyup="passwordCheckFunction()" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td class="td1"><h5>닉네임</h5></td>
					<td colspan="2"><input type="text" name="userNickname"
						class="form-control" id="userNickname"
						value="${user.userNickname}"></td>
				</tr>
				<tr>
					<td class="td1"><h5>이메일</h5></td>
					<td colspan="2"><input type="email" name="email"
						class="form-control" id="email" value="${user.email}"></td>
				</tr>
				<tr>
				
					<td colspan="3">
					<h6 style="color: red; text-align:left;" id="passwordCheckMessage"></h6>
					<input type="submit" class="btn btn-secondary"
						value="회원가입"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<%@ include file="../footer.jsp"%>