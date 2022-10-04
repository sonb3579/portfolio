<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>

<div id="test">
<div style="height: 140px; width: 100%;"></div>

<h1>예약 확정</h1>
<br>
<table id="yRestCheck">
	<tr><th width="100">예약번호</th>
	<th width="200">예약일시</th>
	<th width="100">성함</th>
	<th width="200">연락처</th>
	<th width="100">인원</th>
	<th width="100">승인</th></tr>
	<c:forEach items="${CompleteCheck}" var="ComCheckVO">
		<tr>
			<td height="50">${ComCheckVO.cseq}</td>
			<td height="50">${ComCheckVO.c_checkdate}&nbsp;${ComCheckVO.c_checkdatetime}</td>
			<td height="50">${ComCheckVO.name}</td>
			<td height="50">${ComCheckVO.r_phone}</td>
			<td height="50">${ComCheckVO.c_people}</td>
			<td><input type="button" value="예약취소" onClick="location.href='McancelConfirm?cseq=${ComCheckVO.cseq}&rseq=${ComCheckVO.rseq} '"></td>
		</tr>
	</c:forEach>

</table>
<br>
<input id="backButton"  type="button" value="뒤로" onClick="location.href='MmyRestDetail?rseq=${rseq}'">
<br>
<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
	      <c:if test="${paging.prev}">
	         <a href="MgetCompleteCheck?rseq=${rseq }&pageY=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	         <c:choose>
	            <c:when test="${paging.page==index}">
	               <span style="color:orange">${index}&nbsp;</span>
	            </c:when>
	            <c:otherwise>
	               <a href="MgetCompleteCheck?rseq=${rseq }&pageY=${index}">${index}</a>&nbsp;
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:if test="${paging.next}">
	         <a href="MgetCompleteCheck?rseq=${rseq }&pageY=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>
	
   </div>
   </div>



<%@ include file="../business/headerfooter/footer.jsp"%>
