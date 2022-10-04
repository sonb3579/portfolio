<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>

<div id="test">
<div style="height: 160px; width: 100%;"></div>
<h2>Q&A 리스트</h2>
<br>
<br>
<table id="restList">
	<tr class="success">
		<th width="100">번호</th>
		<th width="100">답변여부</th>
		<th width="200">제목</th>
		<th width="100">작성자</th>
		<th width="200">작성일</th>
	</tr>
	<c:forEach items="${qnaList}" var="qna">
		<tr height="50">

			<c:choose>
				<c:when test="${qna.reply==NULL }">
					<td>${qna.qseq }</td>
					<td><span style="color: red;">(미처리)</span></td>
				</c:when>
				<c:otherwise>
					<td>${qna.qseq }</td>
					<td><span>(답변처리완료)</span></td>
				</c:otherwise>
			</c:choose>

			<td><a href="Mboss_qna_detail?qseq=${qna.qseq}">${qna.subject }</a></td>
			<td>${qna.id }</td>
			<td><fmt:formatDate type="date" value="${qna.indate }" /></td>
		</tr>
	</c:forEach>
</table>
<br>
<br>
<div id="paging" align="center"
	style="font-size: 110%; font-weight: bold;">
	<c:if test="${paging.prev}">
		<a href="MmyRestQnaList?page=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	<c:forEach begin="${paging.beginPage}" end="${paging.endPage}"
		var="index">
		<c:choose>
			<c:when test="${paging.page==index}">
				<span style="color: orange">${index}&nbsp;</span>
			</c:when>
			<c:otherwise>
				<a href="MmyRestQnaList?page=${index}&key=${key}">${index}</a>&nbsp;
	            </c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.next}">
		<a href="MmyRestQnaList?page=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>

</div>
</div>



<%@ include file="../business/headerfooter/footer.jsp"%>