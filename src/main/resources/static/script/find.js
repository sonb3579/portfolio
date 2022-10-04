function confirm_p(){
	if(confirm("입력한 전화번호로 인증번호를 전송합니다.\n동의하십니까?")){
		return true;
	}else{
		return false;
	}
}