package com.javalab.login.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserVo {
	
	/* 아이디 */
	private String id;
	
	/* 비밀번호 */
	private String pwd;
	
	/* 이름 */
	private String name;
	
	/* 이메일 */
	private String email;
	
	/* 성별 */
	private String gender;
	
	/* 회원 구분 */
	private String roleId;
	
	/* 가입일자 */
	private String joindate;

	public UserVo(String id, String pwd, String name, String email, String gender, String roleId) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.roleId = roleId;
	}
	
	
	
	
}
