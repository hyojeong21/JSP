<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    

<c:set var="num" value="100"/>
<c:set var="str" value="hell"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- if: test라는 속성에 조건식을 걸고, 그 값을 var라는 속성 변수에 대입시키는 구문
else는 없으며, 오직 if만 존재함.. if 내부에 if를 중첩할 수는 있음 -->
<c:if test="${num % 2 == 0 }" var="res">	
<!-- num % 2 하면 0과 같냐고 물어보는 거임. test, 결과값 0은 res에 대입됨 -->
${num }은 짝수임.. 여긴 test가 true시에만 나옴
</c:if>
${res }

<c:if test="${str eq 'hell' }">
	${"나올라나" }
</c:if>

</body>
</html>