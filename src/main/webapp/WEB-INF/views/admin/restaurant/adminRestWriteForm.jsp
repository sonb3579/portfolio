<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>


<article>
	<form name="frm" method="post" enctype="multipart/form-data">
		<table id="list">
			<tr><th>식당 분류</th>
				<td colspan="5">
					<select name="kind">
						<option value="">선택</option>
						<c:forEach items="${kindList}" var="kind" varStatus="status">
		    				<option value="${status.count}">${kind}</option>
		   				</c:forEach>
					</select>
				</td></tr>
			<tr><th>식당명</th><td width="343" colspan="5">
		       	<input type="text" name="name" size="47" maxlength="100"></td></tr>
			<tr><th>전화번호</th><td width="343"><input type="text" name="phone" size="47" ></td></tr>
			<tr><th>주소</th><td width="343"><input type="text" name="address" size="47"></td></tr>
			<tr><th>지도주소</th><td width="343"><input type="text" name="map" size="47"></td></tr>
		  	<tr><th>영업시간</th><td width="343"><input type="text" name="runtime" size="47"></td></tr>
				
			<tr><th>상세설명</th><td colspan="5">
				<textarea name="content" rows="8" cols="70"></textarea></td></tr>
			<tr><th>대표메뉴1</th><td width="100"><input type="text" name="menu1" size="15"></td>
				<th>가격</th><td width="100"><input type="text" name="menuprice1" size="10"></td></tr>
			<tr><th>대표메뉴2</th><td width="100"><input type="text" name="menu2" size="15"></td>
				<th>가격</th><td width="100"><input type="text" name="menuprice2" size="10"></td></tr>
			<tr><th>식당 이미지</th><td width="343" colspan="5"><input type="file" name="r_img"></td></tr> 
			<tr><th>대표메뉴 이미지</th><td width="343" colspan="5"><input type="file" name="m_img"></td></tr> 
			<tr><th>추가 이미지</th><td width="343" colspan="5"><input type="file" name="s_img"></td></tr>  
		</table>
		<input id="rest_save" type="button" value="등록" onClick="go_save()">           
		<input id="go_list" type="button" value="목록" onClick="history.go(-1)">
	</form>
</article>










