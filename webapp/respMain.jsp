<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>

<h1>1. 로그인 폼</h1>
<%
String loginErr = request.getParameter("loginErr");   // loginErr 파라미터 가져오기
if (loginErr != null) out.println("로그인 실패");
%>
<form action="./responseLogin.jsp" method="post">   // 데이터를 responseLogin.jsp 로 POST 방식으로 전송
   ID: <input type = "text" name = "id"> <br>
   PW: <input type = "text" name = "pw"> <br>
   <input type = "submit" value = "로그인">
</form>

<h1>2. HTTP 응답 헤더 설정하기</h1>
<form action="responseHeader.jsp" method="get">
   날짜: <input type = "text" name = "add_date" value = "2026-02-20 11:20"> <br>
   숫자: <input type = "text" name = "add_int" value = "8282"> <br>
   이름: <input type = "text" name = "add_str" value = "홍길동"> <br>
   <input type = "submit" value = "응답 헤더 설정 및 출력">
</form>

</body>
</html>