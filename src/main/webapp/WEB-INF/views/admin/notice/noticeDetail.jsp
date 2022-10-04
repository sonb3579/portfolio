<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<article id="detailBox">
<div id="noticeTitle"><h1>공지사항 관리</h1></div>



<div>
<table id="list">   
	<tr><th align="center" >제목</th><td colspan="4">${dto.subject}</td></tr>
	<tr><th>작성자</th><td width="250">${dto.workId}</td>
		<th>작성일</th><td width="250">${dto.indate}</td>
   	<tr><th>내용</th><td colspan="4"><pre>${dto.content}</pre></td></tr>
</table>


<input class="btn"  type="button" value="수정" onClick="location.href='adminNoticeUpdateForm?nseq=${dto.nseq}'">
<input class="btn"  type="button" value="목록" onClick="location.href='adminNoticeList'">
<input class="btn"  type="button" value="삭제" onClick="location.href='adminNoticeDelete?nseq=${dto.nseq}'">
</div>
</article>

