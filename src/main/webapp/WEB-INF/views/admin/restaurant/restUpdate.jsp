<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>




<article>
	<form name="frm" method="post" enctype="multipart/form-data" id="formList">
	<input type="hidden" name="rseq" value="${restVO.rseq}">
	<input type="hidden" name="oldR_img" value="${imagesVO.r_img}">
	<input type="hidden" name="oldM_img" value="${imagesVO.m_img}">
	<input type="hidden" name="oldS_img" value="${imagesVO.s_img}">
		<table id = "list">
			<tr><th>식당 분류</th>
					<td colspan="2">
						<select name="kind">
							<option value="">선택</option>
							<c:forEach items="${kindList}" var="kind" varStatus="status">
			    				<option value="${status.count}">${kind}</option>
			   				</c:forEach>
						</select>
					</td></tr>
			<tr><th>식당명</th><td width="343" colspan="2">
		       	<input type="text" name="name" size="47" value="${restVO.r_name}" maxlength="100"></td></tr>
			<tr><th>전화번호</th><td width="343" colspan="2"><input type="text" name="phone" size="47" value="${restVO.r_phone }"></td></tr>
			<tr><th>주소</th><td width="343" colspan="2"><input type="text" name="address" size="47" value="${restVO.r_address}"></td></tr>
			<tr><th>지도주소</th><td width="343" colspan="2"><input type="text" name="map" size="47" value="${restVO.r_map }"></td></tr>
		  	<tr><th>영업시간</th><td width="343" colspan="2"><input type="text" name="runtime" size="47" value="${restVO.r_runtime }"></td></tr>
		  	<tr><th>상세설명</th><td width="343" colspan="2"><textarea cols="70" rows="7" name="content">${restVO.r_content }</textarea></td></tr>
		  	<tr><th>승인여부</th><td width="343" colspan="2">
		  		<select name="ryn">
							<c:choose>
								<c:when test = "${restVO.ryn=='y'}">
									<option value="y" selected="selected">y</option>
									<option value="n">n</option>
								</c:when>
								<c:otherwise>
									<option value="y">y</option>
									<option value="n" selected ="selected">n</option>
								</c:otherwise>
							</c:choose>
					</select>
				</td></tr>
			<tr><th>대표메뉴1</th><td width="343" colspan="2"><input type="text" name="r_mname1" size="47" value="${menuVO.r_mname1}"></td></tr>
			<tr><th>대표메뉴1 가격</th><td width="343" colspan="2"><input type="text" name="r_mprice1" size="47" value="${menuVO.r_mprice1}"></td></tr>
			<tr><th>대표메뉴2</th><td width="343" colspan="2"><input type="text" name="r_mname2" size="47" value="${menuVO.r_mname2}"></td></tr>
			<tr><th>대표메뉴2 가격</th><td width="343" colspan="2"><input type="text" name="r_mprice2" size="47" value="${menuVO.r_mprice2}"></td></tr>
				  		
			
		  	<tr><th>식당 이미지</th><td height="200" width="250" colspan="2"><img src = "/images/RestImages/${imagesVO.r_img }" height="200"></td>
		  						 <td><input type="file" name="r_img" ></td></tr> 
			<tr><th>대표메뉴 이미지</th><td height="200" width="250" colspan="2"><img src = "/images/RestImages/${imagesVO.m_img }" height="200"></td>
								 <td><input type="file" name="m_img"></td></tr> 
			<tr><th>추가 이미지</th><td height="200" width="250" colspan="2"><img src = "/images/RestImages/${imagesVO.s_img }" height="200"></td>
								 <td><input type="file" name="s_img"></td></tr>  
		
		</table>
		<input id="rest_save" type="button" value="수정" onClick="go_updateRest('${restVO.rseq}')">           
		<input id="go_list" type="button" value="취소" onClick="location.href='adminRestDetail?rseq=${restVO.rseq}'">
		${message}
		</form>	
				
			
			 
				
		
	
				
</article>













