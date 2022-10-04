<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<div id="dtbox" style="text-align: left;">
	<br>
	<h1>
		&nbsp;&nbsp;${RestVO.R_NAME }&nbsp;<span
			style="font-size: 40%; color: gray;">${RestVO.R_KIND }&nbsp;/&nbsp;${RestVO.R_ADDRESS }</span>
	</h1>
	<br>

	<!--  리뷰 작성 -->
		<form method="post"
			action="reviewSubmit?kind=${RestVO.R_KIND }"
			name="reviewForm">
			<div class="blank2">
				<input type="hidden" name="id" value="${loginUser.id }">
				<h3>&nbsp;REVIEW&nbsp;<span style="color:red;">${message}</span></h3><hr>
				<table>
					<tr>
						<td>&nbsp;<%@ include file="star.jsp"%><br>
							<div style="height: 10px; width: 100%;"></div></td>
					</tr>
					<tr>
						<td ><textarea rows="5" cols="120" name="content"></textarea><br></td>

						<td width="60" height="90">&nbsp;&nbsp;<input type="hidden" name="rseq"
							value="${RestVO.RSEQ }"> <input type="submit"
							id="rvbutton" value="등록" onclick="reviewCheck();">
						</td>
					</tr>
				</table>
			</div>
		</form>
	<div style="height: 50px; width: 100%;"></div>

	<!-- forEach 사용해서 등록되있는 리뷰 모두 출력 -->
	<form method="post" name="editForm">
		<div class="blank3">
			<c:forEach items="${reviewList}" var="revVO" begin="0" end="4"
				step="1">
				<div id="reviewbox">
					<div id="reviewstar">
						<div style="margin-top: 30px;">
							&nbsp;<span style="font-size: 150%;">&#127775;</span>&nbsp;<br>
							<span style="font-weight: blod; color: orange; margin: 0 auto;">${revVO.RATING1 /2}</span>
						</div>
					</div>

					<div id="reviewid">
						<span>${revVO.ID}</span>&nbsp;&nbsp; <span
							style="color: gray; font-size: 50%;"><fmt:formatDate
								value="${revVO.INDATE}" type="date" /></span>
					</div>

					<div id="reviewedit">
						<c:choose>
							<c:when test="${revVO.ID==loginUser.id}">
								<input type="button" id="rvbutton2"
									onclick="edit_click('${revVO.RWSEQ}');" value="edit">
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="reviewcontent">
						<span>${revVO.CONTENT}</span>
					</div>
				</div>
				<div style="height: 10px; width: 100%;"></div>
			</c:forEach>
		</div>
	</form>
	<div style="height: 50px; width: 100%;"></div>
	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="command" value="moreReview&rseq=${rseq }" />
	</jsp:include>
</div>
</form>
<div style="height: 50px; width: 100%;"></div>
</div>

<%@ include file="../include/headerfooter/footer.jsp"%>