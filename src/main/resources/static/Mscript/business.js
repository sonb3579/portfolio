function idcheck(){
	if( document.joinForm.businessId.value=="" ){
		alert("아이디를 입력하고 중복체크를 진행하세요" );
		document.joinForm.businessId.focus();
		return;
	}
	var url = "MidCheckFormB?businessId=" + document.joinForm.businessId.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	window.open(url, "IdCheck", opt);	
}

function idok( Id ){
	opener.joinForm.businessId.value = Id;
	opener.joinForm.reid.value = Id;
	self.close();
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
			 document.frm.action = "MmyRestUpdate?rseq=" + rseq;
			 document.frm.submit();
		}
	}
}
