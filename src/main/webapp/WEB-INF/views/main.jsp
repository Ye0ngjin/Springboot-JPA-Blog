<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    // 쿼리 파라미터 제거 및 URL 재구성(서머노트 글 작성시 ?files= 파라미터가 붙는 문제)
   	
	String currentServlet = request.getHttpServletMapping().getMatchValue();
	int lastSlashIndex = currentServlet.lastIndexOf('/');
	String result = currentServlet.substring(lastSlashIndex + 1);

    //System.out.println(result);
    String queryString = request.getQueryString();
    queryString = "?" + queryString;
	if (queryString != null && (queryString.contains("?files=") || queryString.contains("&files="))) {
		String currentURL = "/";
        currentURL += queryString;
        currentURL = currentURL.replaceAll("[?&]files=[^&]*", "");
        response.setHeader("Location", currentURL);
	    // response.setStatus(302);
	    response.sendRedirect(currentURL);
    }
        
	
%>

<%@ include file="./layout/header.jsp"%>
		<div id="slideShow">
			<div id="slides" style="width: 1200px;">
            	<img src="/images/1.png" style="display: block; height: 300px; width: unset; margin-left: 25%;">
            	<img src="/images/2.png" style="display: none; height: 300px; width: unset; margin-left: 25%;">
				<button id="prev">&lang;</button>
				<button id="next">&rang;</button>
			</div>
		</div>


		<div class="board_wrap">

			<div class="board_title">
				<strong>404 커뮤니티</strong>
			</div>


			<c:choose>
				<c:when test="${empty principal}">
					<div class="button2">
						<a style="font-size: 20px;" href="/loginForm"><button
								style="font-size: 20px;">+</button></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="button1">
						<button style="font-size: 20px;">+</button>
					</div>

					<div class="board_write_wrap hide">
						<form>
							<div class="board_write">
								<div class="title">
									<dl>
										<dt>제목</dt>
										<dd>
											<input type="text" id="title" placeholder="제목 입력">
										</dd>
									</dl>
								</div>
								<div class="cont">
									<textarea class="form-control summernote" rows="5" id="content"></textarea>
								</div>
							</div>
							<div class="bt_wrap">
								<!--                     <input type="hidden" name="sort" value="1"> -->
								<button id="btn-save" class="btn btn-secondary btn-sm">등록</button>

							</div>
						</form>
					</div>
				</c:otherwise>
			</c:choose>


			<div class="board_list_wrap">
				<div class="board_list">


					<c:forEach var="board" items="${boards.content}">
						<%-- 						<c:choose>
							<c:when test="${board.sort==1}"> --%>

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

							<%-- 							<div class="count">${board.count}</div> --%>
						</div>

						<%-- 							</c:when>
						</c:choose> --%>
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

<%@ include file="./layout/footer.jsp"%>
<script src="/js/main.js"></script>
<script src="/js/board.js"></script>
<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300
	});
</script>
</body>
</html>
