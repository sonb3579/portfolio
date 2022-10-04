package com.ezen.food.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BusinessVO {
	@NotEmpty(message="아이디를 입력하세요")
	@NotNull(message="아이디를 입력하세요")
	private String businessId;
	@NotEmpty(message="비밀번호를 입력하세요")
	@NotNull(message="비밀번호를 입력하세요")
	private String businessPwd;
	@NotEmpty(message="이름을 입력하세요")
	@NotNull(message="이름을 입력하세요")
	private String name;
	@NotEmpty(message="전화번호를 입력하세요")
	@NotNull(message="전화번호를 입력하세요")
	private String phone;
	@NotEmpty(message="이메일을 입력하세요")
	@NotNull(message="이메일을 입력하세요")
	private String email;

	}


