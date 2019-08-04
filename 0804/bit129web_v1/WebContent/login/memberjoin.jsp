<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./MemberjoinAction.do" method="post" name="memberjoinform">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberjoin_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberjoin_pwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberjoin_name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="memberjoin_email"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="memberjoin_phone"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>