<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mbusiness.css">
<script src="admin/script/admin.js"></script>
</head>
<body>

	<section class="login-form">
		<h1>Business Login</h1>
		<form name="frm" method="post" action="MbusinessLogin">
			<div class="int-area">
				<input type="text" name="businessId" id="businessId"
					autocomplete="off" required> <label for="workid">Business
					Id</label>
			</div>
			<div class="int-area">
				<input type="password" name="businessPwd" id="businessPwd"
					autocomplete="off" required> <label for="workPwd">Business
					Password</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit" value="로그인">Login</button>
				<br>
				<h4 style="color: red">${message}</h4>
			</div>
		</form>
		<div class="btn-area">
			<button id="btn" type="submit" value="회원가입" onclick="location.href='MbossJoinForm'">JOIN US</button>
		</div>
	</section>
</body>
</html>