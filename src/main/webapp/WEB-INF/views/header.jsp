<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>Document</title>
</head>

<body>
	<header>
		<div id="logo">
			<a href="main">
				<h1>
					<img src="images/mainicon.png"
						style="width: 50px; padding: 5px;">Hide on <span
						class="text-rainbow">404</span>
				</h1>
			</a>
		</div>
		<nav>
			<ul id="topMenu">
				<li><a href="share">정보공유</a></li>
				<li><a href="recruitment">모집해요</a></li>
				<li><a href="vote">투표방</a></li>
				<li><a href="#">취업 200</a>
					<ul>
						<li><a href="https://www.jobkorea.co.kr/">사이트바로가기</a></li>
						<li><a href="#">추가 예정</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${empty principal}">
						<a class="topbutton" href="/auth/loginForm">로그인</a>
						<a class="topbutton" href="/auth/joinForm" style="font-size:12px;">회원가입</a>
					</c:when>
					<c:otherwise>
						<a class="topbutton" href="/user/updateForm">마이</a>
						<a class="topbutton" href="/logout" style="font-size:12px;">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</header>

</body>

</html>