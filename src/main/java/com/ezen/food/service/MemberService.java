package com.ezen.food.service;


import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.food.dao.ICheckDao;
import com.ezen.food.dao.IMemberDao;
import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.WishVO;


@Service
public class MemberService {

	
	@Autowired
	IMemberDao memdao;
	
	@Autowired
	ICheckDao chkdao;

	public MemberVO findIdbyId_Phone(String find_id, String find_tel) {
		return memdao.findIdbyId_Phone(find_id, find_tel);
	}
	
	public void insertMember(HashMap<String, Object> paramMap) {
		memdao.insertMember(paramMap);
		}

	public MemberVO findId_ByNP(String find_name, String find_tel) {
		return memdao.findId_ByNP(find_name, find_tel);
		}
	
	public MemberVO getMember(String id) {
		
		return memdao.getMember(id);
	}

	public void changeName(MemberVO membervo) {		
		 memdao.changeName(membervo);
	}

	public void changeGender(@Valid MemberVO membervo) {
		memdao.changeGender(membervo);
	}

	public void changePhone(@Valid MemberVO membervo) {
		memdao.changePhone(membervo);
	}

	public void changePwd(@Valid MemberVO membervo) {
		memdao.changePwd(membervo);
	}
 
	public HashMap<String, Object> getRecentCheck(int page, String id) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		paging.setDisplayRow(3);
		int count = memdao.getRCount(id);
		paging.setTotalCount(count);
		paging.paging();
		
		List<CheckRestVO> recentCheck = memdao.getRecentCheck(paging,id); 
		result.put("recentCheck", recentCheck);
		result.put("paging",paging);
		
		return result;
	}
	
	public HashMap<String, Object> getLastCheck(int page, String id) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		paging.setDisplayRow(3);
		int count = memdao.getLCount(id);
		paging.setTotalCount(count);
		paging.paging();
		
		List<CheckRestVO> lastCheck = memdao.getLastCheck(paging,id); 
		result.put("lastCheck", lastCheck);
		result.put("paging",paging);
		
		return result;
	}
	
	public void deleteAccount(String id) {
		memdao.deleteAccount(id);
	}

	public void deleteReserve(int cseq) {
		memdao.deleteReserve(cseq);
		
	}

	public CheckRestVO updateReserveForm(int cseq) {
		
		return memdao.getCheckRest( cseq);
	}

	public HashMap<String, Object> getWishlist(int page, String id) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Paging paging = new Paging();
		paging.setPage(page);
		int count = memdao.getWCount(id);
		
		paging.setDisplayRow(4);
		paging.setTotalCount(count);
		paging.paging();
		
		List<WishVO> wishlist = memdao.getWishlist(paging,id); 
		result.put("wishlist", wishlist);
		result.put("paging",paging);
		
		return result;
	}
	public void reserveUpdate(CheckRestVO cvo) {
		memdao.reserveUpdate(cvo);
		
	}

}
