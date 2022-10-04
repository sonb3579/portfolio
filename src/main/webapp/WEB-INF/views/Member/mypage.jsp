<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<%@ include file="sub_mypage.jsp" %>
<div class="clear"></div>

<div id="mypage">
	
	<div id="rightmypage1">
		<div id= "change">
			<br>
			<h3>이름 변경&nbsp; &nbsp;<button onclick="change_name(1)" id="change_button">변경하기</button><button onclick="close_name(1)" id="close_1" class="close_button">취소</button></h3>
			프로필 이름을 변경합니다.<br><br><br>
			<form method="post" name="frm" action="changeName">
			이름 :&nbsp; &nbsp;<input id="change_name" type="text" value="${loginUser.name}" class="change_name" name="name">
			<input type="hidden" name="id" value="${loginUser.id }">
			<input type="hidden" name="phone" value="${loginUser.phone }">
			<input type="hidden" name="gender" value="${loginUser.gender }">
			<input type="hidden" name="pwd" value="${loginUser.pwd }">
			<input type="submit" value="수정" id="submit_name" class="submit_button">
			<c:choose>
				<c:when test="${message==1}">
					성공적으로 변경되었습니다.
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</form>
		</div>
		<div id= "change">
		<br>
			<h3>성별 변경&nbsp; &nbsp;<button onclick="change_name(2)" id="change_button">변경하기</button><button onclick="close_name(2)" id="close_2"  class="close_button">취소</button></h3>
			성별을 변경합니다.<br><br><br>
			<form method="post" name="frm" action="changeGender">
			성별 :&nbsp; &nbsp;<input id="change_gender" type="text" value="${loginUser.gender}" class="change_name" name="gender">
			<input type="hidden" name="id" value="${loginUser.id }">
			<input type="hidden" name="name" value="${loginUser.name }">
			<input type="hidden" name="phone" value="${loginUser.phone }">
			<input type="hidden" name="pwd" value="${loginUser.pwd }">
			<input type="submit" value="수정" id="submit_gender" class="submit_button">
			<c:choose>
				<c:when test="${message==2}">
					성공적으로 변경되었습니다.
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</form>
		</div>
		<div id= "change">
		<br>
			<h3>전화번호 변경&nbsp; &nbsp;<button onclick="change_name(3)" id="change_button">변경하기</button><button onclick="close_name(3)" id="close_3"  class="close_button">취소</button></h3>
			전화번호를 변경합니다.<br><br><br>
			<form method="post" name="frm" action="changePhone">
			전화번호 :&nbsp; &nbsp;<input id="change_phone" type="text" value="${loginUser.phone}" class="change_name" name="phone">
			<input type="hidden" name="id" value="${loginUser.id }">
			<input type="hidden" name="name" value="${loginUser.name }">
			<input type="hidden" name="gender" value="${loginUser.gender }">
			<input type="hidden" name="pwd" value="${loginUser.pwd }">
			<input type="submit" value="수정" id="submit_phone" class="submit_button">
			<c:choose>
				<c:when test="${message==3}">
					성공적으로 변경되었습니다.
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</form>
		</div>
		<div id= "change">
		<br>
			<h3>비밀번호 변경&nbsp; &nbsp;<button onclick="change_name(4)" id="change_button">변경하기</button><button onclick="close_name(4)" id="close_4"  class="close_button">취소</button></h3>
			비밀번호를 변경합니다.<br><br><br>
			<form method="post" name="frm" action="changePwd">
			비밀번호 :&nbsp; &nbsp;<input id="change_pwd" type="password"  value="${loginUser.pwd}" class="change_name" name="pwd">
			<input type="hidden" name="id" value="${loginUser.id }">
			<input type="hidden" name="name" value="${loginUser.name }">
			<input type="hidden" name="phone" value="${loginUser.phone }">
			<input type="hidden" name="gender" value="${loginUser.gender }">

			<input type="submit" value="수정" id="submit_pwd" class="submit_button">
			<c:choose>
				<c:when test="${message==4}">
					성공적으로 변경되었습니다.
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</form>
		</div>
		
		<div id="deleteAccount">
			<a href="deleteAccountForm"> 회원탈퇴하기 </a>
		</div>
		
	</div>
</div>
</div>


<%@ include file="../include/headerfooter/footer.jsp"%>