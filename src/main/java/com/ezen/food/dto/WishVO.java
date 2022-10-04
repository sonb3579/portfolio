package com.ezen.food.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishVO {
	private Integer wseq;
	private String id;
	private String result;
	private Timestamp indate;
	private int rseq;
	private String r_runtime;
	private String r_name;
	private String m_image;
	private String r_kind;
	private String rating;
	
}
