package com.shop.fashion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	// 회원가입 화면
	@GetMapping("/security/join_form")
	public String joinForm() {
		return "user/join_form";
	}
	
	// 로그인 화면
	@GetMapping("/security/login_form")
	public String loginForm() {
		return "user/login_form";
	}
	
}
