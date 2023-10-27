package com.cos.blog.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;


//spring-boot-starter-web 의존성을 추가했다면 @Slf4j 애노테이션으로 바로 log 사용이 가능하다.
@RestController
@Slf4j
public class SessionInfoController {
	
	@GetMapping("/auth/session-info")
	public Object sessionInfo(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session == null) {
	        return "세션없음";
	    }

	//log();
	log.info("sessionId = {}", session.getId());
	log.info("getMaxInactiveInterval={}", session.getMaxInactiveInterval());
	log.info("creationTime={}", new Date(session.getCreationTime()));
	log.info("lastAccessTime={}", new Date(session.getLastAccessedTime()));
	
	    return "세션있음"; // session.getServletContext();

	}
	
	@GetMapping("/auth/session-test")
	public Object sessionTest(HttpServletRequest req) {
	    HttpSession session = req.getSession(false);
	    if (session == null) {
	        return "세션없음";
	    }

	//log();
	log.info("sessionId = {}", session.getId());
	log.info("getMaxInactiveInterval={}", session.getMaxInactiveInterval());
	log.info("creationTime={}", new Date(session.getCreationTime()));
	log.info("lastAccessTime={}", new Date(session.getLastAccessedTime()));
	
	    return "세션있음"; // session.getServletContext();

	}
	//어떤식으로 출력되나 확인
	public void log(){
		log.trace("trace message");
		log.debug("debug message");
		log.info("info message"); // default
		log.warn("warn message");
		log.error("error message");
	}
}
