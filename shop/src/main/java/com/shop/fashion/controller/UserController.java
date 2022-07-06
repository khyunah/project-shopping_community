package com.shop.fashion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/join_form")
	public String joinForm() {
		return "user/join_form2";
	}
}
