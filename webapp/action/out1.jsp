<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>외부파일1</h1>
<%
String newVar ="newVar value";

// 페이지 영역에 데이터 저장한다. 이렇게 저장된 Data는 include하는 페이지에서도 사용 가능함
// 이유는 페이지 영역(pageScope)을 공유하기 때문임
%>

<li>페이지 Scope 속성: <%= pageContext.getAttribute("pAtt") %></li>
<li>req Scope 속성: <%= request.getAttribute("rAtt") %></li>


</body>
</html>