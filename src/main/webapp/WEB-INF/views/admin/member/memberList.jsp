<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>





<article>
	<div id="menuTitle"><h1>회원 리스트</h1></div>
	<form name="frm"  method="post">
			<table id="searchBox">
				<tr>
					<td width="642"><input type="text" name="key" value="${key}">
						<input class="btn" type="button" name="btn_search" value="검색" 
						onClick="go_search('adminMemberList');">
						<input class="btn" type="button" name="btn_total" value="전체보기" 
						onClick="go_total('adminMemberList');">
						
					</td>
				</tr>
			</table>	
	</form>
	
	<table id="restList">
		<tr><th>회원명</th><th>아이디</th><th>성별</th><th>리뷰모아보기</th></tr>
		<c:forEach items="${memberList}" var="memberVO">
			<tr><td height="50" align="center" >${memberVO.name}</td>
				<td height="50" style="text-align:center;">
					<a href="#" onClick="location.href='adminMemberDetail?id=${memberVO.id}'">${memberVO.id}</a>
				</td>
				<td height="50" align="center" >${memberVO.gender}</td>
				<td height="50" align="center" ><a href ="#" onClick="location.href='adminMemberReview?id=${memberVO.id}'">리뷰 모아보기</a></td>
			</tr>
		</c:forEach>
	</table><br /><br />
	
	<div id="paging" align="center" style="font-size:110%; font-weight:bold;">
	      <c:if test="${paging.prev}">
	         <a href="adminMemberList?page=${paging.beginPage-1}">◀</a>&nbsp;
	      </c:if>
	      <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
	         <c:choose>
	            <c:when test="${paging.page==index}">
	               <span style="color:orange">${index}&nbsp;</span>
	            </c:when>
	            <c:otherwise>
	               <a href="adminMemberList?page=${index}&key=${key}">${index}</a>&nbsp;
	            </c:otherwise>
	         </c:choose>
	      </c:forEach>
	      <c:if test="${paging.next}">
	         <a href="adminMemberList?page=${paging.endPage+1}">▶</a>&nbsp;
	      </c:if>
   </div>
	
	
	
</article>









