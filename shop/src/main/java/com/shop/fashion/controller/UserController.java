package com.shop.fashion.controller;

import org.springframework.stereotype.Controller;

@Controller
public class UserController {

	public String test() {
		System.out.println("test");
		return "index";
	}
}
