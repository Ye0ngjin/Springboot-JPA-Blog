package com.cos.blog.model;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "joinposts")
public class Recruitment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private Integer id;
	
	@Column(nullable = false, length = 100)
	private String title;
	
	@Lob // 대용량 데이터
	private String content; // 섬머노트 라이브러리 <html>태그가 섞여서 디자인이 됨.
	
	@ManyToOne(fetch = FetchType.EAGER)  // Many = Many,  User = One
	@JoinColumn(name="userId")
	private User user; // DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장할 수 있다. 
	
    @Column
    private Integer limit_count;
	
	@CreationTimestamp
	private LocalDateTime created_at;
	
    @Column
    private String daterange;

    @Column
    private Date updated_at;
    
    @Column
    private Integer is_end;
	
	
}
