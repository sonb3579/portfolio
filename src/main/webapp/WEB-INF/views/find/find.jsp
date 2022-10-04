<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<div style="height: 100px; width: 100%;"></div>
<div style="margin:0 auto;width:1000px;height:600px">
	<div id="fbox">
		<form action="findId" method="post">
		<div id="space"><h2>아이디 찾기</h2><hr></div>
			<div id="space">
				<h3>이름</h3>
			</div>
			<div id="findinput">
				<input type="text" name="find_name" placeholder="ex) 김철수" id="fin">
			</div>
			<div id="space">
				<h3>전화번호</h3>
			</div>
			<div id="findinput">
				<input type="text" name="find_tel" placeholder="ex) 010-1234-1234" id="fin">
			</div>
			<div id="space"></div>
			<div id="findbtn">
				<input type="submit" value="아이디 찾기" id="fbtn">
			</div>
			<div id ="space">&nbsp;&nbsp;&nbsp;${msg}</div>
		</form>
	</div>
	
	<div id="fbox">
		<form action="findPw" method="post">
		<div id="space"><h2>비밀번호 찾기</h2><hr></div>
			<div id="space">
				<h3>아이디</h3>
			</div>
			<div id="findinput">
				<input type="text" name="find_id" placeholder="ex) kim1234" id="fin">
			</div>
			<div id="space">
				<h3>전화번호</h3>
			</div>
			<div id="findinput">
				<input type="text" name="find_tel" placeholder="ex) 010-1234-1234" id="fin">
			</div>
			<div id="space"></div>
			<div id="findbtn">
				<input type="submit" value="비밀번호 찾기" id="fbtn" onclick="confirm_p();">
			</div >
			<div id ="space">&nbsp;&nbsp;&nbsp;${msg2}</div>
		</form>
	</div>
</div>
<%@ include file="../include/headerfooter/footer.jsp" %>