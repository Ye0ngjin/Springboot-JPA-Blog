package com.cos.blog.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data	// lombok 연결 = @Data	
public class VoteDto {
	private int num;
	private String user_id;
	private String choiceSub;
	private String choice_1;
	private String choice_2;
	private int choice1_count;
	private int choice2_count;
	private String created_at;
	private int isend;
	
	
	// (alt + shift + S)Generate constructor using fields
	public VoteDto(int num, String user_id, String choiceSub, String choice_1, String choice_2, int choice1_count,
			int choice2_count, String created_at, int isend) {
		super();
		this.num = num;
		this.user_id = user_id;
		this.choiceSub = choiceSub;
		this.choice_1 = choice_1;
		this.choice_2 = choice_2;
		this.choice1_count = choice1_count;
		this.choice2_count = choice2_count;
		this.created_at = created_at;
		this.isend = isend;
	}
	
	// 기본생성자 직접 추가
		public VoteDto() {
			
		}
}
