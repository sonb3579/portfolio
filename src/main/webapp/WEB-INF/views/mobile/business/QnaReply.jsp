<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>
<div>
	<div style="height: 160px; width: 100%;"></div>
	<div class="blankQ">
		<form method="post" name="frm" action="MinsertQnaReply">
			<h2>답변 작성하기</h2>
			<br />
			<table id="QnaForm">
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="subject" size="50"
						style="width: 90%" value="${dto.subject }" readonly></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="id"
						value="${loginBusiness.businessId}" readonly></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><p>${dto.content }</p></td>
				</tr>
				<tr>
					<th>답글</th>
					<td colspan="3"><textarea name="reply" rows="5" cols="50"
							style="width: 90%; border: none">${dto.reply }</textarea></td>
				</tr>
			</table>
			<input type="hidden" value="${dto.qseq }" name="qseq"> <input
				type="submit" id="noticebtn1" value="등록/수정"> <input
				type="button" id="noticebtn2" value="돌아가기" onClick="history.go(-1)">
			${message}
		</form>
	</div>
</div>
<%@ include file="../business/headerfooter/footer.jsp"%>