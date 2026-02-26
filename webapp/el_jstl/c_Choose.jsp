<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose</title>
</head>
<body>

<c:if test="${not (empty param.kor or empty param.math) }"> <%-- 파라미터가 존재한다면.. 조건 하나 일때는 if 사용--%>

	<c:set var="avg" value="${(param.kor + param.math)/2 }"/>
	<c:choose>
		<c:when test="${avg >= 90 }">A학점</c:when> 				<%-- if. 조건 여러 개면 when 사용 --%>
		<c:when test="${avg >= 80 && avg < 90 }">B학점</c:when> 	<%-- else if --%>
		<c:otherwise>F학점</c:otherwise> 							<%-- else --%>
	</c:choose>

</c:if>

</body>
</html>