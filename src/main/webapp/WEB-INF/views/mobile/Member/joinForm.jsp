<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

	<section class="join-form">
		<h2>회원가입</h2>
			<form method = "post" name="joinForm" id="join_box" action="Mjoin">
			<div class="input-area">
			<p>아이디</p><br/>
				 <input type="text" placeholder="아이디 입력" name="id" id="input_id"><input type= "hidden" name="reid" >
  				 <input type="button" value="중복확인" class="dup" onClick="idcheck()" id="idcheck_button">
			</div>
			<div class="input-area">
				<p>비밀번호</p><br/>
				<input type= "password" placeholder="비밀번호 입력" name="pwd" id="input_pwd">
			</div>
			<div class="input-area">
				<p>비밀번호 확인</p><br/>
				<input type= "password" placeholder="비밀번호 확인" name="pwd_Check" id="pwd_check">
			</div>
			<div class="input-area">
				<p>이름</p><br/>
				<input type="text" placeholder="이름" name="name" id="input_name">
				<div id="gender">
				남성<input type= "radio" name="gender" value="M" id="join_gen">&nbsp;&nbsp;
				여성<input type= "radio" name="gender" value="F" id="join_gen">
				</div>
			</div>
			<div class="input-area">
				<p>이메일</p><br/>
				<input type= "text" name="email" placeholder="이메일 입력" id="input_email">
			</div>
			<div class="input-area">
				<p>전화번호</p><br/>
				<input type= "text" name="phone" placeholder="전화번호 입력" id="input_phone">
			</div>

	<div id="clear"></div><br><br>
	<input type="submit" value="회원가입" id="join_button_2" onClick="return joinCheck()">
	<br><br>
</form>
</section>



<%@ include file="../include/header.jsp"%>