package com.cos.blog.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.Board;
import com.cos.blog.model.Recruitment;
import com.cos.blog.model.User;
import com.cos.blog.repository.RecruitmentRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecruitmentService {
	
	private final RecruitmentRepository recruitmentRepository;
	
	public boolean checkTitle(String title) {
		if ( title == null ) {
			System.out.println("null값 입력됨.");
			return false; 
		}
		// 게시글 제목의 패턴을 정의
		Pattern titlePattern = Pattern.compile("^\\S+( \\S+|  \\S+|\\t\\S+| \\t\\S+|\\t \\S+)*$");
	    // 정규 표현식과 일치하는지 확인
	    Matcher matcher = titlePattern.matcher(title);
	    boolean result = matcher.matches();
	    
	    if(result) {
	        System.out.println("게시글의 제목이 유효합니다.");
	    }else {
	        System.out.println("게시글의 제목이 유효하지 않습니다.");
	    }
		return result;
	}
	
	@Transactional
	public void 글쓰기(Recruitment recruitment, User user) { // title, content
		recruitment.setUser(user);
		if(recruitment.getLimit_count() == null || 
		recruitment.getLimit_count() >= 100 || 
		recruitment.getLimit_count() < 0 || 
		!checkTitle(recruitment.getTitle())) {
			return;
		}
		recruitmentRepository.save(recruitment);
	}
	
	@Transactional(readOnly = true)
	public Page<Recruitment> 글목록(Pageable pageable){
		int page = pageable.getPageNumber();
		int size = pageable.getPageSize();
		int maxPageNum = getTotalPageCount(size);
        if (page < 0 ) {
        	page = 0;
        }
		if (maxPageNum < 0){
			maxPageNum = 0;
		}
        if (page > maxPageNum) {
        	page = maxPageNum;
        }
        //System.out.println("페이지 번호: "+page);
        //System.out.println("최대 페이지 수: "+maxPageNum);
        pageable = PageRequest.of(page, size, pageable.getSort());
		
		return recruitmentRepository.findAll(pageable);
	}

    public int getTotalPageCount(int size) {
        long totalItemCount = recruitmentRepository.count();
        return (int)Math.ceil((double) totalItemCount / size) - 1; // 올림을 하고 페이지수는 0부터 시작하므로 -1을 해준다.
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
		if(requestRecruitment.getLimit_count() == null || 
		requestRecruitment.getLimit_count() >= 100 || 
		requestRecruitment.getLimit_count() < 0 || 
		!checkTitle(requestRecruitment.getTitle())) {
			return;
		}
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
