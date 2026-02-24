<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인 페이지</h2>
<!-- link.jsp 파일을 여기 위치에 끼워 넣는다 -->
<jsp:include page="../Common/link.jsp"/> 
<%
// 이 페이지가 로딩될 때 userId라는 키로 session 정보가 있는지 확인함
// session: 사용자 로그인 정보를 저장하는 공간
// 세션에서 userId 꺼내라
if(session.getAttribute("userId") == null) {   // 세션 정보가 없다면
   // 로그인 form을 열어준다
%>
<form action="LoginProcess.jsp" method="post">
   ID: <input type="text" name="id"> <br>
   PW: <input type="password" name="pass"> <br>
   <!-- 나중에 request.getParameter("id")   request.getParameter("pass") 이렇게 받음 --> 
   <input type="submit" value="로그인">
</form>
<%
} else {   // 로그인한 세션 정보가 있다면
%>
   <%= session.getAttribute("userName") %>님, 로그인했음 <br>   <!-- 세션에서 이름 꺼내서 출력 --> 
   <a href="logout.jsp">[로그아웃]</a>
<%
}
%>

</body>
</html>