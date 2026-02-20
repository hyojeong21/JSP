<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 이게 선언문임..
String name;	// 이거는 JSP 전체에서 사용하는 전역 변수

public String getName(){
   return this.name;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트</title>
</head>
<body>
<%
String name = "서효정";	// 이건 지역 변수

// 브라우저에 데이터 출력시 out 객체를 이용하면 됨
out.println(this.name);

for (int i = 0; i < 5; i++) {
%>
   out.println("<b>" + i + "</b><br>");
   <%=i %> <br>
<%
}

// jsp 스크립트 요소: 3가지가 있음.. 선언부, 스크립트릿, 출력문
// 선언문은 변수나 메서드를 선언하거나 정의할 때 사용되며, 서블릿으로 변환시엔 멤버필드와 멤버 or static 메서드로 변환되어짐
// scriptlet은 was가 호출하는 서블릿의 메서드, 여기서는 _jspService()의 메서드의 내용으로 변환되어 사용됨. 가장 많이 사용하는 요소임
// 출력문(표현식)은 웹브라우저에 데이터를 출력하는 스크립트임
%>
</body>
</html>