<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainTop.jsp"%>

<div class="container">
	<div class="row">
		<h3 style="padding-top: 20px;	padding-bottom: 20px;	text-align: center;">자유게시판</h3>
		<!-- 검색시작 -->
		<div class="text-end">
		<form action="getBoardList.do" method="post">
		<select name="searchCondition" id="searchCondition">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="searchKeyword" id="searchKeyword">
		</form>
		</div>
		<!-- 검색 끝 -->
		<hr>
		<!-- 글목록시작 -->
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th class="col-sm-2">번호</th>
					<th class="col-sm-4">제목</th>
					<th class="col-sm-2">작성자</th>
					<th class="col-sm-2">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr>
						<td>${board.board_Idx}</td>
						<td><a href="getBoard.do?board_Idx=${board.board_Idx}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 글목록 끝 -->
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<a href="${path}/insertView.do" class="btn btn-secondary">글쓰기</a>
	</div>
	<!-- 페이징 시작 -->
	<div align="center">
		<c:if test="${nowPage > 10}">
			<a href="${path}/getBoardList.do?pageNum=${pageListEnd-10}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pageListStart}" end="${pageListEnd}">
			<c:if test="${nowPage != i}">
				<a href="${path}/getBoardList.do?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">[${i}]</a>&nbsp;
		</c:if>

			<c:if test="${nowPage == i}">
				<span class="pageActive">[${i}]</span>&nbsp;
        </c:if>
		</c:forEach>
		<c:if test="${totalPage != pageListEnd}">
			<a href="${path}/getBoardList.do?pageNum=${pageListStart+10}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">다음</a>
		</c:if>
		<!-- 페이징 끝 -->
		<hr>
	</div>
</div>
<%@ include file="../footer.jsp"%>