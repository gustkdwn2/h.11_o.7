<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판상세보기</title>
</head>
<body>
	<header><%@include file="../header&footer/header.jsp"%></header>
	<script type="text/javascript" src="<c:url value='js/idea.js'/>"></script>
	<div id="middleSpace">
		<div id="title">
			<h2>IDEA BOARD</h2>
			<hr>
			<p>반짝이는 아이디어를 올려주세요!</p>
		</div>
		<br>
		<br>
		<table width="100%" class="table table-condensed">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tr>
				<th>제목</th>
				<td colspan="3">${ideaDetail.idea_title }</td>
			</tr>
			<tr>
				<th>번호</th>
				<td>${ideaDetail.idea_num }</td>
				<th>날짜</th>
				<td><f:formatDate value="${ideaDetail.idea_date }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ideaDetail.mem_name }</td>
				<th>조회수</th>
				<td>${ideaDetail.idea_readcount }</td>
			</tr>
			<tr>
				<td colspan="4">${ideaDetail.idea_content }</td>
			</tr>
		</table>
		<c:if test="${loginInform.mem_name eq ideaDetail.mem_name }">
			<div width="100%" align="center">
				<button type="button" class="btn btn-warning btn-sm" 
					onclick="javascript:location.href='ideaUpdateForm.do?idea_num=${ideaDetail.idea_num}'">수정</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="delConfirm('${ideaDetail.idea_num}')">삭제</button>
			</div>
		</c:if>
		<c:if test="${loginInform.mem_name ne ideaDetail.mem_name }">
			<c:if test="${loginInform.mem_name eq '관리자' }">
				<div width="100%" align="center">
					<button type="button" class="btn btn-warning btn-sm"
						onclick="delConfirm('${ideaDetail.idea_num}')">삭제</button>
					<c:if test="${ ideaDetail.idea_state eq '일반'}">
	                <button type="button" class="btn btn-warning btn-sm"
	                  onclick="choiceConfirm('${ideaDetail.mem_name }', '${ideaDetail.idea_num }')">채택</button>
	                </c:if>
	                <c:if test="${ ideaDetail.idea_state ne '일반'}">
	                <button type="button" class="btn btn-warning btn-sm" onclick="javascript:alert('이미 채택되었습니다.')">채택완료</button>
	                </c:if>
				</div>
			</c:if>
		</c:if>
	</div>
		<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>