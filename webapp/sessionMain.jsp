<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 알아보기</title>
</head>
<body>

<%
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

long createTime = session.getCreationTime(); // 최초 세션 요청(생성 시간)
String creStr = sdf.format(new Date(createTime));

long lastTime = session.getLastAccessedTime();
String lastStr = sdf.format(new Date(lastTime));
%>

<h2>세션 설정 확인</h2>
<ul>
	<li>세션 유지 시간: <%=session.getMaxInactiveInterval() %></li>
	<li>세션 ID: <%=session.getId() %></li>
	<li>최초 요청 시간: <%=creStr %></li>
	<li>마지막 요청 시간: <%=lastStr %></li>
</ul>

</body>
</html>