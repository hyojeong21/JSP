<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 페이지</h2>
<jsp:include page="../Common/link.jsp"/>
<%
// 이 페이지가 로딩될 때 userId라는 키로 session 정보가 있는지 확인함
if(session.getAttribute("userId") == null) {	// 세션 정보가 없다면
	// 로그인 form을 열어준다
%>
<form action="LoginProcess.jsp" method="post">
	ID: <input type="text" name="id"> <br>
	PW: <input type="password" name="pass"> <br>
	<input type="submit" value="로그인">
</form>
<%
} else {	// 로그인한 세션 정보가 있다면
%>
	<%= session.getAttribute("userName") %>님, 로그인했음 <br>
	<a href="logout.jsp">[로그아웃]</a>
<%
}
%>

</body>
</html>