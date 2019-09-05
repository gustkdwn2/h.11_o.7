<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>
	 	전달 결과 :
 		${ result }
	<c:set value="${ result }" var = "x"></c:set>
	<c:out value="${ x }" />
	
</body>
</html>