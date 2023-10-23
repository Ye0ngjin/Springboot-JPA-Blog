package com.cos.blog.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.blog.repository.IVoteDao;
import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.model.Board;
import com.cos.blog.model.Recruitment;
import com.cos.blog.model.User;
import com.cos.blog.model.Vote;

@Controller
public class VoteController {
	
	// 자동으로 Bean을 생성해줌
	@Autowired
	IVoteDao voteDao;	// 인터페이스명 변수명
	
	// DB에서 데이터를 가져와서 투표목록 생성
	@GetMapping("/vote")
	public String voteList(Model model) {
		// list를 가져옴
		List<Vote> list = voteDao.voteList();

		// model에 저장
		/// model: Controller에서 생성된 데이터를 View로 전달할 때 사용하는 객체
		model.addAttribute("list", list);
		System.out.println(list);
		return "vote/vote";
	}
	
	// 투표내용을 작성하여 DB에 전송(추가)
	@RequestMapping("newVote")
	// 들어오는 데이터를 파라미터로 받아줌
	/// @RequestParam(intput태그의 "name"값), 타입 name값 >> 필요항목 수만큼 반복
	public String newVote(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("choiceSub") String choiceSub,
			@RequestParam("choice_1") String choice_1,
			@RequestParam("choice_2") String choice_2
			) {
		// insert, update, delete 3가지는 return값을 int로 받을 수 있음 (select는 list)

		int user_id = principal.getUser().getId();
		int result = voteDao.voteWrite(choiceSub, choice_1, choice_2, user_id);
		
		 if(result == 1) { System.out.println("작성 성공"); 
		 }else {
		 System.out.println("작성 실패"); 
		 }
		 
		return "redirect:vote";

	}
	
	// 투표 수정
	@RequestMapping("/updateVote")
	public String updateVote(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("num") int num,
			@RequestParam("choiceSub") String choiceSub,
			@RequestParam("choice_1") String choice_1,
			@RequestParam("choice_2") String choice_2,
			HttpServletRequest request
			) {
		
	    List<Vote> list = voteDao.voteList();
	    for (Vote vote : list) {
	    	if(vote.getNum() == num) {
	    		if (vote.getUser().getId() == principal.getUser().getId()) {
	    			// 현재 사용자와 글의 작성자가 같은 경우
	    			// 여기서 수정 또는 작업을 수행할 수 있습니다.
	    			int result = voteDao.updateVote(num, choiceSub, choice_1, choice_2);

	    			if(result == 1) {
	    				System.out.println("수정 성공"); 
	    				request.getSession().setAttribute("alert_message", "수정 성공!");
	    				break;
	    			}else {
	    				System.out.println("수정 실패"); 
	    				request.getSession().setAttribute("alert_message", "수정 실패!");
	    				break;
	    			}
	    		}else {
	    			// 현재 사용자와 글의 작성자가 다른 경우
	    			System.out.println("작성자가 아닙니다");
	    			break;
	    		}
	    	}
	    }
	    return "redirect:vote";
	}
	
	// count 증가
	@RequestMapping("countUp")
	public String countUp(
			@RequestParam("num") int num,
			@RequestParam("choice1_count") int choice1_count,
			@RequestParam("choice2_count") int choice2_count,
			HttpServletRequest request
			) {
		int result = voteDao.countUp(num, choice1_count, choice2_count);
		
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:"+ referer; // 이전 페이지로 리다이렉트
		//return "redirect:vote";
	}

	// 투표글 삭제
	@RequestMapping("deleteVote")
	public String deleteVote(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("num") int num,
			HttpServletRequest request) {
	    
	    List<Vote> list = voteDao.voteList();
	    for (Vote vote : list) {
	    	if(vote.getNum() == num) {
	    		if (vote.getUser().getId() == principal.getUser().getId()) {
	    			// 현재 사용자와 글의 작성자가 같은 경우
	    			// 여기서 삭제 또는 작업을 수행할 수 있습니다.
	    			int result = voteDao.deleteVote(num);
	    			
	    			if(result == 1) {
	    				System.out.println("삭제 성공"); 
	    				request.getSession().setAttribute("alert_message", "삭제 성공!");
	    				break;
	    			}else {
	    				System.out.println("삭제 실패"); 
	    				request.getSession().setAttribute("alert_message", "삭제 실패!");
	    				break;
	    			}
	    		}else {
	    			// 현재 사용자와 글의 작성자가 다른 경우
	    			System.out.println("작성자가 아닙니다");
	    			break;
	    		}
	    	}
	    }
	    return "redirect:vote";
 
	}
}










