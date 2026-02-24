<%@page import="webprj.board1.dtos.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "IsLoggedIn.jsp" %>
<jsp:useBean id="dao" class="webprj.board1.daos.BoardDAO"/>
<%
// 파라미터 get, update 실행, DTO GET
String num = request.getParameter("num");
int bnum = 0;
if(num != null) {
	bnum = Integer.parseInt(num);
}
dao.updateVisitCount(bnum);
BoardDTO dto = dao.getArticle(bnum);
dao.close();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=dto %>

</body>
</html>