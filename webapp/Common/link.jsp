<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="90%">
	<tr>
		<td align="center">
		<%
		if (session.getAttribute("userId") == null) {
		%>
			<a href="../session/loginForm.jsp">로그인</a>
		<%
		} else {
		%>
			<a href="../session/logout.jsp">로그아웃</a>
		<%
		}
		%>
		&nbsp;&nbsp;&nbsp;
			<a href="../board1/list.jsp">게시판(페이징X)</a>
		&nbsp;&nbsp;&nbsp;
			<a href="../board2/list.jsp">게시판(페이징O)</a>
		</td>
	</tr>
</table>

</body>
</html>