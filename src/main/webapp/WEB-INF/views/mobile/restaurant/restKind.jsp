<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

	<div id="buffer1"></div>

	<div id="categoryFirst">
		<div class="ctTitle">
			<h2>${kind}</h2>
		</div>
	</div>
	<c:if test="${!empty key}">
		<div id="searchDetailBox">
			<form method="post" name="frm" action="">
				<input type="text" class="searchBox2" size="35" placeholder="식당명 검색"
					name="key" value="${key}"> <input type="button" value="검색"
					class="searchButton2" onClick="go_rest('searchRestList')">
			</form>
		</div>
	</c:if>

	<div id="restlist">
		<div id="buffer2"></div>

		<div class="view">
			<c:forEach items="${restKindList}" var="RestVO">
				<div id="restbox">
					<a href="MdetailForm?rseq=${RestVO.RSEQ}&kind=${RestVO.R_KIND}">
						<div id="restimg">
							<img
								src="/images/RestImages/${RestVO.M_IMAGE }" />
						</div>
						<div id="restifbox">
							<h3>${RestVO.R_NAME}</h3>
							<p>${RestVO.RATING /2 }</p>
							<p>${RestVO.R_ADDRESS}</p>
							<p>${RestVO.R_RUNTIME}</p>
						</div>
					</a>
				</div>
			</c:forEach>


		</div>
	</div>
	<div>
		<jsp:include page="../include/paging/paging.jsp">
			<jsp:param name="command"
				value="Mcategory?kind=${kind}" />
		</jsp:include>
	</div>


<%@ include file="../include/footer.jsp"%>