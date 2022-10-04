package com.ezen.food.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class NoticeVO {

	private int nseq;
	@NotEmpty(message="제목을 입력하세요")
	@NotNull(message="제목을 입력하세요")
	private String subject;
	@NotEmpty(message="내용을 입력하세요")
	@NotNull(message="내용을 입력하세요")
	private String content;
	private String workId;
	private Timestamp indate;
	
	
	
	
	
	
	
	
}
