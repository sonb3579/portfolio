function workerCheck(){
	  if(document.frm.workId.value==""){
	      	alert("아이디를 입력하세요.");
	      	return false;
	  }else if(document.frm.workPwd.value==""){
	     	alert("비밀번호를 입력하세요.");
	      	return false;
	  }
	  return true;  
}


function addRest(){
	document.frm.action= "food.do?command=adminRestWriteForm";
	document.frm.submit();
}

function addNotice(){
	document.frm.action= "adminNoticeWriteForm";
	document.frm.submit();
}



function go_save(){
	
	if( document.frm.kind.value==""){  
		alert('식당 분류를 선택하세요');
		document.frm.kind.focus();
	}else if (document.frm.name.value == "") {
		alert('식당명을 입력하세요.'); 	
		document.frm.name.focus();	
	} else if (document.frm.phone.value == "") {
		alert('전화번호를 입력하세요.'); 		
		document.frm.phone.focus();
	} else if (document.frm.address.value == "") {
		alert('주소를 입력하세요.'); 		
		document.frm.address.focus();
	} else if (document.frm.map.value == "") {
		alert('지도주소를 입력하세요.'); 		
		document.frm.map.focus();
	}else if (document.frm.runtime.value == "") {
		alert('영업시간을 입력하세요.'); 		
		document.frm.runtime.focus();
	} else if (document.frm.content.value == "") {
		alert('상세내용을 입력하세요.'); 		
		document.frm.content.focus();
	}else if (document.frm.menu1.value == "") {
		alert('대표메뉴1을 입력하세요.'); 		
		document.frm.menu1.focus();
	} else if (document.frm.menuprice1.value == "") {
		alert('대표메뉴1의 가격을 입력하세요.'); 		
		document.frm.menuprice1.focus();
	} else if (document.frm.menu2.value == "") {
		alert('대표메뉴2를 입력하세요.'); 		
		document.frm.menu2.focus();
	} else if (document.frm.menuprice2.value == "") {
		alert('대표메뉴2의 가격을 입력하세요.'); 		
		document.frm.menuprice2.focus();
	}else{
		document.frm.action = "food.do?command=adminRestWrite";
		document.frm.submit();
	}
}






function go_search( command ){
	var key = document.frm.key.value;
	if( document.frm.key.value == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
	 	return;
	 }
	var url = command + "?page=1&key=" + key;   
	document.frm.action = url;
	document.frm.submit();
}


function go_total( command ){
	document.frm.key.value="";
	document.frm.action = command + "?page=1";
	document.frm.submit();
}


function go_mod(nseq){
	var url = "food.do?command=adminNoticeUpdateForm&nseq=" + nseq;
	location.href=url;
	
}






function go_updateRest(rseq){
	
	if (document.frm.kind.value == '') {
		  alert('식당분류를 선택하세요'); 	  
			document.frm.kind.focus();
	 } else if (document.frm.name.value == '') {
		  alert('식당명을 입력하세요');	  
			document.frm.name.focus();
	 } else if (document.frm.phone.value == '') {
		  alert('전화번호를 입력하세요');	 
 		document.frm.phone.focus();
	 } else if (document.frm.address.value == '') {
		  alert('주소를 입력하세요');	  
			document.frm.address.focus();
	 } else if (document.frm.runtime.value == '') {
		  alert('운영시간을 입력하세요');	  
			document.frm.runtime.focus();
	 }else{
		if( confirm('수정하시겠습니까?') ){
			 document.frm.action = "adminRestUpdate?rseq=" + rseq;
			 document.frm.submit();
		}
	}
}

function goUpdateMenu(){
	document.frm.action="food.do?command=adminUpdateMenu";
	document.frm.submit();
}


function selectimg(){
	var opt = "toolbar=no,menubar=no,resizable=no,width=450,height=200";
	window.open( 'selectimg' , 'selectimg',  opt);
}



function selectedimage(){
	document.frm.submit();
}



function go_banner_save(){
	
	var theForm = document.frm;  
	

	theForm.action = "bannerWrite";
	theForm.submit();
	
}



