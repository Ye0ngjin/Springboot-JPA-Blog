package com.cos.blog.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;

// 스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다.
@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional(readOnly = true)
	public User 회원찾기(String username) {
		User user = userRepository.findByUsername(username).orElseGet(()->{
			return new User();
		});
		return user;
	}
	
	public boolean checkUsername(String username) {
		// 사용자 이름의 패턴을 정의
		Pattern usernamePattern = Pattern.compile("^[a-zA-Z0-9가-힣-_]{2,15}$");
	    // 정규 표현식과 일치하는지 확인
	    Matcher matcher = usernamePattern.matcher(username);
	    boolean result = matcher.matches();
	    
	    if(result) {
	        System.out.println("사용자 이름이 유효합니다.");
	    }else {
	        System.out.println("사용자 이름이 유효하지 않습니다.");
	    }
		return result;
	}
	
	public boolean checkEmail(String email) {
		Pattern emailPattern = Pattern.compile("^\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+$");
		// ^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$ 자바에서 백슬래시가 이스케이프 문자로 사용되므로 위와같이 백슬래시 두번 사용
		Matcher matcher = emailPattern.matcher(email);
		boolean result = matcher.matches();
		return result;
	}
	
	@Transactional
	public int 회원가입(User user) {
		if (checkUsername(user.getUsername())){
			
			if(userRepository.existsByUsername(user.getUsername())) {
				// 중복된 유저네임이 존재할 때
				System.out.println("중복된 사용자 이름입니다.");
				return 5;
			}
			
			String rawPassword = user.getPassword(); // 1234 원문
			if (rawPassword.length() < 4) {
				// 비밀번호가 4자리 미만일 때
				return 3;
			}
			if (checkEmail(user.getEmail())) {
				String encPassword = encoder.encode(rawPassword); // 해쉬
				user.setPassword(encPassword);
				user.setRole(RoleType.USER);
				try {
					userRepository.save(user);
					return 1;
				} catch (Exception e) {
					return -1;
				}
			}else {
				// 이메일이 정해둔 정규표현식 패턴과 일치하지 않을 때
				return 4;
			}
		}else {
			// 유저네임이 정해둔 정규표현식 패턴과 일치하지 않을 때
			return 2;
		}
		
	}

	@Transactional
	public int 회원수정(User user) {
		// 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고, 영속화된 User 오브젝트를 수정
		// select를 해서 User오브젝트를 DB로 부터 가져오는 이유는 영속화를 하기 위해서!!
		// 영속화된 오브젝트를 변경하면 자동으로 DB에 update문을 날려주거든요.
		User persistance = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("회원 찾기 실패");
		});
		
		// Validate 체크 => oauth 필드에 값이 없으면 수정 가능
		if(persistance.getOauth() == null || persistance.getOauth().equals("")) {
			String rawPassword = user.getPassword();
			
			if (rawPassword.length() < 4) {
				System.out.println(rawPassword.length());
				return 2;
			}
			String encPassword = encoder.encode(rawPassword);
			persistance.setPassword(encPassword);
			//persistance.setEmail(user.getEmail());
			
			return 1;
		}
		return 0;
		
		// 회원수정 함수 종료시 = 서비스 종료 = 트랜잭션 종료 = commit 이 자동으로 됩니다.
		// 영속화된 persistance 객체의 변화가 감지되면 더티체킹이 되어 update문을 날려줌.
	}
	
}