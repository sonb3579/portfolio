<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../mobile/admin/header.jsp"%>

<link href="admin/css/admin.css" rel="stylesheet"> 




<article>
	<div id="menuTitle"><h1>공지사항 관리</h1></div>
	<form name="frm"  method="post"> 
			<table id="searchBox">
				<tr>
					<td width="642"><input type="text" name="key" value="${key}">
						<input class="btn" type="button" name="btn_search" value="검색" 
						onClick="go_search('madminNoticeList');">
						<input class="btn" type="button" name="btn_total" value="전체보기" 
						onClick="go_total('madminNoticeList');">
					</td>
				</tr>
			</table>	
	</form>
	
	<table id="restList">
		<tr><th>번호</th><th>제목</th><th>관리자</th><th>작성일시</th></tr>
		<c:forEach items="${noticeList}" var="noticeVO">
			<tr><td height="50" align="center" >${noticeVO.nseq}</td>
				<td height="50" style="text-align:center;">
					<a href="madminNoticeDetail?nseq=${noticeVO.nseq}">${noticeVO.subject}</a>
				</td>
				<td height="50" align="center" >${noticeVO.workId}</td>
				<td height="50" align="center" > <fmt:formatDate value="${noticeVO.indate}"/></td>
			</tr>
		</c:forEach>
	</table><br /><br />
	
	
	
</article>

	
	<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
		<c:if test="${paging.prev}">
			<a href="madminNoticeList?page=${paging.beginPage-1}">◀</a>&nbsp;
		</c:if>
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:choose>
				<c:when test="${paging.page==index}">
					<span style="color:orange">${index}&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="madminNoticeList?page=${index}&key=${key}">${index}</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<a href="madminNoticeList?page=${paging.endPage+1}">▶</a>&nbsp;
		</c:if>
	</div>
	
	









