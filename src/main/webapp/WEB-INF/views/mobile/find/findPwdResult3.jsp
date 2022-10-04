<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>

<div style="margin: 0 auto; width: 1000px; height: 400px">
	<div style="height: 200px; width: 100%;"></div>
	<div id="fbox2">
		<div id="space">
			<b>${MemberVO.id }(${MemberVO.name })</b>님의 비밀번호는 <b>${MemberVO.pwd }</b>입니다
		</div>
		<div id="findbtn">
			<input type="button" value="로그인페이지 이동" id="fbtn"
				onclick="location.href='MloginForm'">
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>