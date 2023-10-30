package com.cos.blog.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.model.Vote;

@Controller
public class VoteController {
	
	// 자동으로 Bean을 생성해줌
	@Autowired
	IVoteDao voteDao;	// 인터페이스명 변수명
	// 투표목록을 담을 변수
	List<Vote> list;
	
	// DB에서 데이터를 가져와서 투표목록 생성
	@GetMapping("/vote")
	public String voteList(Model model) {
		// DB에서 데이터를 가져와서 list에 저장
		list = voteDao.voteList();
		// model에 저장
		// model: Controller에서 생성된 데이터를 View로 전달할 때 사용하는 객체
		model.addAttribute("list", list);
		// System.out.println(list);
		return "vote/vote";
	}
	
	public Vote findByNum(int num) {
		for (Vote vote : list) {
			if(vote.getNum() == num) {
				return vote;
			}
		}
		return null;
	}
	
	public boolean checkText(String text) {
		if ( text == null ) {
			System.out.println("null값 입력됨.");
			return false; 
		}
		// 게시글 제목의 패턴을 정의
		Pattern titlePattern = Pattern.compile("^\\S+( \\S+|  \\S+|\\t\\S+| \\t\\S+|\\t \\S+)*$");
	    // 정규 표현식과 일치하는지 확인
	    Matcher matcher = titlePattern.matcher(text);
	    boolean result = matcher.matches();
	    
	    if(result) {
	        System.out.println("제목과 선택지가 유효합니다.");
	    }else {
	        System.out.println("제목이나 선택지가 유효하지 않습니다.");
	    }
		return result;
	}
	
	// 투표내용을 작성하여 DB에 전송(추가)
	@RequestMapping("newVote")
	// 들어오는 데이터를 파라미터로 받아줌
	// @RequestParam(intput태그의 "name"값), 타입 name값 >> 필요항목 수만큼 반복
	public String newVote(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("choiceSub") String choiceSub,
			@RequestParam("choice_1") String choice_1,
			@RequestParam("choice_2") String choice_2,
			HttpServletRequest request
			) {
		// insert, update, delete 3가지는 return값을 int로 받을 수 있음 (select는 list)

		User user = principal.getUser();
		int user_id = user.getId();
		if(user.getRole() == RoleType.USER) {
			if (checkText(choiceSub) && 
			checkText(choice_1) && 
			checkText(choice_2) && 
			choiceSub.length() <= 25 && 
			choice_1.length() <= 12 && 
			choice_2.length() <= 12) {
				
				int result = voteDao.voteWrite(choiceSub, choice_1, choice_2, user_id);
				
				if(result == 1) {
					System.out.println("작성 성공"); 
				}else {
					System.out.println("작성 실패"); 
				}
			}else {
				request.getSession().setAttribute("alert_message", "제목이나 선택지의 공백이나 글자수를 확인하세요.");
			}
			
		} else if(user.getRole() == RoleType.ADMIN) {
			
		} else {
			System.out.println("잘못된 계정 유형입니다. 현재 계정 유형: "+user.getRole());
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
		
		Vote vote = findByNum(num);
		if (vote.getUser().getId() == principal.getUser().getId()) {
			// 현재 사용자와 글의 작성자가 같은 경우
			// 여기서 수정 또는 작업을 수행할 수 있습니다.
			
			if (checkText(choiceSub) && 
			checkText(choice_1) && 
			checkText(choice_2) && 
			choiceSub.length() <= 25 && 
			choice_1.length() <= 12 && 
			choice_2.length() <= 12) {
				
				int result = voteDao.updateVote(num, choiceSub, choice_1, choice_2);
				
				if(result == 1) {
					System.out.println("수정 성공"); 
					request.getSession().setAttribute("alert_message", "수정 성공!");
				}else {
					System.out.println("수정 실패"); 
					request.getSession().setAttribute("alert_message", "수정 실패!");
				}
			}else {
				request.getSession().setAttribute("alert_message", "제목이나 선택지의 공백이나 글자수를 확인하세요.");
			}
			
		}else {
			// 현재 사용자와 글의 작성자가 다른 경우
			System.out.println("작성자가 아닙니다");
		}
	    return "redirect:vote";
	}
	
	// count 증가
	@RequestMapping("countUp")
	public String countUp(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("num") int num,
			@RequestParam("choice1_count") int choice1_count,
			@RequestParam("choice2_count") int choice2_count,
			HttpServletRequest request
			) {
		String username = principal.getUsername();
		Vote vote = findByNum(num);
		if(choice1_count * choice2_count != 0 || choice1_count + choice2_count != 1) {
			System.out.print("username: "+username);
			System.out.print(", 글 번호: "+num);
			System.out.print(", 글 제목: "+vote.getChoiceSub());
			System.out.println(" 에 잘못된 접근!"+"choice1_count: "+choice1_count+"choice2_count: "+choice2_count);
			return "redirect:vote";
		}
		int result = voteDao.countUp(num, choice1_count, choice2_count);
		
		if(result == 1) {
//			System.out.println(" 카운트 1 증가 \t//결과//\t"
//								+(vote.getChoice1_count()+choice1_count)+" : "
//								+(vote.getChoice2_count()+choice2_count));
		}else {
			System.out.print("username: "+username);
			System.out.print(", 글 번호: "+num);
			System.out.print(", 글 제목: "+vote.getChoiceSub());
			System.out.print(choice1_count> choice2_count 
					? ", choice1: "+vote.getChoice_1() 
					: ", choice2: "+vote.getChoice_2());
			System.out.println(" 카운트 업 실패");
		}
		
		return "redirect:vote";
	}

	// 투표글 삭제
	@RequestMapping("deleteVote")
	public String deleteVote(
			@AuthenticationPrincipal PrincipalDetail principal,
			@RequestParam("num") int num,
			HttpServletRequest request) {
		
		Vote vote = findByNum(num);
		if (vote.getUser().getId() == principal.getUser().getId()) {
			// 현재 사용자와 글의 작성자가 같은 경우
			// 여기서 삭제 또는 작업을 수행할 수 있습니다.
			int result = voteDao.deleteVote(num);
			
			if(result == 1) {
				System.out.println("삭제 성공"); 
				request.getSession().setAttribute("alert_message", "삭제 성공!");
			}else {
				System.out.println("삭제 실패"); 
				request.getSession().setAttribute("alert_message", "삭제 실패!");
			}
		}else {
			// 현재 사용자와 글의 작성자가 다른 경우
			System.out.println("작성자가 아닙니다");
		}
	    return "redirect:vote";
 
	}
	
}










