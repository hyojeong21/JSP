<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:forward page="b.jsp">
	<jsp:param value="hyojeong" name="param"/>
</jsp:forward>

<%
// request.getRequestDispatcher("b.jsp?param=jason").forward(request, response);
%>