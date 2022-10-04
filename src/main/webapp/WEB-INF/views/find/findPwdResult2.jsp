<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<div style="margin: 0 auto; width: 1000px; height: 400px">
	<div style="height: 200px; width: 100%;"></div>
	<form action="findPw" method="post">
		<input type="hidden" name="id" value="${MemberVO.id }">
		<div id="fbox2">
			<div id="space">
				<b>${MemberVO.phone }</b> 으로 인증번호를 전송합니다.
			</div>
			<div id="findinput">
				<input type="text" name="chk_num" placeholder="인증번호를 입력하세요" id="fin">
			</div>
			<div style="height: 20px; width: 100%;"></div>
			<div id="findbtn">
				<input type="button" value="인증확인" id="fbtn"
					onclick="findPw2();">
			</div>
		</div>
	</form>
</div>
<%@ include file="../include/headerfooter/footer.jsp"%>