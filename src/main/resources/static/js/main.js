var slides = document.querySelectorAll("#slides > img");
var prev = document.getElementById("prev");
var next = document.getElementById("next");
var current = 0;

showSlides(current);
prev.onclick = prevSlide;
next.onclick = nextSlide;

function showSlides(n) {
    for (var i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[n].style.display = "block";
}

function prevSlide() {
    if (current > 0) current -= 1; else current = slides.length - 1;
    showSlides(current);
}

function nextSlide() {
    if (current < slides.length - 1) current += 1; else current = 0;
    showSlides(current);
}


window.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.button1 button');
    const writeWraps = document.querySelectorAll('.board_write_wrap');
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

function hide2() {
    console.log("-------------------------------------");
    var element = document.querySelector('.myDiv');
    if (element.style.display === 'none') {
        element.style.display = 'block';
    } else {
        element.style.display = 'none';
    }
}
