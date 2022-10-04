<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" href="/css/mobile.css">
<script src="/Mscript/mainPageScript.js"></script> 
<script src="/Mscript/contract.js"></script> 
<script src="/Mscript/member.js"></script> 
<script src="/Mscript/search.js"></script> 
<script src="/Mscript/detail.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>

<header>
<div class="header">
	<div id ="logo">
		<img src = "/images/images/headerTopLogo.jpg" width="160" height="160" onClick="location.href='/mobilemain'">
	</div>
	
	<div id="menuBox">
		<div id="menubar">
			<ul>
				<li><a href='Mcategory?kind=한식'>한식</a></li>
				<li><a href='Mcategory?kind=중식'>중식</a></li>
				<li><a href='Mcategory?kind=일식'>일식</a></li>
				<li><a href='Mcategory?kind=양식'>양식</a></li>
				<li><a href='Mcategory?kind=카페'>디저트</a></li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${empty loginUser}">
				<div id="myMenu">
					<ul>
						<li><a href="MloginForm">로그인</a></li>
						<li><a href="Mcontract">회원가입</a></li>
						<li><a href="Mnotice">공지사항</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div id="myMenu">
					<ul>
						<li><a href="Mlogout">로그아웃</a></li>
						<li><a href="MmyPage">내정보</a></li>
						<li><a href="Mnotice?first=1">공지사항</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
		
		
	
	

</div>
</header>
