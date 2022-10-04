<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../business/headerfooter/header.jsp"%>




<div id="pleaseCenter">
	<form name="frm" method="post" enctype="multipart/form-data" action="MinsertNewRest">
		<table id = "restList2">
			<tr><th width="300" height="50" align="center">식당 분류</th>
					<td colspan="2" width="600">
						<select name="kind">
							<option value="">선택</option>
			    				<option value="1">한식</option>
			   					<option value="2">중식</option>
			   					<option value="3">일식</option>
			   					<option value="4">양식</option>
			   					<option value="5">카페</option>
						</select>
					</td></tr>
			<tr><th height="50" align="center">식당명</th><td width="343" colspan="2">
		       	<input type="text" name="name" size="47" value="${rdto.r_name}" maxlength="100"></td></tr>
			<tr><th height="50" align="center">전화번호</th><td width="343" colspan="2"><input type="text" name="phone" size="47" value="${rdto.r_phone }"></td></tr>
			<tr><th height="50" align="center">주소</th><td width="343" colspan="2"><input type="text" name="address" size="47" value="${rdto.r_address}"></td></tr>
			<tr><th height="50" align="center">지도주소</th><td width="343" colspan="2"><input type="text" name="map" size="47" value="${rdto.r_map }"></td></tr>
		  	<tr><th height="50" align="center">영업시간</th><td width="343" colspan="2"><input type="text" name="runtime" size="47" value="${rdto.r_runtime }"></td></tr>
		  	<tr><th height="50" align="center">상세설명</th><td width="343" colspan="2"><textarea cols="70" rows="7" name="content">${rdto.r_content }</textarea></td></tr>
		  	
			<tr><th height="50" align="center">대표메뉴1</th><td width="343" colspan="2"><input type="text" name="r_mname1" size="47" value="${mdto.r_mname1}"></td></tr>
			<tr><th height="50" align="center">대표메뉴1 가격</th><td width="343" colspan="2"><input type="text" name="r_mprice1" size="47" value="${mdto.r_mprice1}"></td></tr>
			<tr><th height="50" align="center">대표메뉴2</th><td width="343" colspan="2"><input type="text" name="r_mname2" size="47" value="${mdto.r_mname2}"></td></tr>
			<tr><th height="50" align="center">대표메뉴2 가격</th><td width="343" colspan="2"><input type="text" name="r_mprice2" size="47" value="${mdto.r_mprice2}"></td></tr>
			
			<script>
			  var openFile = function(event) {
			    var input = event.target;
			
			    var reader = new FileReader();
			    reader.onload = function(){
			      var dataURL = reader.result;
			      var output = document.getElementById('output');
			      output.src = dataURL;
			    };
			    reader.readAsDataURL(input.files[0]);
			  };
			</script>
			
			<script>
			  var openFile2 = function(event) {
			    var input = event.target;
			
			    var reader = new FileReader();
			    reader.onload = function(){
			      var dataURL = reader.result;
			      var output = document.getElementById('output2');
			      output.src = dataURL;
			    };
			    reader.readAsDataURL(input.files[0]);
			  };
			</script>
			
			<script>
			  var openFile3 = function(event) {
			    var input = event.target;
			
			    var reader = new FileReader();
			    reader.onload = function(){
			      var dataURL = reader.result;
			      var output = document.getElementById('output3');
			      output.src = dataURL;
			    };
			    reader.readAsDataURL(input.files[0]);
			  };
			</script>

				  		
			<tr><th height="50" align="center">식당 이미지</th><th height="50" align="center">대표메뉴 이미지</th><th height="50" align="center">추가 이미지</th></tr>
			<tr><td><input type="file" name="r_img" accept='image/*' onchange='openFile(event)'></td>
				<td><input type="file" name="m_img" accept='image/*' onchange='openFile2(event)'></td>
				<td><input type="file" name="s_img" accept='image/*' onchange='openFile3(event)'></td></tr>
			<tr><td height="300"><img id='output' width="300" height="auto"></td>
				<td height="300"><img id='output2' width="300" height="auto"></td>
				<td height="300"><img id='output3' width="300" height="auto"></td></tr>
		
		</table>
		<input id="noticebtn1" type="submit" value="등록" onclick="go_save()"> 
		<input type="button" id="noticebtn2" value="돌아가기" onClick="history.go(-1)">       
		${message}
		</form>	
				
			
			 
				
		
	
				
</div>




<%@ include file="../business/headerfooter/footer.jsp"%>








