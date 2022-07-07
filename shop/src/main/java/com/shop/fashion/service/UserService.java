package com.shop.fashion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.fashion.model.OAuthType;
import com.shop.fashion.model.RollType;
import com.shop.fashion.model.User;
import com.shop.fashion.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	// 회원가입
	@Transactional
	public User joinUser(User user) {
		if(user.getOauth() == null) {
			user.setOauth(OAuthType.ORIGIN);
		}
		user.setRole(RollType.USER);
		return userRepository.save(user);
	}
	
	// 회원가입시 아이디 중복 체크
	@Transactional
	public User checkUserId(String userId) {
		return userRepository.findByUserId(userId).orElseGet(() -> {
			return new User();
		});
	}
	
	// 로그인
	@Transactional
	public User loginUser(User user) {
		return userRepository.findByUserIdAndPassword(user.getUserId(), user.getPassword()).orElseGet(() -> {
			return new User();
		});
	}
	
}
