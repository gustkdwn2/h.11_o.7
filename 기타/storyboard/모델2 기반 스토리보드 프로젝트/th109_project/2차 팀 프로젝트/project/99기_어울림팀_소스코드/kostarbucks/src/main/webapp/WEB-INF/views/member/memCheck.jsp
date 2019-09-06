<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유효성검사</title>
<link rel='stylesheet' type='text/css' href='css/bootstrap.css'>
<link rel='stylesheet' type='text/css' href='css/bootstrap.min.css'>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/join.js"></script>
</head>
<body style="background-color: #d8d8d8">
	<c:if test="${check eq 1 }">
<p align="center"><font color="red">멤버십번호가 잘못되었습니다.</font></p>
<form role="form" action="memNumCheck.do" method="post">
			<div class="form-group">
				<label for="mem_num"> 멤버십번호</label> <input type="text" id="mem_num1"
					name="mem_num1" required="required" style="width: 40px;"> -
				<input type="text" name="mem_num2" id="mem_num2" required="required"
					style="width: 40px;"> - <input type="text" name="mem_num3"
					id="mem_num3" required="required" style="width: 40px;"> - <input
					type="text" name="mem_num4" id="mem_num4" required="required"
					style="width: 40px;">
				<button type="submit" class="btn btn-warning btn-sm">확인</button>
			</div>
		</form>
	</c:if>
	<c:if test="${check eq 2 }">
	<p align="center"><font color="red">이미 가입하셨습니다.	</font></p>
	</c:if>
	<c:if test="${check eq 3 }">
	<p align="center"><font color="blue">멤버십번호가 확인되었습니다.</font></p>
	<button type="button" class="btn btn-warning btn-block"
			onclick="memNumConfirm('${mem_num1}','${mem_num2}','${mem_num3}','${mem_num4}')">
			번호확인</button>
	</c:if>
	<c:if test="${check eq 4 }">
	<p align="center"><font color="blue">사용 가능한 이메일입니다.</font></p>
	<button type="button" class="btn btn-warning btn-block"
			onclick="memEmailConfirm('${mem_email}')">이메일확인</button>
	</c:if>
	<c:if test="${check eq 5 }">
	<p align="center"><font color="red">이미 사용중인 이메일입니다.</font></p>
	<form role="form" action="memEmailCheck.do" method="post" onsubmit="return secondEmailCheck()">
			<div class="form-group">
				<label for="mem_email"> Email</label> <input type="email" class="form"
					id="mem_email" name="mem_email" placeholder="kostarbucks@kosta.com"
					required="required" style="width: 80%;">
				<button type="submit" class="btn btn-warning btn-sm">중복확인</button>
			</div>
		</form>
	</c:if>
</body>
</html>