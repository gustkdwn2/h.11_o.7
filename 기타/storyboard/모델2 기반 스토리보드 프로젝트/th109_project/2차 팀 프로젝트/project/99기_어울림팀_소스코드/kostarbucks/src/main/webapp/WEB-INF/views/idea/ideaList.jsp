<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디어게시판</title>
</head>
<body>
	<header><%@include file="../header&footer/header.jsp"%></header>
	<script type="text/javascript" src="<c:url value='js/idea.js'/>"></script>
	<div id="middleSpace">
	<div id="title">
	<h2>IDEA BOARD</h2>
	<hr>
	<p>반짝이는 아이디어를 올려주세요!</p></div>
	<br><br>
		<table width="100%" class="table">
			<colgroup>
				<col width="10%">
				<col width="50%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src="<c:url value='img/icon/notice.png' />"
						width="25"></td>
					<td><a href="ideaDetail.do?idea_num=${ideaNotice.idea_num}">
							${ideaNotice.idea_title }</a></td>
					<td>${ideaNotice.mem_name }</td>
					<td><f:formatDate value="${ideaNotice.idea_date }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<c:forEach items="${ideaList }" var="list">
					<tr>
						<td>${list.idea_num }</td>
						<td><span style="cursor: pointer;" onclick="ideaDetail('${list.idea_num}','${loginInform.mem_name}','${list.mem_name}')">${list.idea_title }</span></td>
						<td>${list.mem_name }</td>
						<td><f:formatDate value="${list.idea_date }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${!empty loginInform}">
		<button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='ideaWriteForm.do?'">글쓰기</button>
		</c:if>

		<!-- 페이징 table -->
		<table width="100%">
			<tr>
				<td align="center">
					<!-- 처음 이전 링크 --> <c:if test="${pg>block}">
						<!-- 5>10 : false / 15>10 : true -->

						<a href="stock_list.do?pg=1"><img
							src="<c:url value='img/icon/arrowsleft.png'/>"></a>
						<a href="stock_list.do?pg=${fromPage-1}"><img
							src="<c:url value='img/icon/arrowleft.png'/>"></a>
					</c:if> <c:if test="${pg<=block}">
						<!-- 5<=10 :true / 15<=10:false -->
						<span style="color: gray"><img
							src="<c:url value='img/icon/arrowsleft.png'/>"></span>
						<span style="color: gray"><img
							src="<c:url value='img/icon/arrowleft.png'/>"></span>
					</c:if> <!-- 블록 범위 찍기 --> <c:forEach begin="${fromPage}" end="${toPage}"
						var="i">
						<c:if test="${i==pg}">${i}</c:if>
						<c:if test="${i!=pg}">
							<a href="stock_list.do?pg=${i}">${i}</a>
						</c:if>
					</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
						<!-- 20<21 : true -->
						<a href="stock_list.do?pg=${toPage+1}"><img
							src="<c:url value='img/icon/arrowright.png'/>"></a>
						<a href="stock_list.do?pg=${allPage}"><img
							src="<c:url value='img/icon/arrowright.png'/>"></a>
					</c:if> <c:if test="${toPage>=allPage}">
						<!-- 21>=21 :true -->
						<span style="color: gray"><img
							src="<c:url value='img/icon/arrowright.png'/>"></span>
						<span style="color: gray"><img
							src="<c:url value='img/icon/arrowsright.png'/>"></span>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>