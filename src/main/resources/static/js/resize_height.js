function getCardHeight() {
  const firstCardBody = document.querySelector('.card-body');
  const height = firstCardBody.offsetHeight;
  // console.log(height);
  // const setHeightElements = document.querySelectorAll('.follow-card-body');
  // setHeightElements.forEach(element => {
  //   element.style.height = `${height}px`;
  // });
  const setHeightElement = document.querySelector('.follow-card-body');
  setHeightElement.style.height = `${height}px`;
}

window.addEventListener('resize', getCardHeight);
getCardHeight();
