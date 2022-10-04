<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>



<table id="memberDetail">
	<tr>
		<th width="300">식당명</th>
		<th width="400">내용</th>
		<th width="100">별점</th>
		<th width="100">작성일자</th>
		<th></th>
	</tr>
	<c:forEach items="${memberReviewList}" var="memReviewVO">
		<tr>
			<td width="100" height="50" align="center"><h3>${memReviewVO.r_name}</h3></td>
			<td width="400" height="50">${memReviewVO.content}</td>
			<td width="100" height="50" align="center">${memReviewVO.rating1/2}</td>
			<td width="100" height="50" align="center"><fmt:formatDate value="${memReviewVO.indate}"/></td>
			<td><input type="button" value="삭제" 
				onClick="location.href='adminDeleteReview?rwseq=${memReviewVO.rwseq}&id=${memReviewVO.id}'"></td>
		</tr>
	</c:forEach>



</table>








