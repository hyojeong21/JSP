<%@page import="webprj.util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
JSFunction.alertLocation("테스트용", "scopeExam.jsp", out);
%>

</body>
</html>