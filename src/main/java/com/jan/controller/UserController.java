package com.jan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jan.service.UserService;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月21日 上午9:50:41
*/
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value = "/login")
	public String login(String name) {
		System.out.println("=============");
		userService.insert();
		return userService.getUser(name);
	}
}
