<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>
<script>
	var path = '${pageContext.request.contextPath}';

	jQuery.ajaxSetup({
		cache : false
	});

	// ID 중복체크
	function idCheck() {
		var userID = $('#userID').val();

		$.ajax({
			type : 'POST',
			url : path + "/idCheck.do",
			data : {
				userID : userID
			},
			success : function(result) {
				if (result == 0) {
					alert('사용가능한 아이디입니다.');
				} else {
					alert('중복된 아이디입니다.');
				}
			}
		})
	} // 아이디 중복체크 끝

	function check() {
		if (register.userID.value == "") {
			alert("아이디를 입력해주세요.");
			register.userID.focus();
			return false;
		} else if (register.password.value == "") {
			alert("비밀번호를 입력해주세요.");
			register.password.focus();
			return false;
		} else if (register.userNickname.value == "") {
			alert("닉네임을 입력해주세요.");
			register.userNickname.focus();
			return false;
		} else if (register.email.value == "") {
			alert("이메일을 입력해주세요.");
			register.email.focus();
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
		style="padding-top: 20px; padding-bottom: 20px; text-align: center;">회원가입</h3>
	<form action="${path}/insertUser.do" method="post" id="register"
		onSubmit="return check()">
		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td class="td1"><h5>아이디</h5></td>
					<td><input type="text" class="form-control" id="userID"
						name="userID" placeholder="아이디를 입력하세요." maxlength="20"></td>
					<td><input type="button" class="btn btn-secondary"
						onClick="idCheck()" value="중복체크"></td>
				</tr>
				<tr>
					<td class="td1"><h5>비밀번호</h5></td>
					<td colspan="2"><input type="password" name="password"
						class="form-control" id="password1"
						onkeyup="passwordCheckFunction()" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td class="td1"><h5>비밀번호 확인</h5></td>
					<td colspan="2"><input type="password" class="form-control"
						id="password2" onkeyup="passwordCheckFunction()" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td class="td1"><h5>닉네임</h5></td>
					<td colspan="2"><input type="text" name="userNickname"
						class="form-control" id="userNickname"></td>
				</tr>
				<tr>
					<td class="td1"><h5>성별</h5></td>
					<td colspan="2">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="genderM" value="m" checked> <label
								class="form-check-label" for="inlineRadio1">남자</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="genderF" value="f"> <label class="form-check-label"
								for="inlineRadio2">여자</label>
						</div>
					</td>
				</tr>
				<tr>
					<td class="td1"><h5>이메일</h5></td>
					<td colspan="2"><input type="email" name="email"
						class="form-control" id="email"></td>
				</tr>
				<tr>
					<td colspan="3">
					<h6 style="color: red; text-align:left;" id="passwordCheckMessage"></h6>
					<input type="submit" class="btn btn-secondary" value="회원가입">
						</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<%@ include file="../footer.jsp"%>