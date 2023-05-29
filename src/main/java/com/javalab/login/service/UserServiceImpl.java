package com.javalab.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalab.login.dao.UserMapperInterface;
import com.javalab.login.vo.UserVo;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserMapperInterface userDao;

	// 회원 아이디가 존재하는지 확인하는 함수
	@Override
	public boolean checkIfUsernameExists(String userId) {
		String result = userDao.checkIfUsernameExists(userId);
		result = result.toUpperCase();
		if(result.equals("TRUE"))
			return true;
		else 
			return false;
	}

	// 회원 정보를 아이디로 검색해서 가져오는 함수 
	@Override
	public UserVo getUserInfoById(String userId) {
		UserVo user = userDao.getUserInfoById(userId);
		return user;
	}

	// 회원 정보를 입력하는 함수
	@Override
	public void insertUser(UserVo user) {
		userDao.insertUser(user);
	}
	
	

}
