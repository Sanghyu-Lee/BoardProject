<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="<%=request.getContextPath()%>"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/css/custom.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<title>프로젝트</title>
</head>
<body>
	<header class="p-3 text-bg-dark">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="${path}/main.jsp"
						class="nav-link px-2 text-white">Home</a></li>
					<li><a href="${path}/getBoardList.do"
						class="nav-link px-2 text-white">자유게시판</a></li>
				</ul>

				<div class="text-end">
					<c:if test="${userNickName != null}">
						<span>${userNickName}님 환영합니다.</span>
						<button type="button" class="btn btn-outline-light me-2"
							onClick="location.href='${path}/logout.do'">로그아웃</button>
							<button type="button" class="btn btn-warning"
							onClick="location.href='${path}/user/userCheck.jsp'">회원수정</button>
					</c:if>
					<c:if test="${userNickName == null}">
							<button type="button" class="btn btn-outline-light me-2"
							onclick="location.href='${path}/user/login.jsp'">로그인</button>
							<button type="button" class="btn btn-warning"
							onClick="location.href='${path}/user/userRegister.jsp'">회원가입</button>
					</c:if>

				</div>
			</div>
		</div>
	</header>