package com.ezen.food.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.food.dao.IAdminDao;
import com.ezen.food.dto.AdminVO;
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;

@Service
public class AdminService {
	@Autowired
	IAdminDao adao;

	public AdminVO getAdmin(String workId) {
		return adao.getAdmin(workId);
	}

	public HashMap<String, Object> getRest(int page, String key) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = adao.getAllRestCount(key);
		paging.setTotalCount(count);
		paging.paging();
		
		List<RestVO> restList = adao.getRest(paging,key); 
		result.put("restList", restList);
		result.put("paging",paging);
		
		return result;
	}

	public HashMap<String, Object> getMember(int page, String key) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = adao.getAllMemberCount(key);
		paging.setTotalCount(count);
		paging.paging();
		
		List<MemberVO> memberList = adao.getMember(paging, key); 
		result.put("memberList", memberList);
		result.put("paging",paging);
		return result;
	}

	public HashMap<String, Object> getNotice(int page, String key) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = adao.getAllNoticeCount(key);
		paging.setTotalCount(count);
		paging.paging();
		
		List<NoticeVO> noticeList = adao.getNotice(paging,key); 
		result.put("noticeList", noticeList);
		result.put("paging",paging);
		return result;
	}

	public void insertNotice(NoticeVO noticevo) {
		adao.insertNotice(noticevo);
		
	}

	public NoticeVO noticeDetail(int nseq) {
		return adao.noticeDetail(nseq);
	}

	public void updateNotice(NoticeVO noticevo) {
		adao.updateNotice(noticevo);
	}

	public void deleteNotice(int nseq) {
		adao.deleteNotice(nseq);
	}

	public MemberVO getMemberDetail(String id) {
		return adao.getMemberDetail(id);
	}

	public List<ReviewVO> getMemberReview(String id) {
		return adao.getMemberReview(id);
	}

	public void deleteMember(HashMap<String, Object> paramMap) {
		adao.deleteMember(paramMap);
		
	}

	public void deleteReview(int rwseq) {
		adao.deleteReview(rwseq);
	}

	public RestVO getRestDetail(int rseq) {
		return adao.getRestDetail(rseq);
	}

	public ImagesVO getImageDetail(int rseq) {
		return adao.getImageDetail(rseq);
	}

	public MenuVO getMenuDetail(int rseq) {
		return adao.getMenuDetail(rseq);
	}

	public void updateMenu(MenuVO mvo) {
		adao.updateMenu(mvo);
	}

	public void updateRest(RestVO rvo) {
		adao.updateRest(rvo);
	}

	public void updateImage(ImagesVO ivo) {
		adao.updateImage(ivo);
	}

	public void deleteRest(HashMap<String, Object> paramMap) {
		adao.deleteRest(paramMap);
	}

	public void getBannerList(HashMap<String, Object> paramMap) {
		adao.getBannerList(paramMap);
	}

	public void insertBanner(HashMap<String, Object> paramMap) {
		adao.insertBanner(paramMap);
	}

	public void getBannerDetail(HashMap<String, Object> paramMap) {
		adao.getBannerDetail(paramMap);
	}

	public void updateBanner(HashMap<String, Object> paramMap) {
		adao.updateBanner(paramMap);
	}

	public void deleteBanner(int bseq) {
		adao.deleteBanner(bseq);
	}

	


}
