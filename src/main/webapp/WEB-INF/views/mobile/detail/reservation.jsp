<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
	<div id="revbox">
		<form method="post" name="reseForm" action="MreserveInsert">
			<input type="hidden" name="id" value="${loginUser.id }"> <input
				type="hidden" name="rseq" value="${RestVO.RSEQ }">
			<div class="revbox1"></div>
			<div class="revbox1">
				<h3>예약 식당</h3>
			</div>
			<div class="revbox1">
				<h3 style="color:gray;">${RestVO.R_NAME }</h3>
			</div>
			<!-- 연월일 선택 -->
			<div class="revbox1">
				<h3>날짜 선택</h3>
			</div>
			<div class="revbox2">
						<script>

							var today = new Date();
							var dd = today.getDate();
							var mm = today.getMonth()+1; 
							var yyyy = today.getFullYear();
							if(dd<10){
							  dd='0'+dd
							} 
							if(mm<10){
							  mm='0'+mm
							} 
							
							today = yyyy+'-'+mm+'-'+dd;	
							
							window.onload = () => {
							    document.getElementById('dateValue').min=today;
							}
						
						</script>
				<input type="date" name="c_checkdate" data-placeholder="날짜 선택" id="dateValue" required
					aria-required="true" value={startDateValue} min="&{today}"
					className={styles.selectDay} onChange={StartDateValueHandler}
					id="selector">
					
			</div>
			<!-- 시간 선택 -->
			<div class="revbox1">
				<h3>시간 선택</h3>
			</div>
			<div class="revbox2">
				<select name="c_checkdatetime" id="selector">
					<option value="">시간 선택</option>
					<option value="오전:11:00">오전:11:00</option>
					<option value="오전:11:30">오전:11:30</option>
					<option value="오후:12:00">오후:12:00</option>
					<option value="오후:12:30">오후:12:30</option>
					<option value="오후:01:00">오후:01:00</option>
					<option value="오후:01:30">오후:01:30</option>
					<option value="오후:02:00">오후:02:00</option>
					<option value="오후:02:30">오후:02:30</option>
					<option value="오후:05:00">오후:05:00</option>
					<option value="오후:05:30">오후:05:30</option>
					<option value="오후:06:00">오후:06:00</option>
					<option value="오후:06:30">오후:06:30</option>
					<option value="오후:07:00">오후:07:00</option>
					<option value="오후:07:30">오후:07:30</option>
					<option value="오후:08:00">오후:08:00</option>
					<option value="오후:08:30">오후:08:30</option>
					<option value="오후:09:00">오후:09:00</option>
					<option value="오후:09:30">오후:09:30</option>
					<option value="오후:10:00">오후:10:00</option>
					<option value="오후:10:30">오후:10:30</option>
				</select>
			</div>
			<!-- 인원 선택 -->
			<div class="revbox1">
				<h3>예약 인원&nbsp; <span style="color:gray; font-size:50%;">*5인 이상은 식당에 유선으로 문의하세요</span></h3> 
			</div>
			<div class="revbox2">
				<select name="c_people" id="selector">
					<option value="">예약 인원 선택</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
				</select>
			</div>
			<div class="revbox1"></div>
			<div class="revbox1">
				<h3 style="color:red;">${message}</h3>
			</div>
			<div class="revbox1">
				<input type="submit" value="예약하기" id="selector1" onclick="reserveCheck()">
			</div>
			<div class="revbox3"></div>
			<div class="revbox1">
				<input type="button" value="돌아가기" id="selector2" onclick="backPage()">
			</div>
			<div class="revbox3"></div>
			<div class="revbox1">
				<input type="reset" value="다시쓰기" id="selector2">
			</div>
		</form>
	</div>
<%@ include file="../include/footer.jsp"%>