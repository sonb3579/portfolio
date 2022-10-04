package com.ezen.food.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class CheckRestVO {

	
	private Integer cseq;
	private Integer rseq;
	private String id;
	
	@NotEmpty(message="예약날짜를 입력하세요")
	@NotNull(message="예약날짜를 입력하세요")
	private String c_checkdate;
	
	@NotEmpty(message="예약시간을 입력하세요")
	@NotNull(message="예약시간을 입력하세요")
	private String c_checkdatetime;
	
	@NotNull(message="예약인원을 입력하세요")
	private int c_people;
	
	private String r_name;
	private String r_map;
	private String r_phone;
	private String r_address;
	private String r_kind;
	private String m_image;
	private String name;
	private String cyn;
		
}
