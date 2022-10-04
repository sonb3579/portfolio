<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="sub_mypage.jsp" %>
<div class="clear"></div>



<div id="mypage">
	
	<div id="rightmypage1">
	
		<div id="deleteAccountBox">	
		
		<br/><h2>회원 탈퇴</h2><br/><br/><br/><br/>
		<p style="color:red;">회원 탈퇴 전 아래의 내용을 꼭 확인해 주세요.</p>
		
		<div id=deleteText>
	
		회원 탈퇴 시 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구가 불가능합니다. <br/>
		자세한 사항은 개인정보처리방침에서 확인하실 수 있습니다.<br/>
		회원 탈퇴 후 재가입하더라도 탈퇴 전의 회원 정보 및 서비스 이용 기록은 복구되지 않습니다.<br/>
		회원을 탈퇴하더라도 잇플레이스 서비스에 기록한 리뷰, Q&A 등의 게시물은 삭제되지 않습니다.<br/>
		회원을 탈퇴하면, 개인정보가 삭제되어 게시물을 수정하거나 삭제할 수 없으니<br/>
		게시물 삭제가 필요한 회원은 게시물 삭제 후 탈퇴 신청하시기 바랍니다.<br/>
		회원 탈퇴 후에는 예약된 식당의 환불이 불가능 합니다. 예약된 식당이 있을 경우, 탈퇴 전에 환불 신청을 해주세요.<br/><br/><br/>
		</div>
		<br/>
		정말 탈퇴하시겠습니까?<br/><br/><br/>
		
		<div id="deleteABox">
			<a href="MdeleteAccount?id=${loginUser.id }" >회원 탈퇴</a><br/><br/>
		</div>
		
		
		</div>
	</div>

</div>
</div>


<%@ include file="../include/footer.jsp"%>