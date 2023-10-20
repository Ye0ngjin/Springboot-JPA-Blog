// + 버튼으로 투표글 추가하기
window.addEventListener('DOMContentLoaded', () => {
  const buttons = document.querySelectorAll('.button button');
  const writeWraps = document.querySelectorAll('.addChoice');
  buttons.forEach((button, index) => {
      button.addEventListener('click', () => {
          writeWraps[index].classList.toggle('hide');
          if (button.textContent === '+') {
              button.textContent = '-';
          } else {
              button.textContent = '+';
          }
      });
  });
});

// 수정창 껏다켰다
window.addEventListener('DOMContentLoaded', () => {
  const btn = document.querySelectorAll('.editBtn');
  const writeForm = document.querySelectorAll('.editChoice');
  btn.forEach((editBtn, index) => {
      editBtn.addEventListener('click', () => {
          writeForm[index].classList.toggle('hide');
      });
	});
});

// 연필 누르면 X로 바뀌고, 또누르면 다시 연필로 바뀜
  $(".imgtoggle").click(function() {
    var arrowImage = $(this).children("span").children("img");
    arrowImage.attr("src", function(index, attr){
      if (attr.match('open')) {
        return attr.replace("open", "close");
      }
      else {
        return attr.replace("close", "open");
      }
    });
  }
);
 /* 
function CheckboxClick(num, state) {
  // 왼쪽 체크박스 클릭 시
  if (state == 'leftGood') {
    // 왼쪽 체크박스가 체크되어 있는지 확인
    var leftCheckbox = document.querySelector('.leftCheck');
    alert(leftCheckbox.innerHTML);
    if (leftCheckbox.checked) {
      // 왼쪽 체크박스가 체크되었을 때
	location.href = 'countUp?num=' + num + '&choice1_count=' + 1 + '&choice2_count=' + 0;
      
      // 오른쪽 체크박스 해제
      var rightCheckbox = document.querySelector('.rightCheck');
      rightCheckbox.checked = false;
    } else {
      // 왼쪽 체크박스가 체크 해제될 때
	location.href = 'countUp?num=' + num + '&choice1_count=' + -1 + '&choice2_count=' + 0;
      // 여기서 추가적인 처리가 필요하다면 원하는 작업을 수행할 수 있습니다.
    }
  } else if (state == 'rightGood') {
      // 오른쪽 체크박스 클릭 시
    var rightCheckbox = document.querySelector('.rightCheck');
    if (rightCheckbox.checked) {
	location.href = 'countUp?num=' + num + '&choice1_count=' + 0 + '&choice2_count=' + 1;
      
      // 오른쪽 체크박스 해제
      var leftCheckbox = document.querySelector('.leftCheck');
      leftCheckbox.checked = false;
    } else {
	location.href = 'countUp?num=' + num + '&choice1_count=' + 0 + '&choice2_count=' + -1;
  }
  }
 }
*/

function CheckboxClick(num, state) {
  // 왼쪽 체크박스 클릭 시
  if (state == 'leftGood') {
    // 왼쪽 체크박스가 체크되어 있는지 확인
    var leftCheckbox = document.querySelector('.leftCheck');
    if (leftCheckbox.checked) {
      // 왼쪽 체크박스가 체크되었을 때
      
      // 오른쪽 체크박스 해제
      var rightCheckbox = document.querySelector('.rightCheck');
      rightCheckbox.checked = false;
      upCount(num, 1, 0);}
    else {
      // 왼쪽 체크박스가 체크 해제될 때
      upCount(num, 1, 0);
    }
  } else if (state == 'rightGood') {
    // 오른쪽 체크박스 클릭 시
    var rightCheckbox = document.querySelector('.rightCheck');
    if (rightCheckbox.checked) {
      // 오른쪽 체크박스가 체크되었을 때
      upCount(num, 0, 1);
      
      // 왼쪽 체크박스 해제
      var leftCheckbox = document.querySelector('.leftCheck');
      leftCheckbox.checked = false;
    } else {
      // 오른쪽 체크박스가 체크 해제될 때
      upCount(num, 0, 1);
    }
  }
}

function upCount(num, choice1_count, choice2_count) {
location.href = 'countUp?num=' + num + '&choice1_count=' + choice1_count + '&choice2_count=' + choice2_count;
 };
 
  /*
// AJAX 요청
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // 요청이 성공적으로 완료되었을 때
      var response = JSON.parse(xhr.responseText);
      var newChoice1Count = response.choice1_count;
      var newChoice2Count = response.choice2_count;

      // 화면 갱신
      var count1Element = document.querySelector('.count1');
      var count2Element = document.querySelector('.count2');

      if (count1Element) {
        count1Element.textContent = newChoice1Count;
      }
      if (count2Element) {
        count2Element.textContent = newChoice2Count;
      }
    }
  };
  xhr.send();
}
*/
