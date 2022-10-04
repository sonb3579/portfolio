<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/business.css" rel="stylesheet">
<script src="/script/business.js"></script>
</head>
<body>
	<div class="header">
		<div id="headerImg">
			<img src="/images/images/footerlogo.png" width="110" height="70"
				onClick="location.href='/'">
		</div>

		<div style="width: 10%; height: 100%; float: left;"></div>

		<nav id="myRestControl">
			<ul>
				<li><a href='myRestList?businessId=${loginBusiness.businessId}'>내
						식당 리스트</a></li>
				<li><a href='myRestQnaList'>내 식당 Q&A</a></li>
				<li><a href='registerNewRest'><span style="font-size:120%; font-weight: bold; color:orange;"> 식당 등록 </span> </a></li>
			</ul>
		</nav>

		<div id="loginUser">
			<c:choose>
				<c:when test="${empty loginBusiness}">
					<ul>
						<li><a href="business">로그인</a></li>
						<li><a href="bossJoinForm">회원가입</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li style="color: orange; font-weight: bold; font-size: 110%;">
							${loginBusiness.name}(${loginBusiness.businessId})</li>
						<li><a href="memberEditForm">정보수정</a></li>
						<li><a href="businessLogout">LOGOUT</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			<
		</div>


	</div>