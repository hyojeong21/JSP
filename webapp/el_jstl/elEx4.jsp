<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>영역 데이터 찾아서 출력</h2>
dto 객체: ${dto.id }<br>
request Scope 데이터: ${requestScope.reqScoP1 } :${requestScope.reqScoP2 }

파라미터 값: ${param.msg1} + ${param['msg2']}<br>

</body>
</html>