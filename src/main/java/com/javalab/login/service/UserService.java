package com.javalab.login.service;

import org.springframework.stereotype.Service;

import com.javalab.login.vo.UserVo;


public interface UserService {

	// 회원 아이디가 존재하는지 확인하는 함수
	boolean checkIfUsernameExists(String userId);
	
	// 회원 정보를 아이디로 검색해서 가져오는 함수 
	UserVo getUserInfoById(String userId);
	
	// 회원 정보를 입력하는 함수
	void insertUser(UserVo user);
}
