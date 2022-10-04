<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="sub_mypage.jsp" %>
<div class="clear"></div>

<div id="mypage">
	<div id="rightmypage1">
		<div id ="reserveBox">
			<h1>&nbsp;&nbsp;지난 예약</h1><br>			
			<c:choose>
			<c:when test="${not empty recentCheck}">
				<c:forEach items="${recentCheck}"  var="CheckRestVO" >
				<div id="mypage_box">
					<div id="history_img">
						<img src="/images/RestImages/${CheckRestVO.m_image }"
							onClick="location.href='MdetailForm?rseq=${CheckRestVO.rseq}&kind=${CheckRestVO.r_kind}'"/>
					</div>
					<div id="history_content">
						<h3 onClick="location.href='MdetailForm?rseq=${CheckRestVO.rseq}&kind=${CheckRestVO.r_kind}'">${CheckRestVO.r_name} </h3>
						예약일시: ${CheckRestVO.c_checkdate}&nbsp;&nbsp;${CheckRestVO.c_checkdatetime }<br>
						인원수: ${CheckRestVO.c_people}&nbsp;명 <br>
						전화번호: ${CheckRestVO.r_phone} <br>
						위치: ${CheckRestVO.r_address} 
					</div>
				</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div id="empty">					
						<img src="/images/icon/find_icon.png" width="50" height="50" style="opacity:0.6; float:left;"><p>아직 방문한 가게가 없습니다.</p>
				</div>
			</c:otherwise>
			</c:choose>
			<div id="paging2" align="center" style="font-size:110%;">
			<c:if test="${paging.prev}">
				<a href="MmyHistory?page=${paging.beginPage-1}&id=${id}">◀</a>&nbsp;
			</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:choose>
						<c:when test="${paging.page==index}">
							<span style="color:orange">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="MmyHistory?page=${index}&id=${id}">${index}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<c:if test="${paging.next}">
				<a href="MmyHistory?page=${paging.endPage+1}&id=${id}">▶</a>&nbsp;
			</c:if>
		</div>
		</div>
		
		
		
	</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>