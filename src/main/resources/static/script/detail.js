function edit_click(rwseq) {
	var url = "editReview?rwseq=" + rwseq;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=350, scrollbars=no";
	window.open(url, "editReview", opt);
}

function update_click() {
	document.editForm2.submit();
}

function remove_click() {
	confirm("정말로 삭제하시겠습니까?");
	document.editForm3.submit();
}

function close_click() {
	opener.top.location.reload();
	self.close();
}

function backPage() {
	history.go(-1);
}


function checkDeleteReserve(cseq){
	var checkConfirm = confirm("정말로 예약을 취소하시겠습니까? (위약수수료 없음)");

	if(checkConfirm==true){
		document.frmm.action = "deleteReserve?cseq=" + cseq;
		document.frmm.submit();
	}else{
		document.frmm.action = "myCheck";
	}
}



function checkDeleteWish(wseq,rseq,r_kind){
	var checkConfirm = confirm("위시리스트에서 삭제하시겠습니까?");
	
	if(checkConfirm==true){
		window.location.href = "removeMyWish?wseq=" + wseq + "&rseq=" + rseq + "&kind=" + r_kind;
		
	}else{
		document.frmm.action = "myWish";
	}
}


function qnaDelete(qseq){
	var checkConfirm = confirm("해당 질문을 삭제하시겠습니까?");
	if(checkConfirm==true){
	window.location.href= "qnaDelete?qseq="+qseq;
	}else{
	
	}
}
















































