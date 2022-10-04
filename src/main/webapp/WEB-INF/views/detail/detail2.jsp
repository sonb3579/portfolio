<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<!-- 메인 콘텐츠 들어갈 자리 -->

<div id="dtbox">
	<br>
	<h1>${RestVO.R_NAME }&nbsp;<span
			style="font-size: 40%; color: gray;">${RestVO.R_KIND }&nbsp;/&nbsp;${RestVO.R_ADDRESS }</span>
	</h1>
	<br>
	<!-- 상단 이미지 -->
	<div id="imgplace">
		<div id="main_img1">
			<img
				src="/images/RestImages/${ImagesVO.R_IMG}"
				height="auto" width="500">
		</div>
		<div id="main_img2">
			<img
				src="/images/RestImages/${ImagesVO.M_IMG}"
				height="600" width="auto">
		</div>
		<!-- 임시 -->
		<div id="main_img3">
			<img
				src="/images/RestImages/${ImagesVO.S_IMG}"
				height="600" width="auto">
		</div>
	</div>

	<div style="height: 50px; width: 100%;"></div>

	<div class="dtb">
		<div class="dtblank">
			<div id="dtrw">
				<div style="height: 25px; width: 100%;"></div>
				<table style="margin: 0 auto;">
					<tr>
						<td align="center" width="200"><a
							href='reserveForm?rseq=${RestVO.RSEQ }'> <img
								src="/images/icon/reserve.png" height="100">
						</a>
							<div style="height: 10px; width: 100%;"></div></td>
						<td align="center" width="200"><c:choose>
								<c:when test="${WishVO.result=='2' }">
									<a
										href='removeWish?wseq=${WishVO.wseq }&rseq=${RestVO.RSEQ }&kind=${RestVO.R_KIND }'><img
										src="/images/icon/wish2.png" height="100"></a>
								</c:when>
								<c:otherwise>
									<a href='addWish?rseq=${RestVO.RSEQ }&kind=${RestVO.R_KIND }'><img
										src="/images/icon/wish.png" height="100"></a>
								</c:otherwise>
							</c:choose>
							<div style="height: 10px; width: 100%;"></div></td>

					</tr>
					<tr>
						<td align="center">예약하기
							<div style="height: 10px; width: 100%;"></div>
						</td>
						<td align="center" width="200" style="font-size: 95%;"><c:choose>
								<c:when test="${WishVO.result=='2' }">
							위시리스트에서 빼기
						</c:when>
								<c:otherwise>
							위시리스트에 담기
						</c:otherwise>
							</c:choose>
							<div style="height: 10px; width: 100%;"></div></td>

					</tr>
					<tr>
						<td align="center" width="200"><img
							src="/images/icon/star.png" height="100">
							<div style="height: 10px; width: 100%;"></div></td>
						<td align="center" width="200"><a
							href='restQna?rseq=${RestVO.RSEQ }&r_name=${RestVO.R_NAME }'><img
								src="/images/icon/qna.png" height="100"></a>
							<div style="height: 10px; width: 100%;"></div></td>
					</tr>
					<tr>
						<td align="center"><span
							style="font-weight: blod; color: orange;">${average / 2 }</span>
							<span style="color: gray;">/5.0</span></td>
						<td align="center">식당 문의</td>
					</tr>
				</table>
			</div>
		</div>


		<div class="dtblank">
			<div id="detail">
				<div style="height: 20px; width: 100%;"></div>
				<div id="detail_2">
					<b>메&nbsp;뉴</b>

					<div style="height: 10px; width: 100%;"></div>
					<div>
						<div id="menu_box1">${menuVO.R_MNAME1 }</div>
						<div id="menu_box2" style="text-align: center;">
							<span style="color: gray;">.................</span>
						</div>
						<div id="menu_box3">${menuVO.R_MPRICE1 }&nbsp;원</div>
					</div>
					<div>
						<div id="menu_box1">${menuVO.R_MNAME2 }</div>
						<div id="menu_box2" style="text-align: center;">
							<span style="color: gray;">.................</span>
						</div>
						<div id="menu_box3">${menuVO.R_MPRICE2 }&nbsp;원</div>
					</div>

				</div>

				<div style="height: 50px; width: 100%;"></div>

				<div id="detail_2">
					<b>식당 소개</b>

					<div style="height: 10px; width: 100%;"></div>
					<div id="detail_3">
						<span>${RestVO.R_CONTENT }</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 50px; width: 100%;"></div>

	<hr>

	<div style="height: 50px; width: 100%;"></div>

	<div id="box2">
		<h2>찾아오는 길</h2>
		<div id="map">
			<iframe src="${RestVO.R_MAP }" width="600" height="450"
				style="border: 0;" allowfullscreen="" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>


		<div id="location">
			<table>
				<tr>
					<th>분류</th>
				</tr>
				<tr>
					<td><a href="category?kind=${RestVO.R_KIND }">${RestVO.R_KIND }</a></td>
				</tr>
				<tr>
					<th>상호</th>
				</tr>
				<tr>
					<td>${RestVO.R_NAME }</td>
				</tr>
				<tr>
					<th>위치</th>
				</tr>
				<tr>
					<td>${RestVO.R_ADDRESS }</td>
				</tr>
				<tr>
					<th>전화번호</th>
				</tr>
				<tr>
					<td>${RestVO.R_PHONE }</td>
				</tr>
				<tr>
					<th>영업시간</th>
				</tr>
				<tr>
					<td>${RestVO.R_RUNTIME }</td>
				</tr>
			</table>
		</div>
	</div>

	<div style="height: 50px; width: 100%;"></div>
	<!--  리뷰 작성 -->
	<form method="post" action="reviewSubmit?kind=${RestVO.R_KIND }"
		name="reviewForm">
		<div class="blank2">
			<input type="hidden" name="id" value="${loginUser.id }">
			<h3>
				&nbsp;REVIEW&nbsp;<span style="color: red;">${message}</span>
			</h3>
			<hr>
			<table>
				<tr>
					<td>&nbsp;<%@ include file="star.jsp"%><br>
						<div style="height: 10px; width: 100%;"></div></td>
				</tr>
				<tr>
					<td><textarea rows="5" cols="120" name="content"></textarea><br></td>

					<td width="60" height="90">&nbsp;&nbsp;<input type="hidden"
						name="rseq" value="${RestVO.RSEQ }"> <input type="submit"
						id="rvbutton" value="등록" onclick="reviewCheck();">
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div style="height: 50px; width: 100%;"></div>

	<!-- forEach 사용해서 등록되있는 리뷰 모두 출력 -->
	<form method="post" name="editForm">
		<div class="blank3">
			<c:forEach items="${reviewList}" var="revVO" begin="0" end="4"
				step="1">
				<div id="reviewbox">
					<div id="reviewstar">
						<div style="margin-top: 30px;">
							&nbsp;<span style="font-size: 150%;">&#127775;</span>&nbsp;<br>
							<span style="font-weight: blod; color: orange; margin: 0 auto;">${revVO.RATING1 /2}</span>
						</div>
					</div>

					<div id="reviewid">
						<span>${revVO.ID}</span>&nbsp;&nbsp; <span
							style="color: gray; font-size: 50%;"><fmt:formatDate
								value="${revVO.INDATE}" type="date" /></span>
					</div>

					<div id="reviewedit">
						<c:choose>
							<c:when test="${revVO.ID==loginUser.id}">
								<input type="button" id="rvbutton2"
									onclick="edit_click('${revVO.RWSEQ}');" value="edit">
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="reviewcontent">
						<span>${revVO.CONTENT}</span>
					</div>
				</div>
				<div style="height: 10px; width: 100%;"></div>
			</c:forEach>
			<div id="moreReview">
				<input type="button"
					onclick="location.href='moreReview?rseq=${RestVO.RSEQ}'"
					value="이 식당의 다른 리뷰 보러가기" id="selector3">
			</div>
		</div>
	</form>

	<div style="height: 50px; width: 100%;"></div>

	<div class="blank4">
		<h3>${RestVO.R_KIND }카테고리의다른음식점</h3>
		<c:forEach items="${restKindList}" var="kList" begin="0" end="8"
			step="1">
			<div class="minidiv">
				<div class="minidiv2" style="cursor: pointer;"
					onclick="location.href='detailForm?rseq=${kList.RSEQ}&kind=${kList.R_KIND}'">${kList.R_NAME}
				</div>
				<div class="minidiv1">
					<a href="detailForm&rseq=${kList.RSEQ}&kind=${kList.R_KIND}"> <img
						src="/images/RestImages/${kList.M_IMAGE}"
						height="auto" width="300" style="opacity: 0.5;">
					</a>
				</div>

			</div>
		</c:forEach>
	</div>

</div>
<div style="height: 100px; width: 100%;"></div>
<%@ include file="../include/headerfooter/footer.jsp"%>