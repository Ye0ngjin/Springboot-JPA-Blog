<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
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


					<c:forEach var="board" items="${boards.content}">

						<div>${board.id}
							<div class="title">
								<a class="tjfaud" onclick="" href="/board/${board.id}">${board.title}</a>
							</div>
							<div class="writer">${board.user.username}</div>
							<div class="date">
								<script>
									var createDate = new Date(
											"${board.createDate}");
									var formattedDate = createDate
											.getFullYear()
											+ "-"
											+ (createDate.getMonth() + 1)
											+ "-"
											+ createDate.getDate()
											+ " "
											+ createDate.getHours()
											+ ":"
											+ createDate.getMinutes();
									document.write(formattedDate);
								</script>
							</div>

							<div class="count">${board.count}</div>
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