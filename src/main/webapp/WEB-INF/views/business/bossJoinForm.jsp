<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>

<section class="join-form">
		<h2>회원가입</h2>
		<h3 style="color:red">${message }</h3>
			<form method = "post" name="joinForm" id="join_box" action="joinBoss">
			<div class="input-area">
			<p>아이디<span style="color:gray; font-size:90%;">&nbsp;아이디는 자동 생성됩니다.</span></p>
				 <input type="text" placeholder="아이디 입력" name="businessId" id="input_id" value="${businessId }">
			</div>
			<div class="input-area">
				<p>비밀번호</p>
				<input type= "password" placeholder="비밀번호 입력" name="businessPwd" id="input_pwd">
			</div>
			<div class="input-area">
				<p>비밀번호 확인</p>
				<input type= "password" placeholder="비밀번호 확인" name="pwd_check" id="pwd_check">
			</div>
			<div class="input-area">
				<p>이름</p>
				<input type="text" placeholder="이름" name="name" id="input_name" value="${dto.name }">
			</div>
			<div class="input-area">
				<p>이메일</p>
				<input type= "text" name="email" placeholder="이메일 입력" id="input_email" value="${dto.email }">
			</div>
			<div class="input-area">
				<p>전화번호</p>
				<input type= "text" name="phone" placeholder="전화번호 입력" id="input_phone" value="${dto.phone }">
			</div>

	<div id="clear"></div><br><br>
	<input type="submit" value="회원가입" id="join_button_2">
	<br><br>
</form>
</section>



<%@ include file="../business/headerfooter/footer.jsp"%>