package com.ezen.food.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.food.dto.BusinessVO;
import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;
@Mapper
public interface IBusinessDao {
	
	public BusinessVO getBusiness(String businessId);
	//-----0824 수정
	public List<RestVO> getMyRestList(Paging paging, String key, String businessId);//--여기까지

	public int getAllCount(String key, String businessId);

	public RestVO getRestList(String businessId);

	public MenuVO getMenuDetail(int rseq);

	public RestVO getRestDetail(int rseq);

	public ImagesVO getImageDetail(int rseq);

	public int getAllQnaCount( String businessId);

	public List<QnaVO> getQna(Paging paging, String businessId);

	public QnaVO qnaDetail(int qseq);

	public void insertQnaReply(QnaVO qnavo);
	
	public void businessJoin(BusinessVO businessvo);
	
	public BusinessVO idCheck(String businessId);
	
	public int getAllCheckCount1(int rseq);
	
	public int getAllCheckCount2(int rseq);
	
	public List<CheckRestVO> getNewCheck(Paging paging, int rseq);

	public List<CheckRestVO> getCompleteCheck(Paging paging, int rseq);
	
	public void restConfirm(int cseq);
	
	public void cancelConfirm(int cseq);

	public void insertRest(RestVO rvo);
	
	public void insertMenu(MenuVO mvo);
	
	public void insertImage(ImagesVO ivo);
	
	public int getRseq(String r_name, String businessId);
	
	public void updateMenu(MenuVO mvo);
	
	public void updateRest(RestVO rvo);
		
	public void updateImage(ImagesVO ivo);

	public void myDeleteRest(HashMap<String, Object> paramMap);
}
