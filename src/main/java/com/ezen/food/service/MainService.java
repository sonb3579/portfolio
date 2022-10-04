package com.ezen.food.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.food.dao.IAdminDao;
import com.ezen.food.dao.IMainDao;
import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;
import com.ezen.food.dto.WishVO;

@Service
public class MainService {
	
	@Autowired
	IMainDao mdao;
	
	@Autowired
	IAdminDao adao;

	
	public void getNewRestList(HashMap<String, Object> paramMap) {
		mdao.getNewRestList(paramMap);
	}
	
	public void getKindList(HashMap<String, Object> paramMap) {
		
		int page = (Integer) paramMap.get("page");
		Paging paging = new Paging();
		paging.setPage(page);
		
		paramMap.put("cnt", 0); 
		mdao.getKindCount( paramMap ); //ryn 조건 수정완료 
		int count = (Integer)paramMap.get("cnt"); 
		paging.setTotalCount(count);  
		paging.setDisplayRow(10);
		paging.paging(); 
		
		paramMap.put("startNum", paging.getStartNum() );
		paramMap.put("endNum", paging.getEndNum() );
		paramMap.put("paging", paging);
		
		mdao.getKindList(paramMap);
	}

	public void getDetail(HashMap<String, Object> paramMap) {
		mdao.getDetail(paramMap);
	}

	public void getReviews(HashMap<String, Object> paramMap) {
		mdao.getReviews(paramMap);
	}

	public void getImages(HashMap<String, Object> paramMap) {
		mdao.getImages(paramMap);
	}

	public void getKindListInDetail(HashMap<String, Object> paramMap) {
		mdao.getKindListInDetail(paramMap);
	}

	public void getMenu(HashMap<String, Object> paramMap) {
		mdao.getMenu(paramMap);
	}

	public void addWish(int rseq, Object object) {
		mdao.addWish(rseq, object);
	}

	public WishVO getResult(Object object, int rseq) {
		return mdao.getResult(object,rseq);
	}

	public void removeWish(int wseq, String id) {
		mdao.removeWish(wseq, id);
	}

	public void reserveInsert(CheckRestVO checkrestvo) {
		mdao.reserveInsert(checkrestvo);
	}

	public void reviewSubmit(ReviewVO reviewvo) {
		mdao.reviewSubmit(reviewvo);
	}

	public Integer getAvgRating(int rseq) {
		Integer avg= mdao.getAvgRating(rseq);
		return avg;
	}

	public void pushRating(int avg, int rseq) {
		mdao.pushRating(avg, rseq);
	}

	public void updateReview(ReviewVO reviewvo) {
		mdao.updateReview(reviewvo);
	}

	public void reviewDelete(int rwseq) {
		mdao.reviewDelete(rwseq);
	}

	public void getReviewOne(HashMap<String, Object> paramMap) {
		mdao.getReviewOne(paramMap);
	}

	public void getBestList(HashMap<String, Object> paramMap) {
		mdao.getBestList(paramMap);
	}

	public HashMap<String, Object> getNoticeListM(int page, String key) {
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

	public HashMap<String, Object> searchRestList(int page, String key) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = mdao.getAllSearchRestCount(key); //ryn 조건 수정완료 
		paging.setTotalCount(count);
		paging.paging();
		
		List<RestVO> restKindList = mdao.getSearchRest(paging,key); 
		result.put("restKindList", restKindList);
		result.put("paging",paging);
		return result;
	}
	
	public void getBannerList(HashMap<String, Object> paramMap) {
		mdao.getBannerList(paramMap);
	}

	public NoticeVO noticeDetail(int nseq) {
		return adao.noticeDetail(nseq);
	}

	public void getReviewsPage(HashMap<String, Object> paramMap) {
		int page = (Integer) paramMap.get("page");
		Paging paging = new Paging();
		paging.setPage(page);
		
		paramMap.put("cnt", 0); 
		mdao.getReviewCount( paramMap ); 
		int count = (Integer)paramMap.get("cnt"); 
		paging.setTotalCount(count);  
		paging.setDisplayRow(10);
		paging.paging(); 
		
		paramMap.put("startNum", paging.getStartNum() );
		paramMap.put("endNum", paging.getEndNum() );
		paramMap.put("paging", paging);
		
		mdao.getReviewsPage(paramMap);
	}

	public void getQnaList(HashMap<String, Object> paramMap) {
		
		int page = (Integer) paramMap.get("page");
		Paging paging = new Paging();
		paging.setPage(page);
		
		paramMap.put("cnt", 0); 
		mdao.getQnaCount( paramMap ); 
		int count = (Integer)paramMap.get("cnt"); 
		paging.setTotalCount(count);  
		paging.setDisplayRow(10);
		paging.paging(); 
		
		paramMap.put("startNum", paging.getStartNum() );
		paramMap.put("endNum", paging.getEndNum() );
		paramMap.put("paging", paging);
		
		mdao.getQnaList(paramMap);
	}

	public void insertQna(@Valid QnaVO qnavo) {
		mdao.insertQna(qnavo);
	}

	public void deletetQna(int qseq) {
		mdao.deletetQna(qseq);
	}

}
