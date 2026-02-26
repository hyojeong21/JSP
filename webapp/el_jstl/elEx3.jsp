<%@page import="webprj.board1.dtos.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="webprj.board1.dtos.BoardDTO"/>

<%
dto.setId("hyojeong");
request.setAttribute("dto", dto);
request.setAttribute("reqScoP1", "값1");
request.setAttribute("reqScoP2", "값2");
%>

<!-- request에 데이터 저장했으니 forward를 통해서 elEx4에 요청을 전달한다. 이때 파라미터도 같이 생성해서 보냄.
forward는 요청을 그대로 전달함. 그래서 request 객체 그대로 이동. URL은 Ex3이지만 결과는 Ex4 나옴. 
elEx3 실행 → request에 데이터 저장 → forward → elEx4 출력-->
<jsp:forward page="elEx4.jsp">
	<jsp:param value="hello" name="msg1"/>
	<jsp:param value="world" name="msg2"/>
</jsp:forward>