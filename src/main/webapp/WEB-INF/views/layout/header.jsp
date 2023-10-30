<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%
String httpHost = request.getServerName();
int httpPort = request.getServerPort();
/*
String httpPath = request.getRequestURI();
if (httpHost.equals("localhost")||httpHost.equals("127.0.0.1")) {
	System.out.println(httpHost);
	System.out.println(httpPort);
	System.out.println(httpPath);
*/
if (httpHost.equals("146.56.102.203")) {
%>
<script>
    location.href = "http://hideon.online";
</script>
<%
}
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
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
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/mainpage.css">
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

<%
String currentURI = request.getRequestURI();
//String pageName = request.getServletPath();
String pageName = currentURI.substring(currentURI.lastIndexOf("/") + 1);
int dotIndex = pageName.lastIndexOf(".");
if (dotIndex != -1) {
	pageName = pageName.substring(0, dotIndex); // .jsp 확장자 제거
}
%>
<c:set var="pageName" value="<%=pageName%>" />
<c:choose>
<c:when test="${pageName == 'main'}">
<title>Hide on 404 - 메인 페이지</title>
</c:when>
<c:when test="${pageName == 'recruitment'}">
<title>Hide on 404 - 모집 페이지</title>
<style>
.card-text {
	font-size: 0.9rem;
}
</style>
</c:when>
<c:when test="${pageName == 'vote'}">
<title>Hide on 404 - 투표 페이지</title>
<link rel="stylesheet" href="css/vote.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</c:when>
<c:when test="${pageName == 'detail'}">
<title>Hide on 404 - 게시글 상세 페이지</title>
</c:when>
<c:when test="${pageName == 'share'}">
<title>Hide on 404 - 정보 공유 페이지</title>
<link rel="stylesheet" href="/css/share.css">
</c:when>
<c:when test="${pageName == 'joinForm'}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
</c:when>
<c:otherwise>
<title>Hide on 404</title>
</c:otherwise>
</c:choose>

</head>
<body>
<%-- JSP 페이지 상단 부분 --%>
<%
String alertMessage = (String) session.getAttribute("alert_message");
Integer closeTimeout = (Integer) session.getAttribute("close_timeout");
if (alertMessage != null && !alertMessage.equals("null")) {
%>
<%-- 23.10.27 현재 알림창 자동으로 닫는게 안되고 있다 --%>
<script>
    var alertMessage = "<%= alertMessage %>";
<% session.removeAttribute("alert_message");%>
    
    var popupWindow = window.open('', '_self'); // 현재 창을 다시 열기
    popupWindow.alert(alertMessage);

<%if (closeTimeout != null && !closeTimeout.equals(0)) {%>
    var closeTimeout = <%= closeTimeout %>;
<% session.removeAttribute("close_timeout");%>

    setTimeout(function() {
    <%-- 메시지를 표시한 후 세션에서 제거 --%>
        // 알림창을 닫음
    	popupWindow.close(); // 팝업 창을 닫기
    }, closeTimeout);
<%}%>
</script>
<%
}
%>

	<div id="container">

		<header>
			<div id="logo">
				<a href="/">
					<h1>
						<img src="/images/mainicon.png" style="width: 50px; padding: 5px;">Hide
						on <span class="text-rainbow">404</span>
					</h1>
				</a>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="/share" id="shareEffect">정보공유</a></li>
					<li><a href="/recruitment" id="recruitEffect">모집해요</a></li>
					<li><a href="/vote" id="voteEffect">투표방</a></li>
					<li><a href="#">취업 200</a>
						<ul>
							<li><a href="#">사이트바로가기</a></li>
							<li><a href="#">추가 예정</a></li>
						</ul></li>

					<c:choose>
						<c:when test="${empty principal}">
							<a class="topbutton" href="/loginForm">로그인</a>
							<a class="topbutton" href="/joinForm" style="font-size: 12px;">회원가입</a>
						</c:when>
						<c:otherwise>
							<a class="topbutton" href="/user/updateForm">마이</a>
							<a class="topbutton" href="/logout" style="font-size: 12px;">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>

		<script src="/js/header.js"></script>