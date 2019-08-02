<!-- ex09_sql.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>sql 태그 예제 - update</title>
</head>
<body>
	<sql:update  dataSource="jdbc:BoardDB" >
			update board set writer=? where num=?
			<sql:param  value="${ 'kingsmile' }"/>
			<sql:param  value="${ 7 }"/>
	</sql:update>
	
	<!-- ///////////////// select ////////////////////// -->
	
	<sql:query var="rs"  dataSource="jdbc:BoardDB" >
			select * from board
	</sql:query>
	
	
	<table border="1">
		<tr> <!--  필드명 -->
			<c:forEach var="columnName" items="${ rs.columnNames }">
				<th><c:out value="${columnName }" /></th>
			</c:forEach>
		</tr>
		
		<c:forEach var="row" items="${ rs.rowsByIndex }"> <!-- 레코드의 수만큼 반복 -->
			<tr>
				<c:forEach  var="column" items="${ row }"  varStatus="i"> <!-- 레코드의 필드 수 만큼 반복 -->
				  <td>
					<c:if test="${ column != null }"> <!-- 해당 필드값이 null이 아니면 -->
						<c:out value="${ column }"/>						
					</c:if>
					
					<c:if test="${ column == null }"> <!-- 해당 필드값이 null이면 -->
							&nbsp;					
					</c:if>
				  </td>
				</c:forEach>
			</tr>
		</c:forEach>
	
	</table>
	
</body>
</html>


















