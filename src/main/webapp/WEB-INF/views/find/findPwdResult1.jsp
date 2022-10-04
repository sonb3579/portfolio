<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<div style="margin: 0 auto; width: 1000px; height: 500px">
	<div style="height: 200px; width: 100%;"></div>
	<form action="findPw2" method="post">
		<div id="fbox2">
			<div id="space">
				<b>${MemberVO.phone }</b> 으로 인증번호를 전송합니다.
			</div>
			<div id="findinput">
				<input type="text" name="chk_num" placeholder="인증번호를 입력하세요" id="fin">
			</div>
			<div style="height: 20px; width: 100%;"></div>
			<div id="findbtn">
				<input type="submit" value="인증확인" id="fbtn">
			</div>
			<div style="height: 20px; width: 100%;"></div>
			<div id="findbtn">
				<input type="button" value="로그인 페이지로 이동" id="fbtn"
					onclick="location.href='loginForm'">
			</div>
		</div>
		<div id ="space">&nbsp;&nbsp;&nbsp;${msg}</div>
		<input type="hidden" name="id" value="${MemberVO.id }">
		<input type="hidden" name="phone" value="${MemberVO.phone }">
	</form>
</div>
<%@ include file="../include/headerfooter/footer.jsp"%>