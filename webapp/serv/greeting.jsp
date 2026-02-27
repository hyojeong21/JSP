<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${id } 님. ${msg }!!

<%-- 
<%=request.getContextPath() %> :
<%=request.getRequestURI() %> : 
<%=request.getRequestURL() %>
--%>

<a href="<%=request.getContextPath() %>/serv/AnnoMapping.do">어노테이션 가기</a>

</body>
</html>