<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<div id="buffer1"></div>

	<div id="categoryFirst">
		<div class="ctTitle">
			<h2>${kind }</h2>
		</div>
	</div>
	<c:if test="${!empty key}">
		<div id="searchDetailBox">
			<form method="post" name="frm" action="MsearchRestList">
				<input type="text" class="searchBox2" size="35" placeholder="식당명 검색"
					name="key" value="${key}"> <input type="button" value="검색"
					class="searchButton2" onClick="go_rest()">
			</form>
		</div>
	</c:if>

	<div id="restlist">
		<div id="buffer2"></div>

		<div class="view">
			<c:forEach items="${restKindList}" var="RestVO">
				<div id="restbox">
					<a
						href="MdetailForm?rseq=${RestVO.rseq}&kind=${RestVO.r_kind}">
						<div id="restimg">
							<img
								src="/images/RestImages/${RestVO.m_image }" />
						</div>
						<div id="restifbox">
							<h3>${RestVO.r_name}</h3>
							<p>${RestVO.rating /2 }</p>
							<p>${RestVO.r_address}</p>
							<p>${RestVO.r_runtime}</p>
						</div>
					</a>
				</div>
			</c:forEach>


		</div>
	</div>




<%@ include file="../include/footer.jsp"%>