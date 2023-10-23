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
		if(recruitment.getLimit_count() == null || recruitment.getTitle() == "") {
			return;
		}
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
	public void 글삭제하기(int id, User user) {
		Recruitment recruitment = recruitmentRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		if(recruitment.getUser().getId() == user.getId()) {
			
			System.out.println("글삭제하기 : "+id);
			recruitmentRepository.deleteById(id);
		}else {
			System.out.println("작성자가 아닙니다");
		}
	}
	
	@Transactional
	public void 글수정하기(int id, Recruitment requestRecruitment, User user) {
		Recruitment recruitment = recruitmentRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				}); // 영속화 완료
		if(recruitment.getUser().getId() == user.getId()) {
			
			recruitment.setTitle(requestRecruitment.getTitle());
			recruitment.setContent(requestRecruitment.getContent());
			recruitment.setLimit_count(requestRecruitment.getLimit_count());
			recruitment.setDaterange(requestRecruitment.getDaterange());
			// 해당 함수로 종료시(Service가 종료될 때) 트랜잭션이 종료됩니다. 이때 더티체킹 - 자동 업데이트가 됨. db flush
		}else {
			System.out.println("작성자가 아닙니다");
		}
	}
	
}
