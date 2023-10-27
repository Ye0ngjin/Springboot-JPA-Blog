$(document).ready(function() {
	// 모달이 숨겨질 때 호출되는 이벤트 핸들러
	$('[id^="detailModal"]').on('hidden.bs.modal', function() {
		closeForm();
	});
});
function getBoardContent(boardId) {
  // AJAX 요청을 통해 해당 게시글의 내용을 서버로부터 받아옵니다.
  // 서버 요청을 처리하는 URL과 데이터 형식 등은 실제 환경에 맞게 수정해주셔야 합니다.
  // 아래의 예시는 GET 방식으로 요청하고, JSON 형식의 응답을 받는 것을 가정합니다.
  // 필요에 따라 요청 방식과 데이터 형식을 수정해주세요.
  $.ajax({
    url: '/recruitment/' + boardId,
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      // 서버로부터 받아온 내용을 모달에 표시합니다.
      $('#title-' + boardId).text(response.title);
      $('#content-' + boardId).val(response.content);
      $('#daterange-' + boardId).text(response.daterange);
      $('#limit_count-' + boardId).text(response.limit_count + '명');
    },
    error: function(xhr, status, error) {
      // 에러 처리 로직을 추가해주세요.
    }
  });
}

function closeForm() {
  // 모달이 닫히면 내용을 초기화합니다.
  $('[id^="title-"]').text('');
  $('[id^="content-"]').val('');
  $('[id^="daterange-"]').text('');
  $('[id^="limit_count-"]').text('');
}
  
function deleteForm(boardId) {
 let id = $("#id-" + boardId).text();
 
 $.ajax({ 
   type: "DELETE",
   url: "/api/recruitment/" + id,
   dataType: "json"
 }).done(function(resp){
   //alert("삭제가 완료되었습니다.");
   location.reload();
 }).fail(function(error){
   alert(JSON.stringify(error));
 });
}

 function updateForm(boardId) {
  $.ajax({
    url: '/recruitment/' + boardId,
    type: 'GET',
    dataType: 'json',
    success: function(response) {
      // 서버로부터 받아온 내용을 모달에 표시합니다.
      $("#updateTitle").val(response.title);
      $("#updateContent").val(response.content);
      $("#updateDaterange").val(response.daterange);
      $("#updateLimit_count").val(response.limit_count);

      // daterange 설정
      let startDate = moment(response.daterange.split(" ~ ")[0], "YYYY년 M월 D일");
      let endDate = moment(response.daterange.split(" ~ ")[1], "YYYY년 M월 D일");

      $('input[name="daterange"]').daterangepicker({
        "startDate": startDate,
        "endDate": endDate,
        "opens": 'center',
        "locale": {
          "format": "YYYY년 M월 D일",
          "separator": " ~ ",
          "applyLabel": "적용",
          "cancelLabel": "취소",
          "fromLabel": "시작일",
          "toLabel": "종료일",
          "customRangeLabel": "직접선택",
          "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
          "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        }
      });

      $("#id").val(boardId);
      $("#updateModal").modal("show");
    },
    error: function(xhr, status, error) {
      // 에러 처리 로직을 추가해주세요.
    }
  });
}



$(document).ready(function() {
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