<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>

<form method = "post" name = "frm" action="adminNoticeUpdate">
	<input type="hidden" name="nseq" value="${dto.nseq}">
	
	<h2>공지사항 수정</h2><br/>
	<table id="updateForm">
		<tr><th>제목</th><td colspan="3"><input type="text" name="subject" size="50" style="width:90%" value="${dto.subject }"></td></tr>
		<tr><th>관리자</th><td><input type="text" name="id" value="${dto.workId}" readonly></td>
			<th>작성일자</th><td><input type="text" name="indate" value="${dto.indate}" readonly></td></tr>
		<tr><th>내용</th><td colspan="3"><textarea name="content" rows="10" cols="50" style="width:90%; border: none">${dto.content}</textarea></td></tr>
	</table>
	<input type="submit" id="noticebtn1" value="수정">
	<input type="button" id="noticebtn2" value="취소" onClick="location.href='adminNoticeDetail?nseq=${dto.nseq}'"> 
	${message}
</form>









