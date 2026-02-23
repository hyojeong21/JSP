<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.removeAttribute("userId");
session.removeAttribute("userPass");
session.removeAttribute("userName");
session.removeAttribute("reg_date");

session.invalidate();

response.sendRedirect("loginForm.jsp");
%>