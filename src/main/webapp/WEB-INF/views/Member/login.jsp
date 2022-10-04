<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<div class="clear"></div>
<article>
	<h1>Login</h1>
	<form action="login" method="post">
		<fieldset>
				<label> User ID </label><input name="id" type="text" value="${dto.id}"><br> 
		        <label> Password </label><input name="pwd" type="password"><br>
		</fieldset>
		<div id="buttons">
	        <input type="submit" value="로그인" class="submit">
	        <input type="button" value="회원가입" class="cancel"  onClick="location.href='joinForm'">
			<input type="button" value="아이디/비밀번호찾기" class="cancel"  onClick="location.href='findForm'">
	    </div><br><br>
	    <div id ="message">&nbsp;&nbsp;&nbsp;${message}</div>
	</form>

	
	
</article>


<%@ include file="../include/headerfooter/footer.jsp"%>