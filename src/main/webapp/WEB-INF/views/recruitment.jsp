<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모집 페이지</title>

</head>
<body>
	<div id="container">
		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="row">

				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<div class="follow-card-body">


							<button
								style="height: 100%; width: 100%; min-height: 200px; font-size: 30px;"
								data-toggle="modal" href="#registerModal">+</button>




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
											data-toggle="modal" href="#detailModal${board.id}">자세히 보기</button>
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


		<%@ include file="footer.jsp"%>

	</div>



	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
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
					<form id="myForm" action="./evaluationRegisterAction.jsp"
						method="post" autocomplete="off">
						<div class="form-group">
							<label>모집 제목</label> <input id="title" type="text"
								name="evaluationTitle" class="form-control" maxlength="20">
						</div>
						<div class="form-group row">
							<div class="col-md-8">
								<label>모집 기한</label> <input id="daterange" class="form-control text-center"
									type="text" name="daterange"
									value="0000년 00월 00일 ~ 0000년 00월 00일" readonly>
							</div>
							<div class="col-md-4">
								<label>모집인원 (단위: 명)</label> <input id="limit_count"
									type="number" min="2" max="99" name="recruitmentCountInput"
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



<c:forEach var="board" items="${boards.content}">
	<div class="modal fade" id="detailModal${board.id}" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">${board.title}</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="resetForm()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="myForm" action="./evaluationRegisterAction.jsp"
						method="post" autocomplete="off">
						<div class="form-group">
							<label>내용</label>
							<textarea type="text" name="evaluationContent" id="content"
								class="form-control" maxlength="2048" style="height: 180px; background-color: unset;" readonly>${board.content}</textarea>
						</div>
						<div class="form-group row">
							<div class="col-md-8">
								<label>모집 기간</label> <div class="form-control">${board.daterange}</div>
							</div>
							<div class="col-md-4">
								<label>모집인원</label> <div class="form-control">${board.limit_count}명</div>
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<c:if test="${board.user.id == principal.user.id}">
							<a href="/recruitment/${board.id}/updateForm"
								class="btn btn-warning">수정</a>
							<button id="btn-delete" class="btn btn-danger">삭제</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>



	<script src="js/resize_height.js"></script>
	<script src="js/recruitment.js"></script>

	<script>
		$(document).ready(
				function() {
					$(function() {
						$('input[name="daterange"]').daterangepicker(
								{
									"startDate" : moment().startOf('day'),
									"endDate" : moment().startOf('day'),
									opens : 'center',
									locale : {
										format : "YYYY년 M월 D일",
										"separator" : " ~ ",
										"applyLabel" : "적용",
										"cancelLabel" : "취소",
										"fromLabel" : "시작일",
										"toLabel" : "종료일",
										"customRangeLabel" : "직접선택",
										"daysOfWeek" : [ "일", "월", "화", "수",
												"목", "금", "토" ],
										"monthNames" : [ "1월", "2월", "3월",
												"4월", "5월", "6월", "7월", "8월",
												"9월", "10월", "11월", "12월" ],
									}
								});
					});
					// 모달이 열렸을 때 ESC 키 이벤트를 감지하는 함수
					function handleKeyPress(event) {
						if (event.keyCode === 27) { // ESC 키의 keyCode는 27입니다.
							resetForm(); // resetForm() 함수 호출
						}
					}

					// 모달이 열릴 때 이벤트 리스너 추가
					$('#registerModal').on('shown.bs.modal', function() {
						$(document).on('keydown', handleKeyPress); // ESC 키 이벤트 리스너 추가
					});

					// 모달이 닫힐 때 이벤트 리스너 제거
					$('#registerModal').on('hidden.bs.modal', function() {
						$(document).off('keydown', handleKeyPress); // ESC 키 이벤트 리스너 제거
					});

				});

		function resetForm() {
			document.getElementById("myForm").reset();
			var today = moment().startOf('day');
			$('input[name="daterange"]').data('daterangepicker').setStartDate(
					today);
			$('input[name="daterange"]').data('daterangepicker').setEndDate(
					today);
		}
	</script>



</body>
</html>