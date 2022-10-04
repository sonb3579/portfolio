<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../mobile/admin/header.jsp"%>
<article id="detailBox">
<div id="noticeTitle"><h1>공지사항 관리</h1></div>



<div>
<table id="list">   
	<tr><th align="center" ><h1>제목</h1></th><td colspan="4">${dto.subject}</td></tr>
	<tr><th><h1>작성자</h1></th><td width="170">${dto.workId}</td>
		<th><h1>작성일</h1></th><td width="170">${dto.indate}</td>
   	<tr><th><h1>내용</h1></th><td colspan="4"><pre>${dto.content}</pre></td></tr>
</table>



<input class="btn"  type="button" value="목록" onClick="location.href='madminNoticeList'">

</div>
</article>

