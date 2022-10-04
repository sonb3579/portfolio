package com.ezen.food.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.food.dto.AdminVO;
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;

@Mapper
public interface IAdminDao {

	public AdminVO getAdmin(String workId);

	public List<RestVO> getRest(Paging paging, String key);

	public int getAllRestCount(String key);
	
	public List<MemberVO> getMember(Paging paging, String key);

	public int getAllMemberCount(String key);
	
	public List<NoticeVO> getNotice(Paging paging, String key);

	public int getAllNoticeCount(String key);

	public void insertNotice(NoticeVO noticevo);

	public NoticeVO noticeDetail(int nseq);

	public void updateNotice(NoticeVO noticevo);

	public void deleteNotice(int nseq);

	public MemberVO getMemberDetail(String id);

	public List<ReviewVO> getMemberReview(String id);

	public void deleteMember(HashMap<String, Object> paramMap);

	public void deleteReview(int rwseq);

	public RestVO getRestDetail(int rseq);

	public ImagesVO getImageDetail(int rseq);

	public MenuVO getMenuDetail(int rseq);

	public void updateMenu(MenuVO mvo);

	public void updateRest(RestVO rvo);

	public void updateImage(ImagesVO ivo);

	public void deleteRest(HashMap<String, Object> paramMap);

	public void getBannerList(HashMap<String, Object> paramMap);

	public void insertBanner(HashMap<String, Object> paramMap);

	public void getBannerDetail(HashMap<String, Object> paramMap);

	public void updateBanner(HashMap<String, Object> paramMap);

	public void deleteBanner(int bseq);

	

}
