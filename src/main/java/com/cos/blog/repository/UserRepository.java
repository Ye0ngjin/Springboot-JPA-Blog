package com.cos.blog.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cos.blog.model.User;

// DAO
// 자동으로 bean등록이 된다.
// @Repository // 생략 가능하다.
public interface UserRepository extends JpaRepository<User, Integer>{
	// SELECT * FROM users WHERE username = 1?;
	
	Optional<User> findByUsername(String username);
	// 둘 중에 뭘쓰는게 더 좋을지 모르겠음. 비슷하려나
	boolean existsByUsername(String username);
}


// JPA Naming 쿼리
// SELECT * FROM users WHERE username = ?1 AND password = ?2;
//User findByUsernameAndPassword(String username, String password);

//	@Query(value="SELECT * FROM users WHERE username = ?1 AND password = ?2", nativeQuery = true)
//	User login(String username, String password);
