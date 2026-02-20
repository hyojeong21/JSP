<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입 처리를 위한 JSP</h2>
<!-- request: 브라우저가 서버로 보낸 모든 정보가 들어있는 객체 -->
<%
//  URL에서 newId 값 하나만 가져오기
String id = request.getParameter("newId");
String password = request.getParameter("newPassword");
String password2 = request.getParameter("newPassword2");
String name = request.getParameter("newName");
String address = request.getParameter("newAddress");
String detailAddress = request.getParameter("newDetailAddress");
%>

<h3>전달된 값</h3>

ID: <%=id %> <br>
PW: <%=id %> <br>
Name: <%=id %> <br>
Address: <%=id %> <br>
Detail Address: <%=id %> <br>

<h3>파라미터 이름</h3>
<%
// getParameterNames(): 전달된 파라미터의 이름 목록, Enumeration: 여러 개의 데이터를 하나씩 꺼내는 도구
Enumeration names = request.getParameterNames();
// 데이터가 있으면 계속 꺼내라
while (names.hasMoreElements()){
   out.println(names.nextElement());
}

//  getParameterMap(): 전체 데이터. 모든 파라미터를 한 번에 가져오기. Map은 key: value 구조
Map map = request.getParameterMap();
out.println(map);
out.println("<hr>");
// Map 전체 데이터를 꺼낼 준비
Set es = map.entrySet();
out.println(es.size());
%>

<h3>요청 헤더 정보 알아보기</h3>
<%
Enumeration headerEn = request.getHeaderNames();
while (headerEn.hasMoreElements()) {
String key = (String)headerEn.nextElement();
// getHeader(): 헤더 하나
String value = request.getHeader(key);

out.println(key + " : " + value + "<br>");
}
%>

<!-- URL 정보 가져오기 -->
<%= request.getPathInfo() %> <br>
<!-- 프로젝트 경로 -->
<%= request.getContextPath() %> <br>
<!-- URL의 파라미터 전체 -->
<%= request.getQueryString() %> <br>

</body>
</html>