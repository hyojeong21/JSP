<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

xml에 저장된 정보 보기: <%= application.getInitParameter("INIT_PARAM") %> <br>

<%= application.getRealPath("/webprj") %>

</body>
</html>