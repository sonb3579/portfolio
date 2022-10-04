<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>

<form method = "post" name = "frm" action="adminNoticeWrite">
	
	
	<h2>공지사항 등록</h2><br/>
	<table id="updateForm">
		<tr><th>제목</th><td colspan="3"><input type="text" name="subject" size="50" style="width:90%" value="${dto.subject }"></td></tr>
		<tr><th>관리자</th><td><input type="text" name="workId" value="${loginAdmin.workId}" readonly ></td>
		<tr><th>내용</th><td colspan="3"><textarea name="content" rows="10" cols="50" style="width:90%; border: none" value="${dto.content}"></textarea></td></tr>
	</table>
	<input type="submit" id="noticebtn1" value="등록">
	<input type="button" id="noticebtn2" value="취소" onClick="location.href='adminNoticeList'"> 
	${message}
</form>




