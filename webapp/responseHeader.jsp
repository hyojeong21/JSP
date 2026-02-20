<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 헤더 설정 및 보기</title>
</head>

<%
// 파라미터 get 및 헤더에 정보 추가하기
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = sdf.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

// 응답 헤더에 값 추가해서 응답하기
response.addDateHeader("today", add_date);
response.addIntHeader("myNumber", add_int);
//add ... Header는 같은 키라도 누적되어서 헤더를 추가할 수 있음..
//set ... Header는 같은 키는 덮어쓰는 특징이 있음
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);
response.setHeader("myName", "hello world"); // 덮어씀
%>

<body>

<h2>응답헤더 정보</h2>

<%
Collection<String> headerNames = response.getHeaderNames();

for(String name : headerNames) {
    String value = response.getHeader(name);
%>
    <li><%=name %> : <%=value %></li>
<%
}
%>

<%
Collection<String> myNumbers = response.getHeaders("myNumber");

for(String value : myNumbers) {
%>
    <li>myNumber : <%=value %></li>
<%
}
%>

</body>
</html>