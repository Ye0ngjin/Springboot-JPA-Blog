<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mainpage.css">
<title>Hide on 404</title>
</head>

<body>
	<div id="container">
		<%@ include file="header.jsp"%>
		<div id="slideShow">
			<div id="slides">
				<img src="images/photo-1.jpg" alt style="display: block;"> <img
					src="images/photo-2.jpg" alt style="display: none;"> <img
					src="images/photo-3.jpg" alt style="display: none;">
				<button id="prev">&lang;</button>
				<button id="next">&rang;</button>
			</div>
		</div>

		<script src="js/main1.js"></script>

		<div class="board_wrap">

			<div class="board_title">
				<strong>404 커뮤니티</strong>
			</div>

			<div class="button1">
				<button style="font-size: 20px;">+</button>
			</div>

			<div class="board_write_wrap hide">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" placeholder="제목 입력">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용 입력"></textarea>
					</div>
				</div>
				<div class="bt_wrap">
					<a href="main" class="on">등록</a>
				</div>
			</div>
			<%--         ${name.get(0).content} --%>
			<div class="board_list_wrap">
				<div class="board_list">

					<%--                  <c:forEach var="board" items="${list}">
                     <p>${board.num} - ${board.user_id} - ${board.title}

                 </c:forEach> --%>

					<c:forEach var="board" items="${boards.content}">
						<div class="card m-2">
							<div class="card-body">
								<h4 class="card-title">${board.title}</h4>
								<a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
							</div>
						</div>
					</c:forEach>

					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${boards.first}">
								<li class="page-item disabled"><a class="page-link"
									href="?page=${boards.number-1}">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${boards.number-1}">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${boards.last}">
								<li class="page-item disabled"><a class="page-link"
									href="?page=${boards.number+1}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${boards.number+1}">Next</a></li>
							</c:otherwise>
						</c:choose>

					</ul>

				</div>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>

</html>