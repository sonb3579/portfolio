<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>
<%@ include file="sub_mypage.jsp" %>

<div class="clear"></div>

<div id="mypage">
	<div id="rightmypage">
		<div id ="reserveBox">
			<h1>&nbsp;&nbsp;위시리스트</h1><br>
			
			<c:choose>
			<c:when test="${not empty wishlist }">
				<c:forEach items="${wishlist}" var="WishVO">
					<div id="mypage_box">
						<div id="history_img">
							<img src="images/RestImages/${WishVO.m_image }" 
									onClick="location.href='detailForm?rseq=${WishVO.rseq}&kind=${WishVO.r_kind}'"/>
						</div>
						<div id="history_content">
							 <h3 onClick="location.href='detailForm?rseq=${WishVO.rseq}&kind=${WishVO.r_kind}'"> ${WishVO.r_name} </h3><br>
							평점 : ${WishVO.rating/2}
								<span style="color: gray;">/5.0</span><br/>
							영업시간 : ${WishVO.r_runtime }<br>
							<input type="button" value="위시리스트에서 빼기" id="wishButton" onClick="checkDeleteWish('${WishVO.wseq}','${WishVO.rseq}','${WishVO.r_kind}')"/>
							
					</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div id="empty">					
						<img src="images/icon/find_icon.png" width="50" height="50" style="opacity:0.6; float:left;"><p>아직 위시리스트에 담은 가게가 없습니다.</p>
				</div>
			</c:otherwise>
			</c:choose>
			<div id="paging2" align="center" style="font-size:110%;">
			<c:if test="${paging.prev}">
				<a href="myWishlist?page=${paging.beginPage-1}">◀</a>&nbsp;
			</c:if>
				<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
					<c:choose>
						<c:when test="${paging.page==index}">
							<span style="color:orange">${index}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="myWishlist?page=${index}">${index}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<c:if test="${paging.next}">
				<a href="myWishlist?page=${paging.endPage+1}">▶</a>&nbsp;
			</c:if>
		</div>
		</div>
		
		
	</div>
</div>
</div>

<%@ include file="../include/headerfooter/footer.jsp"%>