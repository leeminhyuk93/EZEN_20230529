package com.javalab.login.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.javalab.login.vo.UserVo;

import lombok.extern.slf4j.Slf4j;



@Controller
@SessionAttributes("user")
@Slf4j
// USER 속성 컨트롤러
public class UserAttrController {
	


	/*
	 *		어떤 메소드를 실행하던지 간에 
	 *		가장 먼저 자동으로 실행되는 메소드
	 */
	@ModelAttribute("selectData")
	public Map<String, Object> callFirstOfAll() {
		log.info("가장 우선적으로 불려지는 메소드");
		
		Map<String, Object> selectData = new HashMap<>();
		
		// 성별 선택자 리스트
		List<String> gender = new ArrayList<String>();
		gender.add("남자");
		gender.add("여자");
		
		selectData.put("gender", gender);
		
		// 회원구분 선택자 리스트
		List<String> roleId = new ArrayList<String>();
		roleId.add("관리자");
		roleId.add("일반회원");
		
		selectData.put("roleId", roleId);
		
		return selectData;
	}
	
	
	/*
	 * 		<form:form> 태그를 사용한 JSP 페이지로 이동시에 'path=' 관련하여 
	 * 		오류가 뜨는 경우는 자동으로 바인딩 할 객체를 model에 저장하지 않았기 때문이다.
	 * 
	 *  	JSP 페이지 내부에 <form:form> 태그의 속성으로 modelAttribute를 전달해야한다. 
	 */
	@GetMapping("/joinForm")
	public String redirectJoinForm(Model model) {
		
		UserVo user = new UserVo();
		model.addAttribute("user", user);
		return "joinForm";
	}

	
	

}
