<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

// application: 서버 전체에서 공유되는 객체
// application.getInitParameter(): web.xml 값 읽기
// web.xml에서 INIT_PARAM 값을 가져와라
xml에 저장된 정보 보기: <%= application.getInitParameter("INIT_PARAM") %> <br>

// 서버 기준 실제 폴더 경로 가져오기 (/webprj 폴더의 실제 경로 반환)
<%= application.getRealPath("/webprj") %>

</body>
</html>