<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<div id="wrap">
	<nav id="sub_mypage">
			<div id ="profile">
				<h3> ${loginUser.name} 님</h3>
			</div>
			<div id = "mypagesub">
				<ul>
					<li> <img src="/images/icon/mypage_1.png">&nbsp;&nbsp;&nbsp;&nbsp;<a href='myPage'>내 프로필</a></li>
					<li> <img src="/images/icon/mypage_2.png">&nbsp;&nbsp;&nbsp;&nbsp;<a href='myCheck'>예약 조회</a></li>
					<li> <img src="/images/icon/mypage_3.png">&nbsp;&nbsp;&nbsp;&nbsp;<a href='myHistory'>지난 예약</a></li>
					<li> <img src="/images/icon/mypage_4.png">&nbsp;&nbsp;&nbsp;&nbsp;<a href='myWishlist'>위시리스트</a></li>
				</ul>
			</div>
	</nav>




