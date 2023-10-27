package com.cos.blog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.User;
import com.cos.blog.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
//	@PostMapping("/auth/joinProc")
	@PostMapping("/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) { // username, password, email
		int result = userService.회원가입(user);
		String logMessage = "";
		switch (result){
		case -1:
			logMessage = "회원가입 오류 발생";
			break;
		case 1:
			logMessage = "회원가입 처리 완료";
			break;
		case 2:
			logMessage = "유효하지 않은 유저네임";
			break;
		case 3:
			logMessage = "비밀번호가 4자리 미만 또는 20자리 초과";
			break;
		case 4:
			logMessage = "유효하지 않은 이메일";
			break;
		case 5:
			logMessage = "중복된 유저네임";
			break;
		case 6:
			logMessage = "허용되지 않는 비밀번호";
			break;

		}
		System.out.println("UserApiController : "+logMessage);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result); // 자바오브젝트를 JSON으로 변환해서 리턴 (Jackson)
	}

	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user) { // key=value, x-www-form-urlencoded
		int result = userService.회원수정(user);
		// 여기서는 트랜잭션이 종료되기 때문에 DB에 값은 변경이 됐음.
		// 하지만 세션값은 변경되지 않은 상태이기 때문에 우리가 직접 세션값을 변경해줄 것임.
		// 세션 등록

		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}

}
