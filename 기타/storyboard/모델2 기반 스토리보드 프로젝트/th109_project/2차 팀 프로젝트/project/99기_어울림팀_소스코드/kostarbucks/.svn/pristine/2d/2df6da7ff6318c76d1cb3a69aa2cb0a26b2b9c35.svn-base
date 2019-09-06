<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글작성</title>
</head>
<body>
	<header><%@include file="../header&footer/header.jsp"%></header>
	<script type="text/javascript" src="<c:url value='js/idea.js'/>"></script>
<script type="text/javascript" src="<c:url value='resource/editor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
    //전역변수
    var obj = [];               
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "ir1",
        sSkinURI: "/kostarbucks/resource/editor/SmartEditor2Skin.jsp", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
    //전송버튼
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    })
})
</script>
	<div id="middleSpace">
	<div id="title">
	<h2>IDEA BOARD</h2>
	<hr>
	<p>반짝이는 아이디어를 올려주세요!</p></div><br><br>
	<div style="width:660px; margin: auto;">
	<form role="form" action="ideaWrite.do" method="post" id="frm">
						<div class="form-group">
							<label for="idea_title"> 제목</label> 
							<input type="text" class="form-control" id="idea_title" name="idea_title"
								required="required">
						</div>
						<div class="form-group">
							<label for="mem_name"> 이름</label> <input
								type="text" class="form-control" id="mem_name" name="mem_name"
								value="${loginInform.mem_name }" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="ir1"> 내용</label> 
							<textarea required="required"  id="ir1" name="idea_content" style="width: 650px; height: 350px;"></textarea>
						</div>
						
						<p align="center"><button type="button" id="savebutton" class="btn btn-warning btn-sm">
							작성완료
						</button></p>
					</form>
	</div>
	</div>
	<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>