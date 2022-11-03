<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>
<script>
	var path = '${pageContext.request.contextPath}';

	jQuery.ajaxSetup({
		cache : false
	});

	// 댓글 작성
	$().ready(
			function() {
				$('#saveReply').click(
						function() {

							var dataStr = {
								board_Idx : $('#board_Idx').val(),
								replyer : $('#replyer').val(),
								reply : $('#reply').val()
							};

							$.ajax({
								type : "POST",
								url : path + "/insertReply.do",
								data : dataStr,
								success : function(data) {
									location.replace(path
											+ "/getBoard.do?board_Idx="
											+ $('#board_Idx').val())
								}
							})
						})
			})

	// 댓글 삭제 
	$().ready(
			function() {
				$('#deleteReply').click(
						function() {

							var dataStr = {
								board_Idx : $('#board_Idx').val(),
								reply_Idx : $('#reply_Idx').val()
							};

							$.ajax({
								type : "POST",
								url : path + "/deleteReply.do",
								data : dataStr,
								success : function(data) {
									location.replace(path
											+ "/getBoard.do?board_Idx="
											+ $('#board_Idx').val())
								}
							})
						})
			})
</script>
<div class="container">
	<div class="row">
		<!-- 글 상세보기 구현시작 -->
		<table class="table table-striped" style="border: 1px solid #dddddd">
			<thead>
				<tr>
					<td colspan="2"
						style="padding-top: 20px; padding-bottom: 20px; text-align: center;"><h3>자유게시판</h3></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h5>${board.title}</h5></td>
				</tr>
				<tr>
					<td style="font-size: 13px;">${board.writer}&nbsp;|&nbsp;<fmt:formatDate
							value="${board.regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
				</tr>
				<tr>
					<td colspan="2" style="min-height: 400px;"><c:if
							test="${image.uploadImageStr != null}">
							<img src="${path}/board/images/${image.uploadImageStr}" />
							<br>
							<br>
						</c:if> ${board.content}</td>
				</tr>
			</tbody>
		</table>
		<!-- 글 상세보기 끝 -->
		<!-- 댓글작성란 시작 -->
		<input type="hidden" name="board_Idx" id="board_Idx"
			value="${board.board_Idx}">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td class="col-sm-2"><input type="text" class="form-control"
					name="replyer" id="replyer" value="${userNickName}"></td>
				<td colspan="2"><textarea class="form-control" name="reply"
						id="reply" maxlength="2048" placeholder="내용을 입력하세요."></textarea></td>
			</tr>
			<tr>
				<td class="td1" colspan="2"><button id="saveReply"
						class="btn btn-secondary">댓글쓰기</button></td>
			</tr>
		</table>
		<!-- 댓글작성란 끝 -->
		<hr width=80%>
		<!-- 댓글보기란 시작 -->
		<h5>댓글</h5>
		<c:forEach items="${replyList}" var="reply">
			<table class="table table-striped"
				style="font-size: 12px; border: 1px solid #dddddd">
				<tr>
					<td>${reply.replyer}&nbsp;|&nbsp;<fmt:formatDate
							value="${reply.replyDate}" pattern="yyyy-MM-dd hh:mm:ss" />
					</td>
				</tr>
				<tr>
					<td>${reply.reply}
						<div class="text-end">
							<input type="hidden" name="reply_Idx" id="reply_Idx"
								value="${reply.reply_Idx}">
							<button id="deleteReply">삭제</button>
						</div>
					</td>
				</tr>
			</table>
		</c:forEach>
		<!-- 댓글보기란 끝 -->
		<hr width=80%>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="${path}/updateView.do?board_Idx=${board.board_Idx}"
				class="btn btn-secondary">수정하기</a> <a href="${path}/getBoardList.do"
				class="btn btn-secondary">목록보기</a> <a
				href="${path}/deleteBoard.do?board_Idx=${board.board_Idx}"
				class="btn btn-secondary">삭제하기</a>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>