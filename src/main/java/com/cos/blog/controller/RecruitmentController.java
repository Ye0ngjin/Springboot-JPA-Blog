package com.cos.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.blog.model.Recruitment;
import com.cos.blog.service.RecruitmentService;

@Controller
public class RecruitmentController {
	
	@Autowired
	private RecruitmentService recruitmentService;
	
	// 컨트롤로에서 세션을 어떻게 찾는지?
	// @AuthenticationPrincipal PrincipalDetail principal
	@GetMapping("/recruitment")
	public String index(Model model, @PageableDefault(size=5, sort="id", direction = Sort.Direction.DESC) Pageable pageable) {  
		model.addAttribute("boards", recruitmentService.글목록(pageable));
		return "recruitment/recruitment"; // viewResolver 작동!!
	}
	
//	@GetMapping("/recruitment/{id}")
//	public String findById(@PathVariable int id, Model model) {
//		model.addAttribute("board", recruitmentService.글상세보기(id));
//		
//		return "recruitment/detail";
//	}
	@GetMapping("/recruitment/{id}")
	public ResponseEntity<?> findById(@PathVariable int id) {
	    Recruitment board = recruitmentService.글상세보기(id);
	    if (board == null) {
	        // 게시글이 존재하지 않는 경우 예외 처리 로직을 추가해주세요.
	        return ResponseEntity.notFound().build();
	    }
	    return ResponseEntity.ok(board);
	}
	
//	@GetMapping("/recruitment/{id}/updateForm")
//	public String updateForm(@PathVariable int id, Model model) {
//		model.addAttribute("board", recruitmentService.글상세보기(id));
//		return "recruitment/updateForm";
//	}
	
//	// USER 권한이 필요
//	@GetMapping("/recruitment/saveForm")
//	public String saveForm() {
//		return "recruitment/saveForm";
//	}
	
}
