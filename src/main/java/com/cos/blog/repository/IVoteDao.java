package com.cos.blog.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cos.blog.dto.VoteDto;

@Mapper	// mybatis와 인터페이스 함수를 연결 = @Mapper
public interface IVoteDao {
	// Dto의 list를 불러와야함(select)
	/// List<참조할Dto> 함수명();
	public List<VoteDto> voteList();
	
	// 작성을 통해 DB에 추가하는 과정(insert)
	public int voteWrite(String choiceSub, String choice_1, String choice_2);

	// 투표글 수정
	public int updateVote(int num, String choiceSub, String choice_1, String choice_2);

	// 따봉클릭해서 count 증가
	public int countUp(int num, int choice1_count, int choice2_count);

	// 투표글 삭제
	public int deleteVote(int num);



		
}
