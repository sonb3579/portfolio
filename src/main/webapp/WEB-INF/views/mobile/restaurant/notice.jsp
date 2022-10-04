<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>




<article id="noticeArticle">
	<h1>공지사항</h1>
	<form name="frm" id="noticeForm" method="post">
	
			<table id="noticeSearchBox1">
				<tr>
					<td width="800"><input type="text" name="key" value="${key}">
						<input id="noticeButton1" type="button" name="btn_search" value="검색" 
						onClick="go_search('notice');">
						<input id="noticeButton1" type="button" name="btn_total" value="전체보기" 
						onClick="go_total('notice');">
					</td>
				</tr>
			</table>	
	</form>
	
	<table id="noticeList">
		<tr><th>번호</th><th>제목</th><th>관리자</th><th>작성일시</th></tr>
		<c:forEach items="${noticeList}" var="noticeVO">
			<tr><td height="50" align="center" >${noticeVO.nseq}</td>
				<td height="50" style="text-align:center;">
					<a href="MnoticeDetail?nseq=${noticeVO.nseq}">${noticeVO.subject}</a>
				</td>
				<td height="50" align="center" >${noticeVO.workId}</td>
				<td height="50" align="center" > <fmt:formatDate value="${noticeVO.indate}"/></td>
			</tr>
		</c:forEach>
	</table><br /><br />
	
	
	
</article>

	
	<div id="paging2" align="center" style="font-size:110%; font-weight:bold;">
		<c:if test="${paging.prev}">
			<a href="Mnotice?page=${paging.beginPage-1}">◀</a>&nbsp;
		</c:if>
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="color:orange">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="Mnotice?page=${index}&key=${key}">${index}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="Mnotice?page=${paging.endPage+1}">▶</a>&nbsp;
		</c:if>
	</div>
	
	



<%@ include file="../include/footer.jsp"%>