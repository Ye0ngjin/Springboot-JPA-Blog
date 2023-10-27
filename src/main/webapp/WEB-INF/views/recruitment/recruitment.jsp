<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
		<div class="container">
			<div class="row">

				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div class="follow-card-body">


							<button
								style="height: 100%; width: 100%; min-height: 200px; font-size: 30px;"
								data-toggle="modal" data-target="#registerModal"
								onclick="resetForm()">+</button>


						</div>
					</div>
				</div>
				<c:forEach var="board" items="${boards.content}">


					<div class="col-md-4">


						<div class="card mb-4 shadow-sm">
							<div class="card-body">
								<h4 class="card-title">${board.title}</h4>
								<div class="card-text">
									<ul>
										<li>모집기한: ${board.daterange}</li>
										<li>모집인원: ${board.limit_count}명</li>
										<li><span class="d-inline-block text-truncate"
											style="width: 100%;">${board.content}</span></li>
									</ul>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary"
											data-toggle="modal" data-target="#detailModal${board.id}"
											data-id="${board.id}" onclick="getBoardContent(${board.id})">자세히
											보기</button>
									</div>
									<div>
										<small class="text-muted mr-3">${dday}</small> <small
											class="text-muted">${board.is_end}</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>

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


<%@ include file="../layout/footer.jsp"%>



<!-- 모집 글 작성 모달 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
	aria-labelledby="modal" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">모집 등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="resetForm()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="myForm" autocomplete="off">
					<div class="form-group">
						<label>모집 제목</label> <input id="title" type="text"
							name="evaluationTitle" class="form-control" maxlength="20">
					</div>
					<div class="form-group row">
						<div class="col-md-8">
							<label>모집 기한</label> <input id="daterange"
								class="form-control text-center" type="text" name="daterange"
								readonly>
						</div>
						<div class="col-md-4">
							<label>모집인원 (단위: 명)</label> <input id="limit_count"
								type="number" min="1" max="99" name="recruitmentCountInput"
								class="form-control" placeholder="인원수 선택" style="width: 100%;">
						</div>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea type="text" name="evaluationContent" id="content"
							class="form-control" maxlength="2048" style="height: 180px;"></textarea>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="resetForm()">취소</button>
					<button id="btn-save" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 모집 글 상세페이지 모달 -->
<c:forEach var="board" items="${boards.content}">
	<div class="modal fade" id="detailModal${board.id}" tabindex="-1"
		role="dialog" aria-labelledby="modal" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="align-items: flex-end;">
					<h5 class="modal-title" id="title-${board.id}"></h5>
					<c:if test="${board.updated_at != null}">
						<small class="text-muted ml-2">(수정됨)</small>
					</c:if>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="closeForm()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label>내용</label>
							<textarea type="text" name="evaluationContent"
								id="content-${board.id}" class="form-control" maxlength="2048"
								style="height: 180px; background-color: unset;" readonly></textarea>
						</div>
						<div class="form-group row">
							<div class="col-md-8">
								<label>모집 기간</label>
								<div id="daterange-${board.id}" class="form-control"></div>
							</div>
							<div class="col-md-4">
								<label>모집인원</label>
								<div id="limit_count-${board.id}" class="form-control"></div>
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<c:if test="${board.user.id == principal.user.id}">
							<span id="id-${board.id}" style="display: none;">${board.id}</span>
							<button id="btn-updateForm-${board.id}" class="btn btn-warning"
								data-dismiss="modal" aria-label="Close"
								onclick="updateForm('${board.id}'<%-- , '${board.title}', '${board.content}', '${board.limit_count}', '${board.daterange}' --%>)">수정</button>
							<button id="btn-delete-${board.id}" class="btn btn-danger"
								onclick="deleteForm('${board.id}')">삭제</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>



<!-- 모집 글 수정 모달 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
	aria-labelledby="modal" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">모집 글 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form autocomplete="off">
					<div class="form-group">
						<label>모집 제목</label> <input id="updateTitle" type="text"
							name="evaluationTitle" class="form-control" maxlength="20">
					</div>
					<div class="form-group row">
						<div class="col-md-8">
							<label>모집 기한</label> <input id="updateDaterange"
								class="form-control text-center" type="text" name="daterange"
								readonly>
						</div>
						<div class="col-md-4">
							<label>모집인원 (단위: 명)</label> <input id="updateLimit_count"
								type="number" min="1" max="99" name="recruitmentCountInput"
								class="form-control" placeholder="인원수 선택" style="width: 100%;">
						</div>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea type="text" name="evaluationContent" id="updateContent"
							class="form-control" maxlength="2048" style="height: 180px;"></textarea>
					</div>
				</form>
				<div class="modal-footer">
					<span id="id" style="display: none;"></span>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="btn-update" class="btn btn-primary">수정완료</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="/js/recruitment_modal.js"></script>
<script src="/js/resize_height.js"></script>
<script src="/js/recruitment.js"></script>
</body>
</html>