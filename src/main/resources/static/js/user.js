let index = {
		init: function(){
			$("#btn-save").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!! 
				this.save();
			});
			$("#btn-update").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!! 
				this.update();
			});
		},

		save: function(){
			//alert('user의 save함수 호출됨');
			let data = {
					username: $("#username").val(),
					password: $("#password").val(),
					email: $("#email").val()
			};
			
			//console.log(data);
			
			// ajax호출시 default가 비동기 호출
			// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청!!
			// ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해주네요.
			$.ajax({ 
				type: "POST",
				//url: "/auth/joinProc",
				url: "/joinProc",
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function(resp){
				if(resp.status === 500){
					alert("회원가입에 실패하였습니다.");
				}else if(resp.status === 200){
					    if (resp.data === 1) {
							alert("회원가입이 완료되었습니다.");
							location.href = "/";
							
					    } else if (resp.data === 2) {
					        alert("유저네임은 영문, 숫자, 한글, _, - 으로만 구성되어야하며 2~15자로 생성가능합니다.");
					    } else if (resp.data === 3) {
					        alert("비밀번호는 4자리 이상, 20자리 이하만 허용됩니다.");
					    } else if(resp.data === 4) {
							alert("해당 이메일 주소 형식을 지원하지 않습니다.");
						} else if(resp.data === 5) {
							alert("이미 사용중인 유저네임입니다.");
						} else if(resp.data === 6) {
							alert("비밀번호는 영문 대소문자, 숫자, 특수문자만 사용가능합니다.\n\n"
							+"사용가능한 특수문자는 다음과 같습니다.\n"
							+" ` ~ ! @ # $ % ^ & * ( ) - _ = + [ { ] } \\ | ; : \' \" , < . > / ?");
						}
				}

			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
			
		},
		
		update: function(){
			//alert('user의 save함수 호출됨');
			let data = {
					id: $("#id").val(),
					username: $("#username").val(),
					password: $("#password").val(),
					email: $("#email").val()
			};
			
			$.ajax({ 
				type: "PUT",
				url: "/user",
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function(resp){
				if(resp.status === 500){
					alert("회원정보 수정에 실패하였습니다.");
				}else if(resp.status === 200){
					if(resp.data === 1){
						alert("회원수정이 완료되었습니다.");
						//console.log(resp);
						location.href = "/";
					}else if (resp.data === 2) {
						alert("비밀번호는 4자리 이상이어야 합니다.");
					}
				}
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
			
		},
		
}

index.init();

