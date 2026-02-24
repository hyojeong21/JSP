<%@page import="webprj.util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 이 페이지는 세션 검증만 한다
if(session.getAttribute("userId") == null) {
	JSFunction.alertLocation("로그인 후 이용하세요", "../session/loginForm.jsp", out);
	return;		// 명시적으로 종료
}
%> 