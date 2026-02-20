<%@page import="webprj.dtos.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>요청 스콥에 있는 데이터 get</h2>
<%
UserDTO user = (UserDTO)request.getAttribute("user");
%>

ID: <%= user.getId() %> <br> 
PW: <%= user.getPw() %> <br>

</body>
</html>