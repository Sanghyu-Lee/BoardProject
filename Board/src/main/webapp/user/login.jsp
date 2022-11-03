<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>
<script>
	function check() {
		if(login.userID.value == ""){
			alert("아이디를 입력해주세요.");
			login.userID.focus();
			return false;
		}
		if(login.password.value == ""){
			alert("비밀번호를 입력해주세요.");
			login.userID.focus();
			return false;
		}
	}
</script>
<div class="container">
	<form action="${path}/login.do" method="post" id="login"
		onsubmit="return check()">
		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="padding-top: 20px; padding-bottom: 20px; text-align: center;"><h3>로그인</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="td1"><h5>아이디</h5></td>
					<td><input type="text" class="form-control" id="userID"
						name="userID" placeholder="아이디를 입력하세요." maxlength="20"></td>
				</tr>
				<tr>
					<td class="td1"><h5>비밀번호</h5></td>
					<td colspan="2"><input type="password" name="password"
						class="form-control" id="password" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn btn-secondary"
						value="로그인"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<%@ include file="../footer.jsp"%>