<%@page import="webprj.util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 페이지 로딩시 loginId라는 쿠키가 있는지 확인한다
String loginId = CookieManager.readCookie(request, "loginId");

// 체크박스 상태 처리
// 아이디 저장 쿠키가 존재하면 체크박스를 자동으로 체크하려는 목적.
String cookieCheck = "";
if(!loginId.equals("")){
   cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie를 이용한 ID 저장하기</title>
</head>
<body>

<h2>로그인 페이지</h2>
<form action="IdSaveProc.jsp" method = "post">
   ID: <input type = "text" name = "user_id" value = "<%=loginId %>">
   // 사용자가 체크하면 서버로 전달: save_check = y, 체크 안 하면: save_check = null
   <input type = "checkbox" name = "save_check" value = "y"><%=cookieCheck %>
   아이디 저장하기
   PW: <input type = "text" name = "user_pw">
   <br>
   <input type = "submit" value = "로그인하기">
</form>

</body>
</html>