function ideaDetail(num,mem_name,writer){
	if(mem_name==0){
		alert("로그인 후 이용가능합니다.");
	}else if(mem_name!='관리자'){
		if(mem_name != writer){
			alert("작성하신 글만 볼 수 있습니다.")
		}else{
			location.href="ideaDetail.do?idea_num="+num;
		}
	}else{
		location.href="ideaDetail.do?idea_num="+num;
	}
}
function delConfirm(num){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="ideaDelete.do?idea_num="+num;
	}
}

function choiceConfirm(num){
	if(confirm("아이디어를 채택하시겠습니까?")){
		location.href="mail.do?idea_num="+num;
	}
}