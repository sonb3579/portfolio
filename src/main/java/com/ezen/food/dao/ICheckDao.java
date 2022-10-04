package com.ezen.food.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;

@Mapper
public interface ICheckDao {

	public void reserveUpdate(@Valid CheckRestVO cvo);

	public List<CheckRestVO> getRecentCheck(Paging paging, String key);



}
