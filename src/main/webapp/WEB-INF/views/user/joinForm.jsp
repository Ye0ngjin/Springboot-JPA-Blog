<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form>
		<div class="form-group">
			<label for="username">Username</label> 
			<input type="text" class="form-control" placeholder="Enter username" id="username" 
			maxlength="15" onkeydown="checkCharCode(this)" onblur="checkCharCode(this)">
		</div>
		
		<div class="form-group">
			<label for="password">Password&nbsp;</label> 
			<div id="togglePassword" 
			onclick="togglePasswordVisibility('password')" class="btn btn-sm btn-light"><i class="far fa-eye-slash"></i><span class="invisible" style="display:none;">show</span></div>
			<input type="password" class="form-control" placeholder="Enter password" id="password" 
			maxlength="20" oninput="checkCharCode(this)">
		</div>
		<%--
		<div class="form-group">
			<label for="email">Email</label> 
			<input type="email" class="form-control" placeholder="Enter email" id="email">
		</div>
		 --%>
	</form>
	<button id="btn-save" class="btn btn-primary">회원가입완료</button>

</div>

<script src="/js/user.js"></script>
<script>
function checkCharCode(element){
    const regExps = {
    	username: /[^a-zA-Z0-9가-힣-_]/g,
    	password: /[^!-~]/g,
    };
    const regExp = regExps[element.id];
    if (regExp) {
        if (regExp.test(element.value)) {
            element.value = element.value.replace(regExp, '');
        }
    }
    // var keycode = event.keyCode;
    // console.log("키값 : " + keycode);   
}

// 비밀번호 가시성 토글 함수
function togglePasswordVisibility(inputId) {
    const passwordInput = document.getElementById(inputId);
    const passwordToggle = document.getElementById('togglePassword');

    if (passwordInput.type === 'password') {
    	
        passwordToggle.lastElementChild.innerText = 'hide';
        passwordToggle.classList.toggle('btn-light');
        passwordToggle.classList.toggle('btn-secondary');
        passwordToggle.classList.toggle('btn-outline-light');
        passwordToggle.firstElementChild.classList.toggle('fa-eye');
        passwordToggle.firstElementChild.classList.toggle('fa-eye-slash');
    } else {
    	passwordToggle.lastElementChild.innerText = 'show';
        passwordToggle.classList.toggle('btn-light');
        passwordToggle.classList.toggle('btn-secondary');
        passwordToggle.classList.toggle('btn-outline-light');
        passwordToggle.firstElementChild.classList.toggle('fa-eye');
        passwordToggle.firstElementChild.classList.toggle('fa-eye-slash');
    }
    passwordInput.type = passwordInput.type === "password" ? "text" : "password";
}

//이벤트 리스너를 등록하여 호버 시 클래스 추가 및 제거
document.getElementById("togglePassword").addEventListener("mouseover", function() {
	this.lastElementChild.classList.toggle('invisible');
	this.lastElementChild.style.display='inline';
	this.firstElementChild.classList.toggle('fa-eye');
	this.firstElementChild.classList.toggle('fa-eye-slash');
});

document.getElementById("togglePassword").addEventListener("mouseout", function() {
	this.lastElementChild.classList.toggle('invisible');
	this.lastElementChild.style.display='none';
	this.firstElementChild.classList.toggle('fa-eye');
	this.firstElementChild.classList.toggle('fa-eye-slash');
});

</script>
<%@ include file="../layout/footer.jsp"%>