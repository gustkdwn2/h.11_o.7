var joinCheck = 0; // 유효성검사를 했는지 알기 위한 변수

// 유효성검사 확인
function joinConfirm(){
	if ($("#mem_pwd1").val() != $("#mem_pwd2").val()) {
		alert("비밀번호를 확인 해 주세요."); return false;
	} else if(joinCheck<2) {
		alert("멤버십 번호 및 이메일 확인을 해주세요."); return false;
	} else{
		return true;
	}
}

// 멤버십번호 유효성 체크
function memNumCheck() {
	joinCheck += 1;
	var mem_num1 = document.getElementById("mem_num1").value;
	var mem_num2 = document.getElementById("mem_num2").value;
	var mem_num3 = document.getElementById("mem_num3").value;
	var mem_num4 = document.getElementById("mem_num4").value;
	if (mem_num1 == ''||mem_num2 == ''||mem_num3 == ''||mem_num4 == '') {
		alert("멤버십번호를 입력해주세요.");
	} else {
		window.open("memNumCheck.do?mem_num1="+mem_num1+"&mem_num2="+mem_num2
				+"&mem_num3="+mem_num3+"&mem_num4="+mem_num4, "멤버십번호 check", "width=350 height=150");
	}
}

// 해당 멤버십 번호를 opener에 넣기
function memNumConfirm(num1,num2,num3,num4){
	opener.mem_num1.value=num1;
	opener.mem_num2.value=num2;
	opener.mem_num3.value=num3;
	opener.mem_num4.value=num4;
	window.close();
}

// 해당 이베일을 opener에 넣기
function memEmailConfirm(email){
	opener.document.getElementById("mem_email").value=email;
	window.close();
}

// 이메일 유효성 검사
function memEmailCheck(){
	joinConfirm += 1;
	var mem_email = document.getElementById("mem_email").value;
	if (mem_email == 0) {
		alert("E-mail을 입력해주세요.");
	} else if(mem_email.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+.[a-zA-Z.]+$/)) {
		window.open("memEmailCheck.do?mem_email="+mem_email, "E-mail check", "width=350 height=150");
	} else{
		alert("올바른 이메일을 입력해주세요.")
	}
}

// 새창에서 이메일 유효성 검사
function secondEmailCheck(){
	var mem_email = document.getElementById("mem_email").value;
	if (mem_email == 0) {
		alert("E-mail을 입력해주세요.");
		return false;
	} else if(mem_email.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+.[a-zA-Z.]+$/)) {
		return true;
	} else{
		alert("올바른 이메일을 입력해주세요.")
		return false;
	}
}