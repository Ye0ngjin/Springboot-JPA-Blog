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



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script> -->
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>



<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!--   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mainpage.css">
<link rel="icon"
	href='data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90">👀</text></svg>'>
<style>
a {
	color: unset;
}

a:hover {
	text-decoration: none;
	color: unset;
}

h1 {
	display: block;
	font-size: 2em;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

img {
	vertical-align: unset;
	border-style: unset;
}

.form-control {
	height: calc(1.5em + 0.75rem + 10px);
}
</style>




</head>

<body>
	<header>
		<div id="logo">
			<a href="main">
				<h1>
					<img src="images/mainicon.png" style="width: 50px; padding: 5px;">Hide
					on <span class="text-rainbow">404</span>
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
						<a class="topbutton" href="/auth/joinForm"
							style="font-size: 12px;">회원가입</a>
					</c:when>
					<c:otherwise>
						<a class="topbutton" href="/user/updateForm">마이</a>
						<a class="topbutton" href="/logout" style="font-size: 12px;">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</header>

</body>

</html>