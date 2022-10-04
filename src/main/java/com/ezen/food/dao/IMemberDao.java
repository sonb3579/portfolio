package com.ezen.food.dao;



import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.WishVO;

@Mapper
public interface IMemberDao {

	
	public MemberVO getMember(String id);
	public void changeName(MemberVO membervo);
	public void changeGender(MemberVO membervo);
	public void changePhone(MemberVO membervo);
	public void changePwd(MemberVO membervo);
	public void reserveUpdate(MemberVO membervo);
	
	public List<CheckRestVO> getRecentCheck(Paging paging, String id);
	public List<CheckRestVO> getLastCheck(Paging paging, String id);
	
	public void deleteAccount(String id);
	public int getRCount(String id);
	public int getLCount(String id);
	public void insertMember(HashMap<String, Object> paramMap);
	public MemberVO findId_ByNP(String find_name, String find_tel);
	public MemberVO findIdbyId_Phone(String find_id, String find_tel);
	public void deleteReserve(int cseq);
	public CheckRestVO getCheckRest(int rseq);
	public int getWCount(String id);
	public List<WishVO> getWishlist(Paging paging, String id);
	public void reserveUpdate(CheckRestVO cvo);

}
