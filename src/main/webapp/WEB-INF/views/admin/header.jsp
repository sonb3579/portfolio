<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminHeader</title>
<link href="/css/admin.css" rel="stylesheet"> 
<script src="/script/admin.js"></script>
</head>
<body>

	<div class="header">
		<div id="adminHeader">
			<a href="adminRestList?first='1'"><img src = "/images/images/headerTopLogo2.png" width="100" height="100" ></a>
			<h1>Administrator Page</h1>
			<input type="button" id="logoutbtn" value="logout" onClick="location.href='adminLogout'">
			<input type="button" id="logoutbtn" value="Home" onClick="location.href='/'">
		</div>
	</div>
