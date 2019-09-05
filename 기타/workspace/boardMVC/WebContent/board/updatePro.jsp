<!-- updatePro.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding  value="UTF-8"/>

<meta http-equiv="Refresh" content="0; url=list.do?pageNum=${pageNum}" >	
	

<c:if test="${ check == 0 }">
	<script type="text/javascript">
		<!--
		alert("아이디나 비밀 번호가 맞지 않습니다.");
		history.go(-1);
		//-->
	</script>
</c:if>

<!-- <a href="javascript:history.go(-1)">[글삭제 폼으로 돌아가기]</a>
 -->













