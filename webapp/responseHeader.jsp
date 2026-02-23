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
//add ... Header는 같은 키라도 누적되어서 헤더를 추가할 수 있음..
response.addDateHeader("today", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);
response.addHeader("myName", add_str);

//set ... Header는 같은 키는 덮어쓰는 특징이 있음
response.setHeader("myName", "hello world"); // 덮어씀
%>

<body>

<h2>응답헤더 정보</h2>

<%
// Collection: 여러 개 데이터를 담는 리스트
// 현재 response에 들어있는 모든 헤더 이름 목록 가져오기
Collection<String> headerNames = response.getHeaderNames();

// for(자료형 변수: 리스트)
// headerNames 안에 있는 값을 하나씩 꺼내서 name 변수에 넣는다
for(String name : headerNames) {
    // 해당 헤더 이름의 값을 가져오기
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