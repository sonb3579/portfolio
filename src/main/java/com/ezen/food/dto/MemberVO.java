package com.ezen.food.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {

	@NotEmpty(message="아이디를 입력하세요")
	@NotNull(message="아이디를 입력하세요")
	private String id;
	@NotEmpty(message="비밀번호를 입력하세요")
	@NotNull(message="비밀번호를 입력하세요")
	private String pwd;
	@NotEmpty(message="이름을 입력하세요")
	@NotNull(message="이름을 입력하세요")
	private String name;
	
	private String email;
	private String phone;
	private String gender;
	private Timestamp indate;
	private int reviewCount;
	
	
	
	
}
