<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="clear"></div>
<article>
	<h1>Login</h1>
	<form action="Mlogin" method="post">
		<fieldset>
				<label> User ID </label><input name="id" type="text" value="${dto.id}"><br> 
		        <label> Password </label><input name="pwd" type="password"><br>
		</fieldset>
		<div id="buttons">
	        <input type="submit" value="로그인" class="submit">
	        <input type="button" value="회원가입" class="cancel"  onClick="location.href='MjoinForm'">
			<input type="button" value="아이디/비밀번호찾기" class="cancel"  onClick="location.href='MfindForm'">
	    </div><br><br>
	    <div id ="message">&nbsp;&nbsp;&nbsp;${message}</div>
	</form>

	
	
</article>
<div id ="loginBox"></div>

<%@ include file="../include/footer.jsp"%>