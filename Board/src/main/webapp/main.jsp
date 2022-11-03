<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainTop.jsp"%>

<div class="container">
	<div class="jumbotron">
		<div class="container">
			<h1 style="padding-top:20px;">웹 사이트 소개</h1>
			<p>이 웹사이트는 익명의 사람들이 자유롭게 글을 작성하고 댓글을 달 수 있는 게시판입니다. 
			디자인 탬플릿으로 부트스트랩을 이용하였고 다음과 같은 기능이 구현되어 있습니다.</p>
			<ol>
				<li>회원가입, 로그인, 로그아웃, 회원정보수정 구현</li>
				<li>게시판 CRUD 구현</li>
				<li>게시판 페이징</li>
				<li>이미지 업로드 구현</li>
				<li>댓글작성, 삭제 구현</li>
			</ol>
			<p>개발환경</p>
			<ul>
				<li>언어 : Java(JDK 11), HTML/CSS, JavaScript</li>
				<li>서버 : Apache Tomcat 9.0</li>
				<li>프레임워크 : Spring Framework, Mybatis 3.3.1</li>
				<li>DB : Oracle XE 11g</li>
				<li>IDE : Eclipse 2022-06, Oracle SQL Developer</li>
			</ul>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>