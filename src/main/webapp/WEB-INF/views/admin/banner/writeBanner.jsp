<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp" %> 
<%@ include file="../../admin/sub_menu.jsp" %>
<article>
<h1>배너 등록</h1>  
<form name="frm" >
	<table id="bannerList">
		<tr><th>제목 </th><td width="642" ><input type="text" name="name" size="47" ></td></tr>
		<tr><th>순위 </th>
			<td width="642">
				<select name="order_seq">
					<option value="">디스플레이될 순서를 선택하세요 </option>
					<option value="1">1</option><option value="2">2</option><option value="3">3</option>
					<option value="4">사용안함 </option>
				</select>
			</td></tr>
			<tr><th>배너 이미지</th><td>
					<input type="button" value="파일선택"  onClick="selectimg();" >
					<div id="image" style="float:left"></div>
					<div><input type="hidden" name="imgfilename" ></div>
					<img src="" id="previewimg" width="500px" style="display:none" />
				</td></tr>
	</table>
	<input id="noticebtn1"  type="button" value="등록" onClick="go_banner_save()">   
	<input  id="noticebtn2" type="button" value="취소" onClick="location.href='adminBannerList'">
	</form>
	</article>
