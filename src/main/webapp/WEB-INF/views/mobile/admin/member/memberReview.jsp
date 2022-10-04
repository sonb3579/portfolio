<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../mobile/admin/header.jsp"%>




	<c:choose>
		<c:when test="${empty memberReviewList}">
			<h1>등록한 리뷰가 없습니다. </h1>
		</c:when>
		<c:otherwise>
			<table id="memberReview">
				<tr>
					<th width="200">식당명</th>
					<th width="350">내용</th>
					<th width="100">별점</th>
					<th width="200">작성일자</th>
					<th></th>
				</tr>
			<c:forEach items="${memberReviewList}" var="memReviewVO">
				<tr>
					<td width="100" height="50" align="center">${memReviewVO.r_name}</td>
					<td width="400" height="50">${memReviewVO.content}</td>
					<td width="100" height="50" align="center">${memReviewVO.rating1/2}</td>
					<td width="100" height="50" align="center"><fmt:formatDate value="${memReviewVO.indate}"/></td>
				</tr>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>












