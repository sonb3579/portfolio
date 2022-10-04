<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>

<div id="test">
<div style="height: 140px; width: 100%;"></div>

<h1>예약 대기중</h1>
<br>
<table id="nRestCheck">
	<tr><th width="100">예약번호</th>
	<th width="200">예약일시</th>
	<th width="100">성함</th>
	<th width="200">연락처</th>
	<th width="100">인원</th>
	<th width="100">승인</th></tr>
	<c:forEach items="${NewCheck}" var="newCheckVO">
		<tr>
			<td height="50">${newCheckVO.cseq}</td>
			<td height="50">${newCheckVO.c_checkdate}&nbsp;${newCheckVO.c_checkdatetime}</td>
			<td height="50">${newCheckVO.name}</td>
			<td height="50">${newCheckVO.r_phone}</td>
			<td height="50">${newCheckVO.c_people}</td>
			<td height="50"><input id="completeButton" type="button" value="예약확정" onClick="location.href='restConfirm?cseq=${newCheckVO.cseq}&rseq=${newCheckVO.rseq} '"></td>
		</tr>
	</c:forEach>
</table>
<br>
<input id="backButton" type="button" value="뒤로" onClick="location.href='myRestDetail?rseq=${rseq}'">
<br>
<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
	      <c:if test="${paging.prev}">
	         <a href="getNewCheck?rseq=${rseq }&pageN=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	         <c:choose>
	            <c:when test="${paging.page==index}">
	               <span style="color:orange">${index}&nbsp;</span>
	            </c:when>
	            <c:otherwise>
	               <a href="getNewCheck?rseq=${rseq }&pageN=${index}">${index}</a>&nbsp;
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:if test="${paging.next}">
	         <a href="getNewCheck?rseq=${rseq }&pageN=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>
	
   </div>
   </div>
   

<%@ include file="../business/headerfooter/footer.jsp"%>ㅍ