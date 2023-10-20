package com.cos.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.blog.repository.IVoteDao;
import com.cos.blog.dto.VoteDto;

@Controller
public class VoteController {
	
	// 자동으로 Bean을 생성해줌
	@Autowired
	IVoteDao voteDao;	// 인터페이스명 변수명
	
	// DB에서 데이터를 가져와서 투표목록 생성
	@RequestMapping("/vote")
	public String voteList(Model model) {
		// list를 가져옴
		List<VoteDto> list = voteDao.voteList();
		
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
			@RequestParam("choiceSub") String choiceSub,
			@RequestParam("choice_1") String choice_1,
			@RequestParam("choice_2") String choice_2
			) {
		// insert, update, delete 3가지는 return값을 int로 받을 수 있음 (select는 list)
		int result = voteDao.voteWrite(choiceSub, choice_1, choice_2);
		
		 if(result == 1) { System.out.println("작성 성공"); 
		 }else {
		 System.out.println("작성 실패"); 
		 }
		 
		return "redirect:vote";

	}
	
	// 투표 수정
	@RequestMapping("/updateVote")
	public String updateVote(
			@RequestParam("num") int num,
			@RequestParam("choiceSub") String choiceSub,
			@RequestParam("choice_1") String choice_1,
			@RequestParam("choice_2") String choice_2,
			HttpServletRequest request
			) {
		int result = voteDao.updateVote(num, choiceSub, choice_1, choice_2);
		
		 if(result == 1) { System.out.println("수정 성공"); 
		 request.getSession().setAttribute("alert_message", "수정 성공!");
		 return "redirect:vote";
		 }else {
		 System.out.println("수정 실패"); 
		 request.getSession().setAttribute("alert_message", "수정 실패!");
		 return "redirect:vote";
		 }
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
		
		return "redirect:vote";
	}

	// 투표글 삭제
	@RequestMapping("deleteVote")
	public String deleteVote(
			@RequestParam("num") int num,
			HttpServletRequest request) {
		int result = voteDao.deleteVote(num);
		
		 if(result == 1) { System.out.println("삭제 성공"); 
		 request.getSession().setAttribute("alert_message", "삭제 성공!");
		 return "redirect:vote";
		 }else {
		 System.out.println("삭제 실패"); 
		 request.getSession().setAttribute("alert_message", "삭제 실패!");
		 return "redirect:vote";
		 }
		 
	}
}










