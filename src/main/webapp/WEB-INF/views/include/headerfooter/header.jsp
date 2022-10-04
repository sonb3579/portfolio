<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/mainPage.css" rel="stylesheet">
<link href="/css/restKind.css" rel="stylesheet"> 
<link href="/css/detail.css" rel="stylesheet">
<link href="/css/find.css" rel="stylesheet">
<script src="/script/mainPageScript.js"></script> 
<script src="/script/contract.js"></script> 
<script src="/script/member.js"></script> 
<script src="/script/search.js"></script> 
<script src="/script/detail.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function(){
    	var num=0;
    	setInterval(function(){
            $('#imgss').animate({ left : num * -1920 },1000);
                num++;
                if(num==3)num=0;
        }, 2000);
    });
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

</head>
<body>

<div class="header">
	<div id ="logo">
		<img src = "/images/images/headerTopLogo.jpg" width="120" height="120" onClick="location.href='/'">
	</div>
	
	<div id="menubar">
		<ul>
			<li><a href='category?kind=한식'>한식</a></li>
			<li><a href='category?kind=중식'>중식</a></li>
			<li><a href='category?kind=일식'>일식</a></li>
			<li><a href='category?kind=양식'>양식</a></li>
			<li><a href='category?kind=카페'>디저트</a></li>
		</ul>
	</div>
	
		<c:choose>
			<c:when test="${empty loginUser}">
				<div id="loginMenu">
					<ul>
						<li><a href="loginForm">로그인</a></li>
						<li><a href="contract">회원가입</a></li>
						<li><a href="notice">공지사항</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div id="memberMenu">
					<ul>
						<li><a href="logout">로그아웃</a></li>
						<li><a href="myPage">내정보</a></li>
						<li><a href="notice?first=1">공지사항</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
		
	
	

</div>
