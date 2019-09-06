<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><%@include file="../header&footer/header.jsp"%></header>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#saleList").click(function() {
				$("#clicked").toggle();
			});
			$("#clicked1").hide();
			$("#level").click(function() {
				$("#clicked1").toggle();
			});
		});
	</script>
	<div id="middleSpace">
		<div id="title">
			<h2>My KostarBucks</h2>
			<hr>
			<p>내가 다녀간 발자국 보기</p>
		</div>
		<br> <br>
		<div style="margin-left:auto; margin-right:auto; height:100px; width: 45%;">
		<div style="float: left;">
			<img src="<c:url value='img/icon/coffee.png'/>" width="100"
				height="100">
		</div>
		<div
			style="margin-left: auto; margin-right: auto; background-color: red;">
			<c:if test="${loginInform.mem_rank ne 'Welcome Level'}">
			<c:if test="${loginInform.mem_name eq '관리자'}">
				<div style="float: left; height: 100px; margin-left:30px;">
				<br>
					<p><span style="font-size: 12pt;"><strong>${loginInform.mem_name }</strong>님 환영합니다.</span> <br>KostarBucks에 대한 지속적인 사랑
						부탁드립니다!
					</p>
				</div>
			</c:if>
			<c:if test="${loginInform.mem_name ne '관리자'}">
				<div style="float: left; height: 100px; margin-left:30px; ">
					<br>
					<p>
						<span style="font-size: 12pt;"><strong>${loginInform.mem_name }</strong>님은
							현재 <strong>${loginInform.mem_rank }</strong>입니다.</span> <br>KostarBucks에
						대한 지속적인 사랑에 감사드리며, <br>${loginInform.mem_rank }만의 특별한 혜택을
						누려보세요!
					</p>
				</div>
			</c:if></c:if>
			<c:if test="${loginInform.mem_rank eq 'Welcome Level'}">
				<div style="float: left; height: 100px; margin-left:30px;">
				<br>
					<p><span style="font-size: 12pt;"><strong>${loginInform.mem_name }</strong>님은현재
						<strong>${loginInform.mem_rank }</strong>입니다.</span> <br>KostarBucks에 대한 지속적인 사랑
						부탁드립니다!
					</p>
				</div>
			</c:if>
		</div>
</div>
		<div id="level" class="saleList">+ Level별 혜택보기</div>
		<div id="clicked1">
		<table class="table table-condensed">
		<tr>
		<th width="20%">Level</th>
		<th width="80%">혜택</th>
		</tr>
		<tr>
		<td><strong>Welcome Level</strong></td>
		<td>가입을 환영합니다!</td>
		</tr>
		<tr>
		<td><strong>Green Level</strong></td>
		<td>KostarBucks의 음료를 10잔이상 마셨군요! 모든 항목이 2% 할인됩니다.</td>
		</tr>
		<tr>
		<td><strong>Silver Level</strong></td>
		<td>KostarBucks의 음료를 30잔이상 마셨군요! 모든 항목이 5% 할인됩니다.</td>
		</tr>
		<tr>
		<td><strong>Gold Level</strong></td>
		<td>KostarBucks의 음료를 50잔이상 마셨군요! 모든 항목이 10% 할인됩니다.</td>
		</tr>
		</table>
		</div>
		<div id="saleList" class="saleList">+ My
			History</div>
		<div id="clicked">

			<c:if test="${!empty message}">
			${message}
		</c:if>
			<c:if test="${empty message}">
				<table width="50%" class="table table-condensed">
					<tr>
						<td>제품명</td>
						<td>체인점명</td>
						<td>날짜</td>
					</tr>
					<c:forEach items="${mySaleList }" var="list">
						<tr>
							<td>${list.item_name }</td>
							<td>${list.chain_name }</td>
							<td><f:formatDate value="${list.sale_date }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>

				<!-- 페이징 table -->
				<table width="100%">
					<tr>
						<td align="center">
							<!-- 처음 이전 링크 --> <c:if test="${pg>block}">

								<a href="mySaleList.do?pg=1&mem_num=${ loginInform.mem_num }"><img
									src="<c:url value='img/icon/arrowsleft.png'/>"></a>
								<a href="mySaleList.do?pg=${fromPage-1}&mem_num=${ loginInform.mem_num }"><img
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
									<a href="mySaleList.do?pg=${i}&mem_num=${ loginInform.mem_num }">${i}</a>
								</c:if>
							</c:forEach> <!-- 다음, 이후 --> <c:if test="${toPage<allPage}">
								<!-- 20<21 : true -->
								<a href="mySaleList.do?pg=${toPage+1}&mem_num=${ loginInform.mem_num }"><img
									src="<c:url value='img/icon/arrowright.png'/>"></a>
								<a href="mySaleList.do?pg=${allPage}&mem_num=${ loginInform.mem_num }"><img
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
			</c:if>
		</div>
	</div>
<footer><br>사업자등록번호 201-81-21515 (주)코스타벅스커피 코리아 대표이사 조항덕 TEL : 02) 3123-7894 / FAX : 02) 3123-7895 개인정보 책임자 : 박상현
<br><br>ⓒ 2015 Starbucks Coffee Company. All Rights Reserved.<br></footer>
</body>
</html>