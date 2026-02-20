<%@page import="webprj.util.JSFunction"%>
<%@page import="webprj.util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 이 페이지에서는 사용자가 보내온 정보를 쿠키 저장여부에 따라서 저장 or 삭제하도록 로직을 작성함
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");

if("hyojeong".equals(user_id) && "1234".equals(user_pw)){
	if(save_check != null && save_check.equals("y")) {
		CookieManager.CookieMake(response, "loginId", user_id, 86400);
	} else {
		CookieManager.deleteCookie(response, "loginId");
	}
	JSFunction.alertLocation("로그인에 성공함", "IDSave.jsp", out);
} else {
	JSFunction.alertBack("로그인에 실패함", out);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>