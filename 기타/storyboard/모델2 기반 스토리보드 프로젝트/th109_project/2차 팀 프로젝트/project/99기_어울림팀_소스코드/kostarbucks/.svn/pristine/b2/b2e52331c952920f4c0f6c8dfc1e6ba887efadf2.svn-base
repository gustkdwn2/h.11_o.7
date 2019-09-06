<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장찾기</title>
</head>
<body>
	<header><%@include file="../header&footer/header.jsp"%></header>
	<script type="text/javascript" src="<c:url value='js/chain.js'/>"></script>
	<div id="middleSpace">
	<div id="title">
		<h2>Chain Store</h2>
		<hr>
		<p>나의 일상이 되는 또다른 공간</p></div><br><br>
	<c:forEach items="${list }" var="list">
	<div class="chainList" onclick="chainDetail('${list.chain_id}','${list.chain_name}')">
	<img src="<c:url value='img/chain/${list.chain_id }.jpg'/>">
	<p>${list.chain_name }</p>
	</div>
	</c:forEach>
	</div>
	<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>