var joinCheck = 0;
function joinConfirm(){
	if ($("#mem_pwd1").val() != $("#mem_pwd2").val()) {
		alert("비밀번호를 확인 해 주세요."); return false;
	} else if(joinCheck<2) {
		alert("멤버십 번호 및 이메일 확인을 해주세요."); return false;
	} else{
		alert("넘어간다");
		return true;
	}
}

function memNumCheck() {
	joinCheck += 1;
	var mem_num1 = document.getElementById("mem_num1").value;
	var mem_num2 = document.getElementById("mem_num2").value;
	var mem_num3 = document.getElementById("mem_num3").value;
	var mem_num4 = document.getElementById("mem_num4").value;
	if (mem_num1 == 0||mem_num2 == 0||mem_num3 == 0||mem_num4 == 0) {
		alert("멤버십번호를 입력해주세요.");
	} else {
		window.open("memNumCheck.do?mem_num1="+mem_num1+"&mem_num2="+mem_num2
				+"&mem_num3="+mem_num3+"&mem_num4="+mem_num4, "멤버십번호 check", "width=300 height=200");
	}
}

function memNumConfirm(num1,num2,num3,num4){
	opener.mem_num1.value=num1;
	opener.mem_num2.value=num2;
	opener.mem_num3.value=num3;
	opener.mem_num4.value=num4;
	window.close();
}
function memEmailConfirm(email){
	opener.document.getElementById("mem_email").value=email;
	window.close();
}

function memEmailCheck(){
	joinConfirm += 1;
	var mem_email = document.getElementById("mem_email").value;
	if (mem_email == 0) {
		alert("E-mail을 입력해주세요.");
	} else if(mem_email.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+.[a-zA-Z.]+$/)) {
		window.open("memEmailCheck.do?mem_email="+mem_email, "E-mail check", "width=300 height=200");
	} else{
		alert("올바른 이메일을 입력해주세요.")
	}
}

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