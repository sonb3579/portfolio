<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminHeader</title>
<link href="/css/madmin.css" rel="stylesheet"> 
<script src="/Mscript/admin.js"></script>
</head>
<body>
	<div class="headerwrap">
			<div id="adminHeader">
				<a href="madminRestList?first='1'"><img src = "/images/images/logo.png" width="150" height="150" ></a>
				<h1>Administrator Page</h1>
				<input type="button" id="logoutbtn" value="logout" onClick="location.href='madminLogout'">
				<input type="button" id="logoutbtn" value="Home" onClick="location.href='/'">
			</div>
		
		
			<div id="sub_menu">
				<ul>
					<li><a href='madminRestList?first="1"'>맛집 리스트 관리</a></li>
					<li><a href='madminMemberList?first="1"'>회원리스트</a></li>
					<li><a href='madminNoticeList?first="1"'>공지사항 관리</a></li>
					<li><a href='madminBannerList?first="1"'>배너 관리</a></li>
				</ul>
			</div>
	</div>