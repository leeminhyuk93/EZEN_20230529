package com.javalab.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.javalab.login.vo.UserVo;


@Mapper
public interface UserMapperInterface {
	
	/*
	 *   필요한 기능
	 * 
	 *   회원 정보를 아이디로 검색해서 가져오는 기능
	 *   회원 아이디의 존재를 확인하는 기능
	 * 
	 */
	
	/*
	 *   @Mapper 어노테이션으로 설정된 인터페이스는 
	 *   Mapper.xml에서 작성된 쿼리문의 ID값과 일치시켜
	 *   서로 연결시키는 역할을 한다. 
	 *   
	 *   예를 들어 @Mapper 인터페이스 내부에서 작성된 추상 메서드 이름은
	 *   Mapper.xml 안에 같은 이름의 ID로 작성된 쿼리문의 실행을 담당하게 된다.
	 *   
	 *   쉽게 말해서 인터페이스의 구현 클래스를 자바에서 작성하는 것이 아닌,
	 *   XML 내부에 작성하는 것과 같다. 
	 */
	
	// 회원 아이디가 존재하는지 확인하는 함수
	public String checkIfUsernameExists(String userId);
	
	// 회원 정보를 아이디로 검색해서 가져오는 함수 
	public UserVo getUserInfoById(String userId);
	
	// 회원 정보를 입력하는 함수
	public void insertUser(UserVo user);
	
}
