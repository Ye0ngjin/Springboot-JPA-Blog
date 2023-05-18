package com.cos.blog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.Recruitment;
import com.cos.blog.service.RecruitmentService;

@RestController
public class RecruitmentApiController {
	
	@Autowired
	private RecruitmentService recruitmentService;
	
	@PostMapping("/api/recruitment")
	public ResponseDto<Integer> save(@RequestBody Recruitment recruitment, @AuthenticationPrincipal PrincipalDetail principal) {
		recruitmentService.글쓰기(recruitment, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@DeleteMapping("/api/recruitment/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		recruitmentService.글삭제하기(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@PutMapping("/api/recruitment/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Recruitment recruitment){
		System.out.println("BoardApiController : update : id : "+id);
		System.out.println("BoardApiController : update : board : "+recruitment.getTitle());
		System.out.println("BoardApiController : update : board : "+recruitment.getContent());
		recruitmentService.글수정하기(id, recruitment);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 데이터 받을 때 컨트롤러에서 dto를 만들어서 받는게 좋다.
	// dto 사용하지 않은 이유는!! 

}



