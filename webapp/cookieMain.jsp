<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1. 쿠키 설정</h2>
<%
Cookie cookie = new Cookie("mycookie","쿠키값");
// 부가정보 세팅
// 루트 패스에 저장함.. 이렇게 하면 하위 패스에서도 쿠키를 가져다 사용가능함
cookie.setPath("/");	
// 만약 특정 path를 지정하면, 해당 path 경로나 그 이하에서만 사용 가능함
cookie.setMaxAge(3600);
response.addCookie(cookie);
%>


<h2>쿠키 정보 보기</h2>
<%
// request 객체로부터 사용자의 모든 쿠키를 []로 얻어낸다
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		
		out.println(cookieName + " : " + cookieValue + "<br>");
	}
}
%>

</body>
</html>