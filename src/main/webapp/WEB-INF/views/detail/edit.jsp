<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/script/detail.js"></script>
<style type="text/css">
#remove {
	width: 60px;
	height: 40px;
	background: white;
	color: red; font-weight : bold;
	border: 1px solid red;
	border-radius: 5px 5px 5px 5px;
	font-weight: bold;
}

#update {
	width: 60px;
	height: 40px;
	background: white;
	color: blue;
	font-weight: bold;
	border: 1px solid blue;
	border-radius: 5px 5px 5px 5px;
}
</style>
</head>
<body>
	<h3>리뷰 수정/삭제</h3>
	<form method="post" name="editForm2" action="reviewUpdate">
		<input type="hidden" name="rwseq" value="${ReviewVO.RWSEQ }">
		<input type="hidden" name="rseq" value="${ReviewVO.RSEQ }"> <input
			type="hidden" name="id" value="${ReviewVO.ID }"> <input
			type="hidden" name="command" value="updateReview">
		<div class="blank2">
			<table>
				<tr>
					<td><%@ include file="star.jsp"%>&nbsp;<span style="color:red; font-weight:bold;">${message}</span>  </td>
				</tr>
				<tr>
					<td><textarea rows="10" cols="60" name="content">${ReviewVO.CONTENT}</textarea><br></td>
				</tr>
			</table>
		</div>
		<input type="button" id="update" value="수정" onclick="update_click();"
			style="float: left; margin-right: 10px">
	</form>
	<form method="post" name="editForm3" action="reviewDelete">
		<input type="hidden" name="rwseq" value="${ReviewVO.RWSEQ }">
		<input type="hidden" name="rseq" value="${ReviewVO.RSEQ }"> <input
			type="hidden" name="id" value="${ReviewVO.ID }"> <input
			type="button" id="remove" value="삭제" onclick="remove_click();">
	</form>

</body>
</html>