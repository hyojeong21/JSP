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

<h2>Scope 저장 페이지</h2>
<%
UserDTO user = new UserDTO();
user.setId("hyojeong");
user.setPw("1234");
request.setAttribute("user", user);
request.getRequestDispatcher("reqScope.jsp").forward(request, response);


// 세션영역에 user라는 key로, user 객체를 저장함
// 이렇게 저장된 객체는 클라이언트가 브라우저를 닫기 전까지 서버에 정보가 계속 저장됨
session.setAttribute("user", user);
%>

</body>
</html>