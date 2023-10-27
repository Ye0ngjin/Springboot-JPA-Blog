package com.cos.blog.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
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
	public String joinForm(@AuthenticationPrincipal PrincipalDetail principal, HttpServletRequest request) {
		if(principal==null) {
			return "user/joinForm";
		}
		User user = principal.getUser();
		RoleType role = user.getRole();
		String username = user.getUsername();
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		System.out.println(referer);
		if (referer != null) {
			referer = referer.substring(referer.lastIndexOf("/") + 1);
			System.out.println(referer);
			referer = referer.substring( 0, referer.lastIndexOf("?") != -1 ? referer.lastIndexOf("?"): referer.length());
			System.out.println("회원가입 페이지에 RoleType: '"+role+"', username: '"+username+"'의 접근입니다."+ referer+"로 리다이렉트");
			return "redirect:" + referer; // 이전 페이지로 리다이렉트
		} else {
			return "redirect:/";
		}
	}

//	@GetMapping("/auth/loginForm")
	@GetMapping("/loginForm")
	public String loginForm(@AuthenticationPrincipal PrincipalDetail principal, HttpServletRequest request) {
		if(principal==null) {
			return "user/loginForm";
		}
		User user = principal.getUser();
		RoleType role = user.getRole();
		String username = user.getUsername();
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		if (referer != null) {
			referer = referer.substring(referer.lastIndexOf("/") + 1).substring(0,referer.lastIndexOf("?"));
		}
		System.out.println("로그인 페이지에 RoleType: '"+role+"', username: '"+username+"'의 접근입니다. 로그아웃을 실행합니다."+ referer+"");

		return "redirect:logout";
	}

	@GetMapping("/user/updateForm")
	public String updateForm(@AuthenticationPrincipal PrincipalDetail principal) {	
	  return "user/updateForm";
	}
}
