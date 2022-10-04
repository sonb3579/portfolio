<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<div style="height: 100px; width: 100%;"></div>
<div class="blankQ">
<form method = "post" name = "frm" action="qnaWrite">
	<h2>Q&A 쓰기/${r_name }</h2><br/>
	<table id="QnaForm">
		<tr><th>제목</th><td colspan="3"><input type="text" name="subject" size="50" style="width:90%" value="${dto.subject }"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="id" value="${loginUser.id}" readonly ></td></tr>
		<tr><th>공개여부</th><td>비공개 :&nbsp;<input type="radio" name="qyn" value="y">&nbsp;&nbsp;공개 :&nbsp;<input type="radio" name="qyn" value="n" checked> </td></tr>
		<tr><th>내용</th><td colspan="3"><textarea name="content" rows="10" cols="50" style="width:90%; border: none">${dto.content}</textarea></td></tr>
	</table>
	<input type="hidden" value="${RestVO.RSEQ }" name="rseq">
	<input type="hidden" value="${RestVO.R_NAME }" name="r_name">
	<input type="hidden" value="${RestVO.BUSINESSID }" name="businessId">
	<input type="submit" id="noticebtn1" value="등록">
	<input type="button" id="noticebtn2" value="돌아가기" onClick="history.go(-1)"> 
	${message}
</form>
</div>

<%@ include file="../include/headerfooter/footer.jsp"%>