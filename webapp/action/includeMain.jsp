<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 방식 차이점 알아보기</title>
</head>

<%
String out1Path = "out1.jsp";
String out2Path = "out2.jsp";

// include 되는 페이지에 전달될 데이터 setting
pageContext.setAttribute("pAtt","pAtt 변수의 값");
request.setAttribute("rAtt","rAtt 변수의 값");
%>

<body>

<h2>페이지 지시어와 액션 태그로 include 시 차이점</h2>
<%@ include file ="out1.jsp" %>
<p>외부 파일에서 설정한 변수 : <%=newVar%></p>

<h2>액션 태그를 이용한 페이지 include</h2>
<jsp:include page="<%=out2Path %>"/>

<jsp:forward page="a.jsp">
	<jsp:param value="하하하" name="param0"/>
</jsp:forward>

<%
// request.getRequestDispatcher("a.jsp").forward(request, response);
%>

</body>
</html>