package com.cos.blog.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.blog.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 컨트롤로에서 세션을 어떻게 찾는지?
	// @AuthenticationPrincipal PrincipalDetail principal
	@GetMapping({"", "/"})
	public String index(Model model, @PageableDefault(size=3, sort="id", direction = Sort.Direction.DESC) Pageable pageable, HttpServletRequest request) {  
		
		model.addAttribute("boards", boardService.글목록(pageable));
		
		//HttpServletRequest request
		// System.out.println(boardService.글목록(pageable).toList());
		return "main"; // viewResolver 작동!!
	}
	

	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.글상세보기(id));
		
		return "board/detail";
	}
	
	@GetMapping("/board/{id}/updateForm")
	public String updateForm(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.글상세보기(id));
		return "board/updateForm";
	}
	
//	// USER 권한이 필요
//	@GetMapping("/board/saveForm")
//	public String saveForm() {
//		return "board/saveForm";
//	}
	
	@RequestMapping(value = "/share")
	public String share(Locale locale, Model model, HttpServletRequest request) {
		
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		//System.out.println(referer);
		
		if (referer == null) {
			request.getSession().setAttribute("alert_message", "정보공유 페이지는 보수중입니다.");
			request.getSession().setAttribute("close_timeout", 1500);
			return "redirect:/";
		} else {
			String pageName = referer.substring(referer.lastIndexOf("/") + 1);
			int qIndex = pageName.lastIndexOf("?");
			if (qIndex != -1) {
				pageName = pageName.substring(0, qIndex); // 헤더 제거
				System.out.println(pageName);
			}
			if (pageName == "joinForm" || pageName == "loginForm") {
				request.getSession().setAttribute("alert_message", "정보공유 페이지는 보수중입니다.");
				request.getSession().setAttribute("close_timeout", 1500);
				return "redirect:/";
			}
			request.getSession().setAttribute("alert_message", "정보공유 페이지는 보수중입니다.");
			request.getSession().setAttribute("close_timeout", 1500);
			return "redirect:" + referer; // 이전 페이지로 리다이렉트
		}
	    //return "share";
	}
	
//	@RequestMapping(value = "/vote")
//	public String main3(Locale locale, Model model) {
//	    return "vote";
//	}
	
	
}
