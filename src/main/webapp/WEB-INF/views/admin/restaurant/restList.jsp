<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>


<article>
	<div id="menuTitle"><h1>맛집 리스트</h1></div>
	<form name="frm"  method="post">
			<table id="searchBox">
				<tr>
					<td width="642"><input type="text" name="key" value="${key}">
						<input class="btn" type="button" name="btn_search" value="검색" 
						onClick="go_search('adminRestList');">
						<input class="btn" type="button" name="btn_total" value="전체보기" 
						onClick="go_total('adminRestList');">
					</td>
				</tr>
			</table>	
	</form>
	
	<table id="restList">
		<tr><th>번호</th><th>식당명</th><th>연락처</th><th>운영시간</th><th>승인여부</th></tr>
		<c:forEach items="${restList}" var="restVO">
			<tr><td height="50" align="center" >${restVO.rseq}</td>
				<td height="50" style="text-align:center;">
					<a href="#" onClick="location.href='adminRestDetail?rseq=${restVO.rseq}'">${restVO.r_name}</a>
				</td>
				<td height="50" align="center" >${restVO.r_phone}</td>
				<td height="50" align="center" >${restVO.r_runtime}</td>
				<td height="50" align="center" >${restVO.ryn }</td>
			</tr>
		</c:forEach>
	</table><br /><br />
	
	
		<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
	      <c:if test="${paging.prev}">
	         <a href="adminRestList?page=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	         <c:choose>
	            <c:when test="${paging.page==index}">
	               <span style="color:orange">${index}&nbsp;</span>
	            </c:when>
	            <c:otherwise>
	               <a href="adminRestList?page=${index}&key=${key}">${index}</a>&nbsp;
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:if test="${paging.next}">
	         <a href="adminRestList?page=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>
   </div>
	
	
	
	
	
</article>

	
