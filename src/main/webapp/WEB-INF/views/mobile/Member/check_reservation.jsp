<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="sub_mypage.jsp" %>
<div class="clear"></div>

<div id="mypage_chk">
	<div id="rightmypage1">
		<form id="reserveBox" name="frmm" method="post">
			<h1>&nbsp;&nbsp;예약 조회</h1>
			
	
			<c:choose>
			<c:when test="${not empty lastCheck}">
				<c:forEach items="${lastCheck}" var="CheckRestVO">
					<input type="hidden" name="cseq" value="${CheckRestVO.cseq}">
					<input type="hidden" name="id" value="${CheckRestVO.id}">
					<div id="mypage_box1">
					
						<div id="check_img">
							<img src="/images/RestImages/${CheckRestVO.m_image }"
								onClick="location.href='MdetailForm?rseq=${CheckRestVO.rseq}&kind=${CheckRestVO.r_kind}'"/>
						</div>
						<div id="check_content">
							
							<c:choose>
		                        <c:when test="${CheckRestVO.cyn == 'y'}">
		                           <div id="checkPass">
		                              <img src="/images/icon/check2.png" width="35" height="35" style="opacity:0.8; float:left;">예약 확정
		                           </div>
		                        </c:when>
		                        <c:otherwise>
		                           <div id="checkPass">
		                              <img src="/images/icon/check1.png" width="35" height="35" style="opacity:0.8; float:left;">예약 대기
		                           </div>
		                        </c:otherwise>
		                     </c:choose>
							
							
							<h3 onClick="location.href='MdetailForm?rseq=${CheckRestVO.rseq}&kind=${CheckRestVO.r_kind}'"> ${CheckRestVO.r_name} </h3>
							예약일시: ${CheckRestVO.c_checkdate}&nbsp;&nbsp;${CheckRestVO.c_checkdatetime }<br>
							인원수: ${CheckRestVO.c_people}&nbsp;명 <br>
							위치: ${CheckRestVO.r_address} <br>
							전화번호: ${CheckRestVO.r_phone} <br>
							<input type="button" value="예약 취소" id="reserveBoxButton" onClick="location.href='MdeleteReserve?cseq=${CheckRestVO.cseq}'"  style="right:0px;"/>
						<c:choose>
	                        <c:when test="${CheckRestVO.cyn=='n'}">
	                           <input type="button" value="예약 변경" id="reserveBoxButton" onClick="location.href='MupdateReserveForm?cseq=${CheckRestVO.cseq}'"/>
	                        </c:when>
	                        <c:otherwise>
	                           &nbsp;
	                        </c:otherwise>
	                     </c:choose>  
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div id="empty">					
						<img src="/images/icon/find_icon.png" width="50" height="50" style="opacity:0.6; float:left;"><p>아직 예약한 가게가 없습니다.</p>
				</div>
			</c:otherwise>
			</c:choose>
		
	<div id="paging2" align="center" style="font-size:110%;">
			<c:if test="${paging.prev}">
				<a href="MmyCheck?page=${paging.beginPage-1}">◀</a>&nbsp;
			</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:choose>
						<c:when test="${paging.page==index}">
							<span style="color:orange">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="MmyCheck?page=${index}&key=${key}">${index}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<c:if test="${paging.next}">
				<a href="MmyCheck?page=${paging.endPage+1}">▶</a>&nbsp;
			</c:if>
	</div>	
	</form>
	

	
</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>