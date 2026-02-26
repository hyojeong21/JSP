<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
pageContext.setAttribute("t1", "v1");
request.setAttribute("t2", "v2");
session.setAttribute("t3", "v3");
application.setAttribute("t4", "v4");
%>

<head>
<meta charset="UTF-8">
<title>EL 사용하기</title>
</head>
<body>

<%-- String key = request.getParameter("key"); 와 같은거임 
<% %> 여기랑 <%= %> 여기 사이에 넣으면 안 됨--%>
${param.key }<br>  
${param.key2 }<br>

${pageScope.t1 }<br>
${requestScope.t2 }<br>
${sessionScope.t3 }<br>
${applicationScope.t4 }<br>
${t4 }<br>


<form action="elEx2.jsp">
	취미:
	<select name="hobby">
		<option value="spo">운동</option>
		<option value="movie">영화</option>
		<option value="tra">여행</option>
	</select>
	
	관심사항:
	<input type="checkbox" name="inter" value="eco">경제
	<input type="checkbox" name="inter" value="pol">정치
	<input type="checkbox" name="inter" value="ent">연예
	<input type="checkbox" name="inter" value="soc">사회
	<br>
	<input type="submit" value="전송">
</form>

</body>
</html>