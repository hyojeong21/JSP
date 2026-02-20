<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 핸들링 페이지</title>
</head>
<body>
   <h2>서비스 중 일시적 오류가 발생했습니다</h2>
   <!-- 아래는 출력문 Expression 코드임 -->
   <!-- 어떤 종류의 에러인지 출력 -->
   <%= exception.getClass().getName() %> <br>
   <!-- 에러가 왜 발생했는지 설명 -->
   <%= exception.getMessage() %> <br>
</body>
</html>