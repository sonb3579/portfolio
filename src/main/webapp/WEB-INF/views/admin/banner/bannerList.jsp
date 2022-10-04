<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../admin/header.jsp"%>
<%@ include file="../../admin/sub_menu.jsp"%>

<article>

	<div id="menuTitle"><h1>배너 리스트</h1></div>
	<form name="frm" method="post">
		<table id="searchBox">
			<tr><td width="800" align="right">
				<input class="bannerbtn" type="button" name="btn_write" value="새배너 등록" 
						onClick="location.href='newBannerWrite'"></td></tr>
		</table>
		<table id="restList">
			<tr><th>번호</th><th>제목</th><th>순위</th><th>사용유무 </th><th>등록일</th><th>수정 </th><th>삭제</th></tr>
			<c:choose>
		    	<c:when test="${bannerList.size()==0}">
		    			<tr><td width="100%" colspan="6" align="center" height="23">등록된 상품이 없습니다.</td></tr>
		    	</c:when>
		    	<c:otherwise>
		    			<c:forEach items="${bannerList}" var="bannerVO">
		    				<tr>
		    					<td height="50" align="center"  >${bannerVO.BSEQ}</td>
		    					<td height="50" align="center" >
		    						${bannerVO.NAME}</td>
		    					<td height="50" align="center" >
			    					<c:choose>
			    						<c:when test = "${String.valueOf(bannerVO.ORDER_SEQ) == '4' }">
			    							사용안함
			    						</c:when>
			    						<c:otherwise>
			    							${bannerVO.ORDER_SEQ}
			    						</c:otherwise>
			    					</c:choose>
		    					</td>
		    					<td height="50" align="center" >${bannerVO.USEYN}</td>
		    					<td height="50" align="center" ><fmt:formatDate value="${bannerVO.INDATE}"/></td>
			      				<td height="50" align="center" ><input type="button" value="수정" 
			      					onClick="location.href='editBannerForm?bseq=${bannerVO.BSEQ}'"></td>
			      				<td height="50" align="center" ><input type="button" value="삭제" 
			      					onClick="location.href='deleteBanner?bseq=${bannerVO.BSEQ}'"></td>
		    				</tr>
		    			</c:forEach>
		    	</c:otherwise>
		    </c:choose>
		</table>
	</form>

</article>

