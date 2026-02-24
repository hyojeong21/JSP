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
// pageContext : 현재 JSP 페이지 안에서만 사용 가능한 저장 공간
// request는 forward 또는 include 시 공유됨
pageContext.setAttribute("pAtt","pAtt 변수의 값");
request.setAttribute("rAtt","rAtt 변수의 값");
%>

<body>

<h2>페이지 지시어와 액션 태그로 include 시 차이점</h2>
// 실행 전에 파일을 합쳐버림. 즉 실제로는 현재 JSP 코드 + out1.jsp 코드 이렇게 하나의 파일처럼 컴파일됨
<%@ include file ="out1.jsp" %>
<p>외부 파일에서 설정한 변수 : <%=newVar%></p>

<h2>액션 태그를 이용한 페이지 include</h2>
// 실행 중에 include. 현재 JSP 실행 -> out2.jsp 실행 -> 결과만 가져옴
<jsp:include page="<%=out2Path %>"/>

// 현재 페이지 실행 중단하고 a.jsp로 이동
<jsp:forward page="a.jsp">
   <jsp:param value="하하하" name="param0"/>      // a.jsp에서 request.getParameter("param0") 으로 사용 가능
</jsp:forward>

<%
// forward: 페이지 강제 이동. 주소 안 바뀜
// request.getRequestDispatcher("a.jsp").forward(request, response);
%>

</body>
</html>