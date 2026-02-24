<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true" buffer="8kb" %>
    
<!-- jsp 스크립트 요소에는 다음과 같이 존재한다
1. 페이지 지시어: JSP가 변환될 자바코드(앞으로는 서블릿이라고 할거임)의 전체 설정 정보를 나타냄. 특별하게 변경해서 사용될 요소는 없음. 첫 줄에 있는 거.
2. 페이지 include: 다른 페이지를 import해서 합쳐서 하나의 페이지로 만들때 사용함
3. tab lib 지시어: EL(나중에 배움)의 사용 여부를 선언하는 지시어
4. 내장 객체: 서블릿 API를 JSP에서 쉽게 사용할 수 있도록 객체화한것, 얘네들이 주 학습 타겟이다 -->

<!-- 페이지 지시어를 통해 예외가 발생하면 해당 페이지로 제어권을 넘기도록 한다
이때, 제어권을 받는 에러 핸들링 페이지는 내부적으로 exception 객체를 자동으로 사용할 수 있다
이렇게 해서 예외 내용을 찾아서 디버그에 활용할 수 있다 -->
<!-- 에러가 발생하면 IsErrorPage.jsp로 제어권을 넘기라는 의미 -->
<!-- <%= %>: 출력, <%! %>: 선언, <%@  %>: "이 JSP 페이지에 대한 설정을 하겠다" -->
<!-- page: 페이지 설정 --> 
<%@ page errorPage = "IsErrorPage.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%= "Hello World" %>

<hr>
<%
Date today = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String todayStr = sdf.format(today);

out.println("오늘 날짜: " + todayStr);
%>

<!-- jsp: java server page의 약자. 자바코드가 들어간 html 페이지로 짜여진 서버 페이지란 뜻 
이 페이지의 실행은 브라우저가 하는 게 아니고, WAS에서 수행되고, 이 결과가 html tag로 묶여서 클라이언트에게 응답(response)되어 지는 것이다.
client는 요청된 페이지의 결과를 html로 받기 때문에 웹 브라우저는 이 tag를 실행해서 사용자에게 결과를 랜더링할 뿐이다.
이러한 이유때문에 WAS가 필요하고, DATA를 가공하는 데는 JAVA가 사용된다.
참고로, JSP는 처음 요청이 왔을 때, 순수 자바코드로 WAS가 변환해준다.
이 코드를 컴파일해서 class를 생성하고, 이 class를 실행하여 DATA를 가공한다.-->

<hr>
<!-- 일부러 예외를 발생시킬거다. 예외 핸들링 하는 방법을 알아보기 위해서.. -->
<%
// URL에서 값 가져오기
int age = Integer.parseInt(request.getParameter("age"));
out.println("당신의 나이는 " + age);
%>

</body>
</html>