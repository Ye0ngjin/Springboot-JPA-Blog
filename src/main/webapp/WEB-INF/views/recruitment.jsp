<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>모집 페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>

  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <!--   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
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
<div id="container">
    <%@ include file = "header.jsp" %>
    <div class="container">
      <div class="row">

        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <div class="follow-card-body">


              <button style="height: 100%; width: 100%; font-size: 30px;" data-toggle="modal"
                href="#registerModal">+</button>




            </div>
          </div>
        </div>


        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <div class="card-body">
              <h4 class="card-title">독서 모임</h4>
              <div class="card-text">
                <ul>
                  <li>모집기한: ~ 00. 00. 00.</li>
                  <li>모집인원: 10명</li>
                  <li><span class="d-inline-block text-truncate" style="width: 100%;">Lorem ipsum dolor sit amet
                      consectetur adipisicing elit. Blanditiis, ut. Natus eius nobis voluptatem itaque, est reiciendis
                      explicabo doloremque nesciunt dolores debitis error voluptates rem ea similique nihil obcaecati
                      consequuntur.</span></li>
                </ul>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">자세히 보기</button>
                </div>
                <div>
                  <small class="text-muted mr-3">D-8</small>
                  <small class="text-muted">6/10</small>
                </div>
              </div>
            </div>
          </div>
        </div>


      </div>
    </div>


<%@ include file = "footer.jsp" %>

  </div>



  <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modal">모집 등록</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetForm()">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="myForm" action="./evaluationRegisterAction.jsp" method="post" autocomplete="off">
            <div class="form-group">
              <label>모집 제목</label>
              <input type="text" name="evaluationTitle" class="form-control" maxlength="20">
            </div>
            <div class="form-group row">
              <div class="col-md-8">
                <label>모집 기한</label>
                <input class="form-control text-center" type="text" name="daterange"
                  value="0000년 00월 00일 ~ 0000년 00월 00일" readonly>
              </div>
              <div class="col-md-4">
                <label>모집인원 (단위: 명)</label>
                <input type="number" min="2" max="99" name="recruitmentCountInput" class="form-control"
                  placeholder="인원수 선택" style="width: 100%;">
              </div>
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea type="text" name="evaluationContent" class="form-control" maxlength="2048"
                style="height: 180px;"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="resetForm()">취소</button>
              <button type="submit" class="btn btn-primary">등록하기</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>




  <script src="js/resize_height.js"></script>

  <script>
    $(document).ready(
      function () {
        $(function () {
          $('input[name="daterange"]').daterangepicker(
            {
              "startDate": moment().startOf('day'),
              "endDate": moment().startOf('day'),
              opens: 'center',
              locale: {
                format: "YYYY년 M월 D일",
                "separator": " ~ ",
                "applyLabel": "적용",
                "cancelLabel": "취소",
                "fromLabel": "시작일",
                "toLabel": "종료일",
                "customRangeLabel": "직접선택",
                "daysOfWeek": ["일", "월", "화", "수",
                  "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월",
                  "4월", "5월", "6월", "7월", "8월",
                  "9월", "10월", "11월", "12월"],
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
      $('input[name="daterange"]').data('daterangepicker').setStartDate(today);
      $('input[name="daterange"]').data('daterangepicker').setEndDate(today);
    }



  </script>



</body>
</html>