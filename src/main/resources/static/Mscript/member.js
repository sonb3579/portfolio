function idcheck(){
	if( document.joinForm.id.value=="" ){
		alert("아이디를 입력하고 중복체크를 진행하세요" );
		document.joinForm.id.focus();
		return;
	}
	var url = "MidCheckForm?id=" + document.joinForm.id.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	window.open(url, "IdCheck", opt);	
}


function idok( userid ){
	opener.joinForm.id.value = userid;
	opener.joinForm.reid.value = userid;
	self.close();
}










function loginCheck(){
	if(document.loginFrm.id.value==""){
		alert("아이디는 필수입력사항입니다");
		document.loginFrm.id.focus();
		return false;
	}else if(document.loginFrm.pwd.value==""){
		alert("비밀번호는 필수입력사항입니다");
		document.loginFrm.pwd.focus();
		return false;
	}else{
		return true;	
	}	
}
	
function allCheck(){
	   if(document.getElementById("join_All").checked==true){  //id 를 사용하여 하나의 객체만을 호출
	          document.joinForm.contractCheck1.checked = true;
	          document.joinForm.contractCheck2.checked = true;
	          document.joinForm.contractCheck3.checked = true;
	      }
	      if(document.getElementById("join_All").checked==false){
	          document.joinForm.contractCheck1.checked = false;
	          document.joinForm.contractCheck2.checked = false;
	          document.joinForm.contractCheck3.checked = false;
	      }
	}
	

 function joinCheck(){
	if (document.joinForm.id.value == "") {
		alert("아이디를 입력하여 주세요."); 	    
	    document.joinForm.id.focus();
	    return false;
	} else if(document.joinForm.reid.value != document.joinForm.id.value){
		alert("아이디 중복확인을 하지 않았습니다");		
		document.joinForm.id.focus();
		return false;
	} else if(document.joinForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");	    
	    document.joinForm.pwd.focus();
	    return false;
	} else if(document.joinForm.pwd.value != document.joinForm.pwd_Check.value) {
	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");	    
	    document.joinForm.pwd.focus();
	    return false;
	} else if(document.joinForm.name.value == "") {
	    alert("이름을 입력해 주세요.");	    
	    document.joinForm.name.focus();
	    return false;
	}else if(document.joinForm.gender.value == "") {
	    alert("성별을 선택해 주세요.");	   
	    return false;
	} else if(document.joinForm.email.value == "") {
	    alert("이메일을 입력해 주세요.");	   
	    document.joinForm.email.focus();
	    return false;
	 
	}else if(document.joinForm.phone.value == "") {
	    alert("전화번호를 입력해 주세요.");	   
	    document.joinForm.phone.focus();
	    return false;
	}else{
		return true;
	}
}

function go_next(){
	 if( document.contractFrm.okon[1].checked==true){
		alert('회원 약관에 동의 하셔야 회원으로 가입이 가능합니다');
	}else{
		document.contractFrm.action = "MjoinForm";
		document.contractFrm.submit();
	}
}
