<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>
<article id="detailBox">
<div><h1>회원 정보</h1></div>

<div>
<table id="memberDetail">
	<tr><th>아이디</th><td height="50"><input type="text" name="id" value="${memberVO.id}" readonly></td></tr>
	<tr><th>이름</th><td height="50"><input type="text" name="name" value="${memberVO.name}" readonly></td></tr>
	<tr><th>성별</th><td height="50"><input type="text" name="gender" value="${memberVO.gender }" readonly></td></tr>
	<tr><th>email</th><td height="50"><input type="text" name="email" value="${memberVO.email}" readonly></td></tr>
	<tr><th>전화번호</th><td height="50"><input type="text" name="phone" value="${memberVO.phone}" readonly></td></tr>
	<tr><th>리뷰모아보기</th><td height="50"><a href="#" onClick="location.href='adminMemberReview?id=${memberVO.id}'">회원이 작성한 리뷰 보기</a></td>
</table>
	<input type="button" id="outMember1" value="회원탈퇴" onClick="location.href='adminMemberOut?id=${memberVO.id}'">
	<input type="button" id="outMember2" value="회원목록" onClick="location.href='adminMemberList'">
	
</div>








</article>
