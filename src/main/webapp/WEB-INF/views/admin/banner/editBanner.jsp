<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp" %> 
<%@ include file="../../admin/sub_menu.jsp" %>
<article>
<h1>배너 수정</h1><br/>
<form name="frm" method="post" action="editBanner">
	<input type="hidden" name="bseq" value="${bseq}">
	<table id="bannerList">
		<tr><th>제목 </th><td width="642" ><input type="text" name="name" size="47" value="${bannerVO.NAME }"></td></tr>
		<tr><th>순위 </th>
			<td width="642">
				<select name="order_seq">
					<c:forEach items="${orderList}" var="order" varStatus = "status">
						<c:choose>
							<c:when test = "${String.valueOf(bannerVO.ORDER_SEQ) == order}">
								<c:choose>
									<c:when test = "${bannerVO.ORDER_SEQ == '4' }">
										<option value="${bannerVO.ORDER_SEQ }" selected="selected">사용안함</option>
									</c:when>
									<c:otherwise>
										<option value="${bannerVO.ORDER_SEQ }" selected="selected">${order}</option>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test = "${order == '4' }">
										<option value="${order}">사용안함</option>
									</c:when>
									<c:otherwise>
										<option value="${order}">${order}</option>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td></tr>
			<tr><th>배너 이미지</th><td>
					<input type="button" value="파일선택"  onClick="selectimg();" >
					<div id="image" style="float:left"></div>
					<div><input type="hidden" name="imgfilename" value="${bannerVO.IMAGE }"></div>
					<img src="/images/bannerImages/${bannerVO.IMAGE}" id="previewimg" width="500px" style="display:inline" />
				</td></tr>
	</table>
	<input id="noticebtn1"  type="submit" value="등록">   
	<input  id="noticebtn2" type="button" value="취소" onClick="location.href='adminBannerList'">
	</form>
	</article>
