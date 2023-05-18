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

// 따봉 누르면 카운트 1 증가
/// 한번 더누르면 카운트 1 감소


// count 합산으로 prcnt gradation 비율 변화
/// grd = count1 / (count1 + count2) * 100


// 따봉비율 높은곳에 % 표시
/// grd>=50 ? 왼쪽에 % : 오른쪽에%;