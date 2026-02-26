<%@page import="java.util.HashMap"%>
<%@page import="webprj.board1.daos.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   

<%
HashMap<String, Object> map = new HashMap();
map.put("start", 1);
map.put("end", 10);
%>
<c:set var="list" value="<%=new BoardDAO().selectList(map) %>"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach begin="1" end="10" step="1" var="i" varStatus="sts">		<%-- 1부터 10까지 1씩 증가 --%>
	${i } : ${sts.first } : ${sts.count } : ${sts.last }
	<c:if test="${i mod 2 ne 0 }">		<%-- ne는 ==과 같음 --%> 
		<c:set value="${sum + i }" var="sum"/>		<%-- 짝수만 더하라는 뜻 --%>
	</c:if>
</c:forEach>
${sum }

<hr>

${list }

<hr>

<c:forEach items="${list }" var="dto">
	${dto.title }
</c:forEach>

<c:redirect context="/electric2" url="/eleMain.html"/>

</body>
</html>