<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>


<article id="noticeArticle">
<h1>공지사항</h1>
<table id="noticeDetail">   
	<tr><th align="center" height="50" >제목</th><td colspan="4">${dto.subject}</td></tr>
	<tr><th height="50">작성일</th><td colspan="4" >${dto.indate}</td>
   	<tr><th height="300">내용</th><td colspan="4" ><pre>${dto.content}</pre></td></tr>
</table>

<input id="noticeButton2"  type="button" value="목록" onClick="location.href='Mnotice'">

</article>


<%@ include file="../include/footer.jsp"%>