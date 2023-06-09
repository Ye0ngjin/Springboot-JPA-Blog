package com.cos.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cos.blog.service.UserService;

// 인증이 안된 사용자들이 출입할 수 있는 경로를 /auth/** 허용
// 그냥 주소가 / 이면 index.jsp 허용
// static이하에 있는 /js/**, /css/**, /image/**

@Controller
public class UserController {

	@Value("${hideon.key}")
	private String hideonKey;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private UserService userService;
	
//	@GetMapping("/auth/joinForm")
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

//	@GetMapping("/auth/loginForm")
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@GetMapping("/user/updateForm")
	public String updateForm() {	
	  return "user/updateForm";
	}
}
