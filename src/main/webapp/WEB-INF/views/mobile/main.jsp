<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>


<div class="container">
	<div class="subpic">
		<img src="/images/mainImages/food1.png"> <span class="introText"
			style="text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">
			<h3 style="margin-bottom: 0;">맛집 리스트와 리뷰까지 한눈에</h3>
			<h1 style="margin-top: 0;">EAT PLACE</h1> </span>
		<form method="post" action="" name="frm">
			<div id="scb">
				<div id="scbimg">
					<img src="/images/icon/cutlery.png" id="scbimg2">
				</div>
				<div id="scbtext">
					<input type="text" size="35" placeholder="식당명 검색" name="key"
						value="${key}" id="scbtext2">
				</div>
				<div id="scbbtn">
					<input type="button" value="검색" onClick="go_rest('searchRestList')"
						id="scbbtn2">
				</div>
			</div>
		</form>
	</div>
</div>

<div id="bigbox">


	<div id="middlebox"> 
		<h2>NEW</h2>
			<c:forEach items="${newRestList }" var="newRestVO">
				<div id="smallbox">
					<div id="small_img">
						<a href="MdetailForm?rseq=${newRestVO.RSEQ }&kind=${newRestVO.R_KIND}"><img
							src="/images/RestImages/${newRestVO.M_IMAGE}"  height="200" width="auto"></a>
					</div>
					<div id="small_content">
						<h3>&nbsp;${newRestVO.R_NAME }</h3>&nbsp;${newRestVO.R_KIND }/ ${newRestVO.R_ADDRESS }
					</div>
				</div>
			</c:forEach>
	</div>



	<div id="middlebox2">
		<h2>BEST</h2>

		<div id="showBest"
			onclick="location.href='Mbestrest?kind=한식'">
			<img src="images/RestImages/k32.png" width="440" height="auto"
				style="z-index: -1;">
			<div id="showContent">
				<h1>한식 별점 TOP3</h1>
			</div>
		</div>

		<div id="showBest2"
			onclick="location.href='Mbestrest?kind=중식'">
			<img src="images/RestImages/c22.jpg" width="440" height="auto"
				style="z-index: -1;">
			<div id="showContent">
				<h1>중식 별점 TOP3</h1>
			</div>
		</div>
		<div id="showBest"
			onclick="location.href='Mbestrest?kind=일식'">
			<img src="/images/RestImages/j52.jpg" width="440" height="auto"
				style="z-index: -1;">
			<div id="showContent">
				<h1>일식 별점 TOP3</h1>
			</div>
		</div>
		<div id="showBest2"
			onclick="location.href='Mbestrest?kind=양식'">
			<img src="images/RestImages/w42.jpg" width="440" height="auto"
				style="z-index: -1;">
			<div id="showContent">
				<h1>양식 별점 TOP3</h1>
			</div>
		</div>
	</div>

</div>














<%@ include file="include/footer.jsp" %>