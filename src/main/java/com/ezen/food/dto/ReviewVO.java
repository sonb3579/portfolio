package com.ezen.food.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;
@Data
public class ReviewVO {
	private Integer rwseq;
	private Integer rseq;
	
	@NotNull(message="별점을 입력하세요")
	private Integer rating1;
	private String id;
	
	@NotEmpty(message="리뷰를 입력하세요")
	@NotNull(message="리뷰를 입력하세요")
	private String content;
	private Timestamp indate;
	private String r_name;

}
