<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500'
	rel='stylesheet' type='text/css'>
<link rel='stylesheet' type='text/css' href='css/index.css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/join.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#joinBtn").click(function() {
		$("#joinModal").modal();
	});
	$("#loginBtn").click(function() {
		$("#loginModal").modal();
	});
	$("#mem_pwd2").keyup(function() {
		if ($("#mem_pwd1").val() != $("#mem_pwd2").val()) {
			$("#confirmSpan").html("<font color='red'>입력한 비밀번호가 다릅니다.</font");
		} else {
			$("#confirmSpan").html("<font color='blue'>입력한 비밀번호가 같습니다.</font>");
		}
	});
});

function resultConfirm(r){
	if(r==1){
		alert("아이디/비밀번호가 맞지 않습니다.");
	}
}
</script>
</head>
<body onload="resultConfirm(${result})">

	<div id="leftSpace"></div>
	<div id="logoSpace">
		<p><a href="index.do">KostarBucks</a></p>
	</div>
	<div id="navSpace">
		<ul>
		<c:if test="${!empty loginInform}">
		<li><a href="mySaleList.do?mem_num=${loginInform.mem_num }">${loginInform.mem_name }님</a></li>
		<li><a href="logout.do">로그아웃</a></li>
		</c:if>
		<c:if test="${empty loginInform}">
			<li><a id="loginBtn" style="cursor: pointer;">로그인</a></li>
		</c:if>
			<li><a href="chainList.do">매장찾기</a></li>
			<li><a href="ideaList.do">아이디어</a></li>
		</ul>
	</div>
	<div id="middleSpace">
		<div id="headerContent">
		<c:if test="${empty loginInform}">
			Welcome To KostarBucks! <br>가입하여 많은 혜택을 누려보세요 <br> <br>
			<button type="button" id="joinBtn" class="btn btn-warning btn-lg">가입하기</button></c:if>
		<c:if test="${!empty loginInform}">
			Welcome To KostarBucks! <br>아이디어 내고, 상품권 받자! <br> <br>
			<button type="button" class="btn btn-warning btn-lg" 
			onclick="javascript:location.href='ideaWriteForm.do'">공모하기</button></c:if>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="joinModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">J O I N</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="join.do" method="post" onsubmit="return joinConfirm()">
						<div class="form-group">
							<label for="mem_num"> 멤버십번호</label> 
								<input type="text"  id="mem_num1" name="mem_num1" 
								required="required" style="width:40px;">
								- <input type="text" name="mem_num2" id="mem_num2" required="required" style="width:40px;">
								- <input type="text" name="mem_num3" id="mem_num3"  required="required" style="width:40px;">
								- <input type="text" name="mem_num4" id="mem_num4"  required="required" style="width:40px;">
								<button type="button" class="btn btn-warning btn-sm" onclick="memNumCheck()">확인</button>
						</div>
						<div class="form-group">
							<label for="mem_name"> 이름</label> <input
								type="text" class="form-control" id="mem_name" name="mem_name"
								placeholder="홍길동" required="required">
						</div>
						<div class="form-group">
							<label for="mem_phone"> 연락처</label> <input
								type="text" class="form-control" id="mem_phone" name="mem_phone"
								placeholder="010-123-3456" required="required">
						</div>
						<div class="form-group">
							<label for="mem_email"> Email <font color="red"> * 로그인 및 각종 이벤트시 사용할 Email입니다.</font></label> <input
								type="email" class="form" id="mem_email" name="mem_email"
								placeholder="kostarbucks@kosta.com" required="required" style="width:80%;">
								<button type="button" class="btn btn-warning btn-sm" onclick="memEmailCheck()">중복확인</button>
						</div>
						<div class="form-group">
							<label for="mem_pwd1"> 비밀번호</label> <input
								type="password" class="form-control" id="mem_pwd1" name="mem_pwd1"
								 required="required">
						</div>
						<div class="form-group">
							<label for="mem_pwd2"> 비밀번호확인</label> <input
								type="password" class="form-control" id="mem_pwd2" name="mem_pwd2"
								 required="required">
								 <span id="confirmSpan"></span>
						</div>
						<button type="submit" class="btn btn-warning btn-block">
							 J O I N
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">L O G I N</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="login.do" method="post">
						<div class="form-group">
							<label for="mem_email"> Email</label> <input
								type="text" class="form-control" id="mem_email" name="mem_email"
								placeholder="이메일" required="required">
						</div>
						<div class="form-group">
							<label for="mem_pwd"> Password</label> <input
								type="password" class="form-control" id="mem_pwd" name="mem_pwd"
								placeholder="비밀번호" required="required">
						</div>
						<button type="submit" class="btn btn-warning btn-block">
							 Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>