/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
	document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {

		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

var imgNum = 0;
var timer;

function move(x) {
	imgNum = x;
	var dist = -1 * imgNum * 1200;
	document.getElementById("imgs").style.left = dist + "px";

}


function play() {
	timer = window.setInterval(function() {
		imgNum++;
		if (imgNum > 4) imgNum = 0;
		var dist = -1200 * imgNum;
		document.getElementById("imgs").style.left = dist + 'px';
	}, 1500);
}


function stop() {
	window.clearInterval(timer);
}


function side_open() {
	document.getElementById("sidebar").style.webkitTransform = "translateX(-320px)";
}

function side_close() {
	document.getElementById("sidebar").style.webkitTransform = "translateX(0px)";
}


//mypage 
function change_name(x) {

	if (x == 1) {
		document.getElementById("change_name").style.border = "1px solid black";
		document.getElementById("change_name").style.background = "white";
		document.getElementById("close_1").style.opacity = "1";
		document.getElementById("submit_name").style.opacity = "1";
		document.getElementById("close_1").style.cursor = "pointer";
		document.getElementById("submit_name").style.cursor = "pointer";
		document.getElementById("change_name").style.transition = "0.3s";
		document.getElementById("close_1").style.transition = "0.3s";
		document.getElementById("submit_name").style.transition = "0.3s";
	} else if (x == 2) {
		document.getElementById("change_gender").style.border = "1px solid black";
		document.getElementById("change_gender").style.background = "white";
		document.getElementById("close_2").style.opacity = "1";
		document.getElementById("submit_gender").style.opacity = "1";
		document.getElementById("close_2").style.cursor = "pointer";
		document.getElementById("submit_gender").style.cursor = "pointer";
		document.getElementById("change_gender").style.transition = "0.3s";
		document.getElementById("close_2").style.transition = "0.3s";
		document.getElementById("submit_gender").style.transition = "0.3s";
	} else if (x == 3) {
		document.getElementById("change_phone").style.border = "1px solid black";
		document.getElementById("change_phone").style.background = "white";
		document.getElementById("close_3").style.opacity = "1";
		document.getElementById("submit_phone").style.opacity = "1";
		document.getElementById("close_3").style.cursor = "pointer";
		document.getElementById("submit_phone").style.cursor = "pointer";
		document.getElementById("change_phone").style.transition = "0.3s";
		document.getElementById("close_3").style.transition = "0.3s";
		document.getElementById("submit_phone").style.transition = "0.3s";
	} else if (x == 4) {
		document.getElementById("change_pwd").style.border = "1px solid black";
		document.getElementById("change_pwd").style.background = "white";
		document.getElementById("close_4").style.opacity = "1";
		document.getElementById("submit_pwd").style.opacity = "1";
		document.getElementById("close_4").style.cursor = "pointer";
		document.getElementById("submit_pwd").style.cursor = "pointer";
		document.getElementById("change_pwd").style.transition = "0.3s";
		document.getElementById("close_4").style.transition = "0.3s";
		document.getElementById("submit_pwd").style.transition = "0.3s";
	}
}

function close_name(x) {

	if (x == 1) {
		document.getElementById("change_name").style.border = "1px solid #f7f7f7 ";
		document.getElementById("change_name").style.background = "#f7f7f7";
		document.getElementById("close_1").style.opacity = "0";
		document.getElementById("submit_name").style.opacity = "0";
		document.getElementById("close_1").style.cursor = "default";
		document.getElementById("submit_name").style.cursor = "default";
	} else if (x == 2) {
		document.getElementById("change_gender").style.border = "1px solid #f7f7f7 ";
		document.getElementById("change_gender").style.background = "#f7f7f7";
		document.getElementById("close_2").style.opacity = "0";
		document.getElementById("submit_gender").style.opacity = "0";
		document.getElementById("close_2").style.cursor = "default";
		document.getElementById("submit_gender").style.cursor = "default";
	} else if (x == 3) {
		document.getElementById("change_phone").style.border = "1px solid #f7f7f7 ";
		document.getElementById("change_phone").style.background = "#f7f7f7";
		document.getElementById("close_3").style.opacity = "0";
		document.getElementById("submit_phone").style.opacity = "0";
		document.getElementById("close_3").style.cursor = "default";
		document.getElementById("submit_phone").style.cursor = "default";
	} else if (x == 4) {
		document.getElementById("change_pwd").style.border = "1px solid #f7f7f7 ";
		document.getElementById("change_pwd").style.background = "#f7f7f7";
		document.getElementById("close_4").style.opacity = "0";
		document.getElementById("submit_pwd").style.opacity = "0";
		document.getElementById("close_4").style.cursor = "default";
		document.getElementById("submit_pwd").style.cursor = "default";
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
	 
function go_detail(nseq) {
	 var url = "noticeDetail&nseq=" + nseq; 
	 document.frm.action = url;
	  document.frm.submit(); }






