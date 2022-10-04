package com.ezen.food.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class AdminVO {
	
	
	@NotEmpty(message="아이디를 입력하세요")
	@NotNull(message="아이디를 입력하세요")
	private String workId;
	@NotEmpty(message="비밀번호를 입력하세요")
	@NotNull(message="비밀번호를 입력하세요")
	private String workPwd;
	private String name;
	private String phone;
	
	
	
}
