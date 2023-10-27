package com.cos.blog.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
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
@Table(name = "joinposts")
public class Recruitment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private Integer id;
	
	@Column(nullable = false, length = 100)
	private String title;
	
	@Column(columnDefinition = "TEXT")
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)  // Many = Many,  User = One
	@JoinColumn(name="userId")
	private User user; // DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장할 수 있다. 
	
    @Column
    private Integer limit_count;
	
	@Column
	private LocalDateTime created_at;
	
    @Column
    private String daterange;

    @Column
    private LocalDateTime updated_at;
    
    @Column
    private Integer is_end;
	
    @PrePersist
    protected void onCreate() {
    	created_at = LocalDateTime.now();
    	updated_at = null;
    }
    
    @PreUpdate
    protected void onUpdate() {
        updated_at = LocalDateTime.now();
    }
	
}
