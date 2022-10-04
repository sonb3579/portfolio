<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../mobile/admin/header.jsp"%>
<article id="detailBox">
<div id= "title"><h1>회원 정보</h1></div>

<div>
<table id="memberDetail">
	<tr><th>아이디</th><td height="150">${memberVO.id}</td></tr>
	<tr><th>이름</th><td height="150">${memberVO.name}</td></tr>
	<tr><th>성별</th><td height="150">${memberVO.gender }</td></tr>
	<tr><th>email</th><td height="150">${memberVO.email}</td></tr>
	<tr><th>전화번호</th><td height="150">${memberVO.phone}</td></tr>
	<tr><th>리뷰모아보기</th><td height="150"><a href="#" onClick="location.href='madminMemberReview?id=${memberVO.id}'">회원이 작성한 리뷰 보기</a></td>
</table>
	<input type="button" id="outMember1" value="회원탈퇴" onClick="location.href='madminMemberOut?id=${memberVO.id}'">
	<input type="button" id="outMember2" value="회원목록" onClick="location.href='madminMemberList'">
	
</div>








</article>
