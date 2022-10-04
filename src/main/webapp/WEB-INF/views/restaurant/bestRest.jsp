<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/headerfooter/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bestrest</title>
</head>
<body>
<div id="buffer1"></div>

<div id= "categoryFirst">
	<div class="ctTitle">
		<h2>${kind } 인기 TOP3</h2>
	</div>
</div>

<div id="restlist">
<div id="buffer2"></div>

	<div class="recbox">
		<c:forEach items="${bestList}" var="bList" begin="0" end="2" step="1">
			<div id="resttable">
				<a href="detailForm?rseq=${bList.RSEQ}&kind=${bList.R_KIND }">
				<div id="table_img">
					<img src="/images/RestImages/${bList.M_IMAGE}">
				</div>
				<div id="bestrestif">
				<div id="bestrestif1">
					<h3>${bList.R_NAME} / 평점 : ${bList.RATING/2}</h3>
					<p>${bList.R_ADDRESS} </p>
					<p>${bList.R_RUNTIME} </p>
				</div>
				<div id="bestrestif2">
					<p>${bList.R_CONTENT }</p>
				</div>
				</div>
				</a>	
			</div>
		</c:forEach>
	</div>
</div>



<%@ include file="../include/headerfooter/footer.jsp"%>