<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/adminLogin.css">
<script src="/script/admin.js"></script>
</head>
<body>

   <section class="login-form">
	<h1>Admin Login</h1>
			<form name="frm" method="post" action="adminLogin">
				<div class="int-area">
					<input type="text" name="workId" id="workId" autocomplete="off" required>
					<label for="workid">Worker Id</label>
				</div>
				<div class="int-area">
					<input type="password" name="workPwd" id="workPwd" autocomplete="off" required>
					<label for="workPwd">Worker Password</label>
					</div>
					<div class="btn-area">	
							<button id="btn" type="submit" value="로그인" >Login</button>
							<br><br><h4 style="color:red">${message}</h4>
							</div>
			</form>
	</section>
</body>
</html>