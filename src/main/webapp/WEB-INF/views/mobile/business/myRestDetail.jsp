<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>


<article>
	<form name="frm" method="post" id="formList">
		<table id="detailList">
			<tr><th>식당 분류</th><td width="600" colspan="3">${restVO.r_kind}</td></tr>
			<tr><th>식당명</th><td width="600" colspan="3" >${restVO.r_name }</td></tr>
			<tr><th>전화번호</th><td width="600" colspan="3">${restVO.r_phone }</td></tr>
			<tr><th>주소</th><td width="600" colspan="3">${restVO.r_address }</td></tr>
			<tr><th>지도주소</th><td width="600" colspan="3">${restVO.r_map }</td></tr>
		  	<tr><th>영업시간</th><td width="600" colspan="3">${restVO.r_runtime }</td></tr>
			<tr><th>상세설명</th><td colspan="3"><textarea cols="70" rows="7" readonly>${restVO.r_content }</textarea></td></tr>
			<tr><th>승인여부</th><td width="600" colspan="3">${restVO.ryn }</td></tr>
					
			<tr><th>대표메뉴1</th><td width="600" colspan="3">${menuVO.r_mname1}&nbsp;&nbsp;&nbsp;가격 : ${menuVO.r_mprice1}</td></tr>
			<tr><th>대표메뉴2</th><td width="600" colspan="3">${menuVO.r_mname2}&nbsp;&nbsp;&nbsp;가격 : ${menuVO.r_mprice2}</td></tr>
					
			<tr><th>식당 이미지</th><td width="300" colspan="3"><img src = "/images/RestImages/${imagesVO.r_img }" height="200"></td></tr> 
			<tr><th>대표메뉴 이미지</th><td width="300" colspan="3"><img src = "/images/RestImages/${imagesVO.m_img }" height="200"></td></tr> 
			<tr><th>추가 이미지</th><td width="300" colspan="3"><img src = "/images/RestImages/${imagesVO.s_img }" height="200"></td></tr>  
		</table>




	<input id="restUpdate" type="button" value="식당 정보 수정" onClick="location.href='MmyRestUpdateForm?rseq=${restVO.rseq}'">
	<input id="go_list" type="button" value="삭제" onClick="location.href='MmyDeleteRest?rseq=${restVO.rseq}'"> 
	<input id="newCheck" type="button" value="예약대기리스트" onClick="location.href='MgetNewCheck?rseq=${restVO.rseq}&second=2'">
	<input id="completeCheck" type="button" value="예약확정리스트" onClick="location.href='MgetCompleteCheck?rseq=${restVO.rseq}&second=2'">
	</form>
</article>

<%@ include file="../business/headerfooter/footer.jsp"%>