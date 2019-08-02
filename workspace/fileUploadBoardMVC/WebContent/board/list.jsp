<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.board.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>MVC 게시판</title>
</head>

<body>
	<!-- 게시판 리스트 -->

	<table width=50% border="0" cellpadding="0" cellspacing="0">
		<c:if test=" ${ listcount > 0}">
		<tr align="center" valign="middle">
			<td colspan="4">MVC 게시판</td>
			<td align=right><font size=2>글 개수 : ${listcount }</font></td>
		</tr>

		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
				height="26">
				<div align="center">번호</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
				<div align="center">제목</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
				<div align="center">작성자</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
				<div align="center">날짜</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
				<div align="center">조회수</div>
			</td>
		</tr>

		<%
			for (int i = 0; i < boardList.size(); i++) {
					BoardVO bl = (BoardVO) boardList.get(i);
		%>
		<tr align="center" valign="middle" bordercolor="#333333"
			onmouseover="this.style.backgroundColor='F8F8F8'"
			onmouseout="this.style.backgroundColor=''">
			<td height="23" style="font-family: Tahoma; font-size: 10pt;"><%=bl.getBOARD_NUM()%>
			</td>

			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="left">
					<%
						if (bl.getBOARD_RE_LEV() != 0) {
					%>
					<%
						for (int a = 0; a <= bl.getBOARD_RE_LEV() * 2; a++) {
					%>
					&nbsp;
					<%
						}
					%>
					▶
					<%
						} else {
					%>
					▶
					<%
						}
					%>
					<a href="./BoardDetailAction.do?num=<%=bl.getBOARD_NUM()%>"> <%=bl.getBOARD_SUBJECT()%>
					</a>
				</div>
			</td>

			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center"><%=bl.getBOARD_NAME()%></div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center"><%=bl.getBOARD_DATE()%></div>
			</td>
			<td style="font-family: Tahoma; font-size: 10pt;">
				<div align="center"><%=bl.getBOARD_READCOUNT()%></div>
			</td>
		</tr>
		<%
			}
		%>
		<tr align=center height=20>
			<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
				<%
					if (nowpage <= 1) {
				%> [이전]&nbsp; <%
 	} else {
 %> <a
				href="./BoardList.do?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 			if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a
				href="./BoardList.do?page=<%=a%>">[<%=a%>]
			</a>&nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a
				href="./BoardList.do?page=<%=nowpage + 1%>">[다음]</a> <%
 	}
 %>
			</td>
		</tr>
		</c:if>
		<c:if test="${ listcount <= 0}">
		<tr align="center" valign="middle">
			<td colspan="4">MVC 게시판</td>
			<td align=right><font size=2>등록된 글이 없습니다.</font></td>
		</tr>
		</c:if>
		<tr align="right">
			<td colspan="5"><a href="./BoardWrite.do">[글쓰기]</a></td>
		</tr>
	</table>

</body>
</html>