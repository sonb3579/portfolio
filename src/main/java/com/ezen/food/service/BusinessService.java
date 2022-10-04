package com.ezen.food.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.food.dao.IBusinessDao;
import com.ezen.food.dto.BusinessVO;
import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;

@Service
public class BusinessService {

	@Autowired
	IBusinessDao bdao;

	public BusinessVO getBusiness(String businessId) {

		return bdao.getBusiness(businessId);
	}

	public HashMap<String, Object> getMyRestList(int page, String key, String businessId) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		int count = bdao.getAllCount(key, businessId);
		paging.setTotalCount(count);
		paging.setDisplayPage(5);
		paging.setDisplayRow(5);
		paging.paging();

		List<RestVO> myRestList = bdao.getMyRestList(paging, key, businessId);
		result.put("myRestList", myRestList);
		result.put("paging", paging);

		return result;
	}

	public RestVO getRest(String businessId, Paging paging) {
		return bdao.getRestList(businessId);
	}

	public RestVO getRestDetail(int rseq) {

		return bdao.getRestDetail(rseq);
	}

	public ImagesVO getImageDetail(int rseq) {

		return bdao.getImageDetail(rseq);
	}

	public MenuVO getMenuDetail(int rseq) {

		return bdao.getMenuDetail(rseq);
	}

	
	public HashMap<String, Object> getQnaList(int page, String businessId) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		Paging paging = new Paging();
		paging.setPage(page);

		int count = bdao.getAllQnaCount( businessId);
		paging.setTotalCount(count);
		paging.paging();

		List<QnaVO> qnaList = bdao.getQna(paging, businessId);
		result.put("qnaList", qnaList);
		result.put("paging", paging);
		return result;
	}

	public QnaVO qnaDetail(int qseq) {
		return bdao.qnaDetail(qseq);
	}

	public void insertQnaReply(QnaVO qnavo) {
		bdao.insertQnaReply(qnavo);
	}

	public void businessJoin(BusinessVO businessvo) {
		bdao.businessJoin(businessvo);
	}

	public BusinessVO idCheck(String businessId) {
		return bdao.idCheck(businessId);
	}

	public HashMap<String, Object> getNewCheck(int page, int rseq) {
		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);

		int count = bdao.getAllCheckCount1(rseq);
		paging.setTotalCount(count);
		paging.paging();
		
		List<CheckRestVO> newCheckList = bdao.getNewCheck(paging, rseq);
		result.put("paing", paging);
		result.put("getNewCheck", newCheckList);
		return result;
	}
	
	public HashMap<String, Object> getCompleteCheck(int page, int rseq) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Paging paging = new Paging();
		paging.setPage(page);
		
		int count = bdao.getAllCheckCount2(rseq);
		paging.setTotalCount(count);
		paging.paging();
		
		List<CheckRestVO> completeCheckList = bdao.getCompleteCheck(paging, rseq);
		result.put("completeCheck", completeCheckList);
		result.put("paging", paging);
		
		return result;
	}

	public void restConfirm(int cseq) {
		bdao.restConfirm(cseq);
	}

	public void cancelConfirm(int cseq) {
		bdao.cancelConfirm(cseq);
	}
	
	public void insertRest(RestVO rvo) {
		bdao.insertRest(rvo);
	}

	public void insertMenu(MenuVO mvo) {
		bdao.insertMenu(mvo);
	}

	public void insertImage(ImagesVO ivo) {
		bdao.insertImage(ivo);
	}

	public int getRseq(String r_name, String businessId) {
		return bdao.getRseq(r_name,businessId);
	}
	
	public void updateMenu(MenuVO mvo) {
		bdao.updateMenu(mvo);
		
	}

	public void updateRest(RestVO rvo) {
		bdao.updateRest(rvo);
		
	}

	public void updateImage(ImagesVO ivo) {
		bdao.updateImage(ivo);
		
	}
	public void myDeleteRest(HashMap<String, Object> paramMap) {
		bdao.myDeleteRest(paramMap);
		
	}
}