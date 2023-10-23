package com.cos.blog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "voteposts")
public class Vote {
	
	@Id
    private Integer num;
	
	@Column(nullable = false, length = 50)
	private String choiceSub;
	
	@Column(nullable = false, length = 30)
	private String choice_1;
	
	@Column(nullable = false, length = 30)
	private String choice_2;
	
	@ManyToOne(fetch = FetchType.EAGER)  // Many = Many,  User = One
	@JoinColumn(name="user_id")
	private User user; // DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장할 수 있다. 
	
    @Column(columnDefinition = "INT DEFAULT 0")
    private Integer choice1_count;
    
    @Column(columnDefinition = "INT DEFAULT 0")
    private Integer choice2_count;
	
	@Column(columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
	private Date created_at;
    
    @Column(columnDefinition = "INT DEFAULT 0")
    private Integer isend;
    
}
