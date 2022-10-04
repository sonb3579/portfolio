function go_rest(){
	if( document.frm.key.value == "" ){
		alert("검색버튼 사용시에는 검색어 입력이 필수입니다");
		document.frm.action="/"
	 	return;
	 }else return;
}