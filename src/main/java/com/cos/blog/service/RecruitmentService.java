package com.cos.blog.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.Recruitment;
import com.cos.blog.model.User;
import com.cos.blog.repository.RecruitmentRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecruitmentService {
	
	private final RecruitmentRepository recruitmentRepository;

	@Transactional
	public void 글쓰기(Recruitment recruitment, User user) { // title, content
		recruitment.setUser(user);
		recruitmentRepository.save(recruitment);
	}
	
	@Transactional(readOnly = true)
	public Page<Recruitment> 글목록(Pageable pageable){
		return recruitmentRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Recruitment 글상세보기(int id) {
		return recruitmentRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		System.out.println("글삭제하기 : "+id);
		recruitmentRepository.deleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id, Recruitment requestRecruitment) {
		Recruitment recruitment = recruitmentRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				}); // 영속화 완료
		recruitment.setTitle(requestRecruitment.getTitle());
		recruitment.setContent(requestRecruitment.getContent());
		// 해당 함수로 종료시(Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨. db flush
	}
	
}
