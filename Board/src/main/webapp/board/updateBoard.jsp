<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>

<div class="container">
	<div class="row">
		<form name="f1" action="${path}/updateBoard.do" method="post"
			onSubmit="return ck()" enctype="multipart/form-data">
			<input type=hidden name=board_Idx value="${board.board_Idx}">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="2"
							style="background-color: #eeeeee; padding-top: 20px;	padding-bottom: 20px;	text-align: center;">글
							수정하기</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="td1">제목</td>
						<td><input type=text class="form-control" name=title
							value="${board.title}"></td>
					</tr>
					<tr>
						<td class="td1">글쓴이</td>
						<td>${board.writer}</td>
					</tr>
					<tr>
					<td>
					<c:if
							test="${image.uploadImageStr != null}">
							<img src="${path}/board/images/${image.uploadImageStr}" />
							<br>
							<br>
						</c:if></td>
					</tr>
					<tr>
						<td colspan="2">
						 <textarea class="form-control" name=content style="height: 350px;">${board.content}</textarea></td>
					</tr>
					<tr>
						<td><input type="file" name="uploadImage"></td>
					</tr>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=submit value="수정하기" class="btn btn-secondary"> <br>
			</div>
		</form>
		<hr width=80%>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="${path}/getBoardList.do" class="btn btn-secondary">글목록</a>
			<a href="${path}/deleteBoard.do?board_Idx=${board.board_Idx}"
				class="btn btn-secondary">글삭제</a>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>