package com.javalab.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalab.login.service.UserService;
import com.javalab.login.vo.UserVo;

@Controller
public class UserDBController {
	
	@Autowired
	private UserService userService;
	
	
	// 아이디를 체크하는 함수
	@ResponseBody
	@GetMapping("/checkId/{id}")
	public String checkIdExists(@PathVariable("id") String userId) {
		System.out.println("checkIdExists() 실행");
		boolean result = false;
		result = userService.checkIfUsernameExists(userId);
		
		if(result) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// 아이디와 비밀번호가 일치하는지 확인하는 함수
	@ResponseBody
	@GetMapping("/checkPwd/{id}/{pwd}")
	public String isPasswordMatch(@PathVariable("id") String userId,
								@PathVariable("pwd") String userPwd) {
		System.out.println("isPasswordMatch() 실행");
		boolean result = false;
		UserVo user = userService.getUserInfoById(userId);
		
		if(userPwd.equals(user.getPwd())) {
			return "true";
		}
		
		return "false";
	}
	
	
	@PostMapping("/join")
	public String joinUser(UserVo user) {
		// 남자,여자 문자열을 man, woman 문자열로 치환
		switch(user.getGender()) {
		case "남자": user.setGender("man"); break;
		case "여자": user.setGender("woman"); break;
		}
		
		// 관리자, 일반회원 문자열을 admin, user 문자열로 치환
		switch(user.getRoleId()) {
		case "관리자": user.setRoleId("admin"); break;
		case "일반회원": user.setRoleId("user"); break;
		}
		
		// 데이터베이스에 저장
		userService.insertUser(user);
		return "login";
	}
	
	@PostMapping("/login")
	public String loginMessage(@RequestParam("id") String userId, Model model) {
		UserVo user = new UserVo();
		user = userService.getUserInfoById(userId);
		
		model.addAttribute("user", user);
		
		return "loginMessage";
	}

}
