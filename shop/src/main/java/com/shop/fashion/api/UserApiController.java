package com.shop.fashion.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.User;
import com.shop.fashion.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession httpSession;

	// 회원가입
	@PostMapping("/security/join-user")
	public ResponseDto<User> joinUser(User user) {
		User userEntity = userService.joinUser(user);
		return new ResponseDto<User>(HttpStatus.OK.value(), userEntity);
	}

	// 회원가입시 아이디 중복 체크
	/**
	 * 회원가입시 아이디 중복 체크를 하는 기능 <br>
	 * 입력한 userId가 가입되어 있지 않으면 new User()로 넘어옴 <br>
	 * 입력한 userId로 이미 가입이 되어있으면 UserEntity로 넘어옴
	 */
	@PostMapping("/security/join-userIdCheck")
	public ResponseDto<User> checkUserId(String userId, Model model) {
		User checkUser = userService.checkUserId(userId);
		return new ResponseDto<User>(HttpStatus.OK.value(), checkUser);
	}

	// 로그인
	@PostMapping("/security/login")
	public ResponseDto<User> loginUser(@RequestBody User user) {
		User userEntity = userService.loginUser(user);
		
		if(userEntity.getUserId() != null) {
			httpSession.setAttribute("principal", userEntity);
		}
		return new ResponseDto<User>(HttpStatus.OK.value(), userEntity);
	}
}
