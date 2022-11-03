<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>

<div class="container">
	<div class="row">
		<form name="f1" action="${path}/insertBoard.do" method="post"
			enctype="multipart/form-data" onSubmit="return ck()">
			<input type="hidden" name="board_idx" value="${nextIdx}">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="2"
							style="background-color: #eeeeee; padding-top: 20px; padding-bottom: 20px; text-align: center;">
							자유게시판 글 쓰기</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="col-sm-1">제목</td>
						<td class="col-8"><input type="text" class="form-control"
							name="title" maxlength="50"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" name=content
								maxlength="2048" placeholder="내용을 입력하세요." style="height: 350px;"></textarea></td>
					</tr>
					<tr>
						<td class="col-sm-1">글쓴이</td>
						<td class="col-8"><input type="text" name="writer" class="form-control"
							value="${userNickName}"></td>
					</tr>
					<tr>
						<td><input type="file" name="uploadImage"></td>
					</tr>
				</tbody>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type=submit value="저장하기" class="btn btn-secondary">
			</div>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp"%>