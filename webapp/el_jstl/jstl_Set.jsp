<%@page import="java.util.ArrayList"%>
<%@page import="webprj.board1.dtos.BoardDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<%-- c:set은 변수 생성, var는 변수 이름 --%>
<c:set var="a" value="abc"/> 
<c:set var="now" value="<%= new Date() %>"/>
<c:set var="elVar" value="hi" scope="page"/>
<c:set var="dto" value="<%=new BoardDTO() %>"/>
<c:set target="${dto }" property="id" value="hyojeong"/>

<%
BoardDTO dto1 = new BoardDTO();
BoardDTO dto2 = new BoardDTO();
dto1.setId("abc");
dto2.setId("def");
ArrayList<BoardDTO> list = new ArrayList();
list.add(dto1);
list.add(dto2);
// list를 request 스코프 영역에 list라는 key로 저장해보자..
request.setAttribute("list", list); 
%>

<c:set var="list2" value="<%=list %>"/>

<c:remove var="list2" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>EL로 변수 출력해보기</h2>
${a } : ${elVar } : ${now } : ${dto } : 
${requestScope.list[0].id } : ${list2[1].id }<br>

</body>
</html>