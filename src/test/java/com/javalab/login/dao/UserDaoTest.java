package com.javalab.login.dao;

import static org.junit.Assert.*;

import javax.sql.DataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javalab.login.service.UserService;
import com.javalab.login.vo.UserVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/root-context.xml")
public class UserDaoTest {
	
	@Autowired
	private UserService userService;


	@Test
	public void test() {
		
		UserVo user = new UserVo("user02", "1234", "강아지", "dlalsgur1003@naver.com", "남자", "관리자");
		userService.insertUser(user);

	}

}
