<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>
<div id="test">
<div style="height: 140px; width: 100%;"></div>
	<h2>Business Main page</h2>
	<br><br>
	<table id="restList">
		<tr><th width="100">번호</th>
		<th width="200">식당명</th>
		<th width="200">연락처</th>
		<th width="200">운영시간</th>
		<th width="100">승인여부</th></tr>

		<c:forEach items="${myRestList}" var="RestVO">
			<tr><td height="50" align="center" >${RestVO.rseq}</td>
			<td height="50" align="center">
					<a href="#" onclick="location.href='myRestDetail?rseq=${RestVO.rseq}'">${RestVO.r_name }</a></td>
				
				<td height="50" align="center" >${RestVO.r_phone}</td>
				<td height="50" align="center" >${RestVO.r_runtime}</td>
				<td height="50" align="center" >${RestVO.ryn }</td>
			</tr>
		</c:forEach>

	</table><br /><br/>
	
	
		<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
	      <c:if test="${paging.prev}">
	         <a href="myRestList?page=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	         <c:choose>
	            <c:when test="${paging.page==index}">
	               <span style="color:orange">${index}&nbsp;</span>
	            </c:when>
	            <c:otherwise>
	               <a href="myRestList?page=${index}&key=${key}">${index}</a>&nbsp;
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:if test="${paging.next}">
	         <a href="myRestList?page=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>
	
   </div>
   </div>
<%@ include file="../business/headerfooter/footer.jsp"%>