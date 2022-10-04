<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="dtbox" style="text-align: left;">
	<br>
	<h1>식당문의/${r_name }</h1>
	<br>

	<div id="moreReview">
		<input type="button"
			onclick="location.href='MwriteQna?rseq=${rseq}&r_name=${r_name }'"
			value="Q&A 작성하기" id="Qselector3">
	</div>
	
	<div style="height: 100px; width: 100%;"></div>

	<!-- forEach 사용해서 등록되있는 QNA 모두 출력 -->
	<div class="blank3">
		<c:forEach items="${qnaList}" var="qnaVO">
			<c:choose>
				<c:when test="${qnaVO.QYN=='n'}">
					<div id="reviewbox">
						<div id="qnaUser">질문</div>

						<div id="reviewid">
							<span>${qnaVO.SUBJECT}(${qnaVO.ID})</span>&nbsp;&nbsp; <span
								style="color: gray; font-size: 50%;"><fmt:formatDate
									value="${qnaVO.INDATE}" type="date" /></span>
						</div>

						<div id="reviewedit">
							<c:choose>
								<c:when test="${qnaVO.ID==loginUser.id}">
									<input type="button" id="rvbutton2"
										onclick="qnaDelete('${qnaVO.QSEQ}');" value="삭제">
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="reviewcontent">
							<span>${qnaVO.CONTENT}</span>
						</div>
					</div>
				</c:when>

				<c:when test="${qnaVO.ID==loginUser.id}">
					<div id="reviewbox">
						<div id="qnaUser">질문</div>

						<div id="reviewid">
							<span>${qnaVO.SUBJECT}(${qnaVO.ID})</span>&nbsp;&nbsp; <span
								style="color: gray; font-size: 50%;"><fmt:formatDate
									value="${qnaVO.INDATE}" type="date" /></span>
						</div>

						<div id="reviewedit">
							<c:choose>
								<c:when test="${qnaVO.ID==loginUser.id}">
									<input type="button" id="rvbutton2"
										onclick="qnaDelete('${qnaVO.QSEQ}');" value="삭제">
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="reviewcontent">
							<span>${qnaVO.CONTENT}</span>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div id="reviewbox">
						<div id="qnaUser">질문</div>
						<div id="reviewid">
							<span>비밀글입니다(익명)</span>&nbsp;&nbsp; <span
								style="color: gray; font-size: 50%;"><fmt:formatDate
									value="${qnaVO.INDATE}" type="date" /></span>
						</div>
						<div id="reviewcontent">
							<span style="color: gray">비밀글입니다</span>
						</div>
					</div>
				</c:otherwise>
			</c:choose>



			<div style="height: 10px; width: 100%;"></div>
			<c:choose>
				<c:when test="${qnaVO.REPLY!=null}">

					<c:choose>
						<c:when test="${qnaVO.QYN=='n'}">
							<div id="reviewbox">
								<div id="qnaBoss">답변</div>

								<div id="reviewid">
									<span>${qnaVO.SUBJECT}(${qnaVO.BUSINESSID})</span>&nbsp;&nbsp; <span
										style="color: gray; font-size: 50%;"><fmt:formatDate
											value="${qnaVO.INDATE}" type="date" /></span>
								</div>

								<div id="reviewcontent">
									<span>${qnaVO.REPLY}</span>
								</div>
							</div>
						</c:when>

						<c:when test="${qnaVO.ID==loginUser.id}">
							<div id="reviewbox">
								<div id="qnaBoss">답변</div>

								<div id="reviewid">
									<span>${qnaVO.SUBJECT}(${qnaVO.BUSINESSID})</span>&nbsp;&nbsp; <span
										style="color: gray; font-size: 50%;"><fmt:formatDate
											value="${qnaVO.INDATE}" type="date" /></span>
								</div>

								<div id="reviewcontent">
									<span>${qnaVO.REPLY}</span>
								</div>
							</div>
						</c:when>

						<c:otherwise>

							<div id="reviewbox">
								<div id="qnaBoss">답변</div>
								<div id="reviewid">
									<span>비밀글입니다(${qnaVO.BUSINESSID})</span>&nbsp;&nbsp; <span
										style="color: gray; font-size: 50%;"><fmt:formatDate
											value="${qnaVO.INDATE}" type="date" /></span>
								</div>
								<div id="reviewcontent">
									<span style="color: gray">비밀글입니다</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:otherwise>
				</c:otherwise>

			</c:choose>
			<div style="height: 10px; width: 100%;"></div>
		</c:forEach>
	</div>

	<div style="height: 50px; width: 100%;"></div>

	<jsp:include page="../include/paging/paging.jsp">
		<jsp:param name="command" value="MrestQna&rseq=${rseq }" />
	</jsp:include>
</div>

<div style="height: 50px; width: 100%;"></div>


<%@ include file="../include/footer.jsp"%>