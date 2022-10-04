package com.ezen.food.dao;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;
import com.ezen.food.dto.WishVO;

@Mapper
public interface IMainDao {
	
	public void getNewRestList(HashMap<String, Object> paramMap);

	public void getKindList(HashMap<String, Object> paramMap);

	public void getKindCount(HashMap<String, Object> paramMap);

	public void getDetail(HashMap<String, Object> paramMap);

	public void getReviews(HashMap<String, Object> paramMap);

	public void getImages(HashMap<String, Object> paramMap);

	public void getKindListInDetail(HashMap<String, Object> paramMap);

	public void getMenu(HashMap<String, Object> paramMap);

	public void addWish(int rseq, Object object);

	public WishVO getResult(Object object, int rseq);

	public void removeWish(int wseq, String id);

	public void reserveInsert(CheckRestVO checkrestvo);

	public void reviewSubmit(ReviewVO reviewvo);

	public Integer getAvgRating(Integer rseq);

	public void pushRating(int avg, int rseq);

	public void updateReview(ReviewVO reviewvo);

	public void reviewDelete(int rwseq);

	public void getReviewOne(HashMap<String, Object> paramMap);

	public void getBestList(HashMap<String, Object> paramMap);

	public int getAllSearchRestCount(String key);

	public List<RestVO> getSearchRest(Paging paging, String key);

	public void getBannerList(HashMap<String, Object> paramMap);

	public void getReviewCount(HashMap<String, Object> paramMap);

	public void getReviewsPage(HashMap<String, Object> paramMap);

	public void getQnaList(HashMap<String, Object> paramMap);

	public void getQnaCount(HashMap<String, Object> paramMap);

	public void insertQna(@Valid QnaVO qnavo);

	public void deletetQna(int qseq);
}
