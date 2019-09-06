<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KostarBucks</title>
<link rel='stylesheet' type='text/css' href='css/header&footer.css'>
<link rel='stylesheet' type='text/css' href='css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'>
<link rel='stylesheet' type='text/css' href='css/title.css'>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").click(function() {
		$("#loginModal").modal();
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
	<div id="nullSpace"></div>
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