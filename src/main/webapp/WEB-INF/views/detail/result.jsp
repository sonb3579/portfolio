<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정/삭제 결과</title>
<script src="/script/detail.js"></script>
<style type="text/css">
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
	<h3>수정/삭제가 완료 되었습니다</h3>
	<input type="hidden" name="rseq" value="${rseq }">
	<input type="button" id="update" value="닫기" onclick="close_click('${rseq }');">
	
</body>
</html>