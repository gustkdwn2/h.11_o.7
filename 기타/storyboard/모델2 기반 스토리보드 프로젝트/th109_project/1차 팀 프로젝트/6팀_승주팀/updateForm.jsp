<%-- <%@page import="juju.course.model.*"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../view/color.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 수정하기</title>
<link href = "../view/mystyle.css" rel = "stylesheet" type = text/css">

<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type = "text/javascript" src = "../view/script.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
		
		var option = "";
		$('#category1').change(function(){
			alert("message...");
			option = $(this).find('option:selected').val();
			//var index = options[selectedIndex].value;
			console.log(option );
			$('#subcategory').val(option);
			console.log($('#subcategory').val(option));
		
		});
		 var str = "";
		 
		 $( "#subcategory option:selected" ).each(function() {
			 $('#subcategory').val(option).text();
		      //str += $( this ).text() + " ";
		      //alert("여기 나온거임? " + str + " ");
		  }); 
	});
		  
</script>

</head>
<body bgcolor = "${ bodyback_c}">
<center><b>글 수정하기</b></center><br>

<form action = "updatePro.do?pageNum=${pageNum}" method="post" name = "updateForm" onsubmit="return writeSave()">
<input type="hidden" name="c_no" value="${vo.c_no}" >


<table width='400' border='1' cellspacing='0' cellpadding='0' bgcolor="${ bodyback_c }"
align="center">


<tr>
	<td align = "right" colspan="2"  bgcolor="${value_c}">
	<a href = "list.do"> 글목록 보기</a>
	</td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 아이디</td>
	<td width="330"><input type="text" size= "10" maxlenth="10" name = "id" value="${ vo.c_id}"></td> <!-- 나중에 회원이랑 합치면 id는 저장된 값으로  -->
</tr>

<tr>
	<td width="70" bgcolor = "${ value_c }" align = "center"> 지역이름 </td>
	<td width="330">
 
	<select id="location" name="location" > 
	    	<%-- <option value="${vo.c_location}">${vo.c_location}</option> --%>
			<option value="강릉" <c:if test="${vo.c_location} == 강릉">selected</c:if>>강릉</option>
			<option value="경주" <c:if test="${vo.c_location}  == 경주 ">selected</c:if>>경주</option>
			<option value="광주" <c:if test="${vo.c_location}  == 광주 ">selected</c:if>>광주</option>
			<option value="남원" <c:if test="${vo.c_location}">selected</c:if>>남원</option>
			<option value="단양" <c:if test="${vo.c_location}">selected</c:if>>단양</option>
			<option value="대구" <c:if test="${vo.c_location}">selected</c:if>>강릉</option>
			<option value="대전">대전</option>
			<option value="동해">동해</option>
			<option value="목포">목포</option>
			<option value="보령">보령</option>
			<option value="부산">부산</option>
			<option value="수원">수원</option>
			<option value="속초">속초</option>
			<option value="순천">순천</option>
			<option value="안동">안동</option>
			<option value="여수">여수</option>
			<option value="울릉도">울릉도</option>
			<option value="울산">울산</option>
			<option value="인천">인천</option>
			<option value="일산">일산</option>
			<option value="전주">전주</option>
			<option value="제주도">제주도</option>
			<option value="제천">제천</option>
			<option value="창원(진해)">창원(진해)</option>
			<option value="춘천">춘천</option>
			<option value="충주">충주</option>
			<option value="통영(거제)">통영(거제)</option>
			<option value="태안">태안</option>
			<option value="포항">포항</option>
			<option value="해남">해남</option>			
		</select>
	
	</td>
</tr>

<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 제  목</td>
	<td width="330">
	<input type= "text" size = "40" maxlength="50" name = "subject"  value="${ vo.c_subject}"></td>
</tr>

<!--  --------------------------------------------------------------------------------------------- -->


<tr>
	<td width="70" bgcolor = "${ value_c }" align = "center"> 코스소개 </td>
	<td width="330"><textarea rows="16" cols="40" name = "path" value="${vo.c_path}" >${vo.c_path}</textarea></td>
</tr>
<tr>
	<td width="70" bgcolor = "${value_c}" align = "center"> 비밀번호</td>
	<td width="330"><input type="password" size= "8" maxlenth="10" name ="passwd"></td>
</tr>


<tr>
	<td align="center" colspan="2" bgcolor="${ value_c}">
	<input type = "submit" value = "글수정">
	<input type= "reset" value = "다시작성">
	<input type = "button" value = "목록보기" onclick="windows.location='list.do?pageNum=${pageNum}'">
</tr> 

</table>

</form>

</body>
</html>