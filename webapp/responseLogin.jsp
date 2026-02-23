<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// 파라미터 get..
String id = request.getParameter("id");   // 사용자가 보낸 데이터 전체(request) 중에 name이 id인 값을 꺼낸다고 생각
String pw = request.getParameter("pw");

// 암호와 ID 검증 로직 작성..
// equalsIgnoreCase(): 대소문자 구분 없이 같으면 true, equals(): 문자열이 정확히 같을 때만 true
if (id.equalsIgnoreCase("fs") && pw.equals("1234")) {
   // 로그인 완료 페이지로 redirect해서 보냄..
   // sendRedirect: 브라우저에게 다시 요청하라고 시키는 방식. 주소창이 responseWelcome.jsp 이렇게 바뀜. request 데이터가 사라짐
   // response: 서버가 사용자에게 보내는 정보
   // 서버가 브라우저에게 “responseWelcome.jsp로 이동하세요” 라고 응답을 보내는 것.
   response.sendRedirect("responseWelcome.jsp");
} else {
   // 요청 재전송이라는 개념. 중요함..
   // forward: 서버 내부에서 페이지를 넘기는 방식. 주소창 그대로 유지되지만 실제 실행은 respMain.jsp. request 데이터 유지됨
   // forward(request, response): 현재 사용 중인 request 객체와 response 객체를 다음 페이지에서도 그대로 사용하겠다
   // getRequestDispatcher: 서버 내부에서 다른 JSP를 실행하기 위한 도구. 그래서 이 다음 괄호에 이동할 페이지 작성
   request.getRequestDispatcher("respMain.jsp?loginErr=1").forward(request, response);
}
%>

</body>
</html>