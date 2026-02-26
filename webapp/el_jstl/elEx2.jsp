<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>요청 파라미터 확인해보기</h2>
너의 취미: ${param.hobby }<br>
너의 관심사항: ${paramValues.inter[0] }	<%-- name으로 여러 값이 넘어올 때는 ["eco", "pol", "ent", "soc"] 이런식으로 자동으로 배열이 됨. 그래서 paramValues 이렇게 써서 배열 전체 가져옴 --%>
${paramValues.inter[1] }
${paramValues.inter[2] }
${paramValues.inter[3] }<br>

${pageScope.t1 }<br>		<%-- page는 유지 범위가 JSP 페이지 한 장이므로 안 뜸 (elEx1 페이지 안에서만 존재. page가 바뀜 → 사라짐) --%>
${requestScope.t2 }<br>		<%-- request는 유지 범위가 현재 요청 1번이므로 안 뜸 (첫 번째 요청에서만 존재. request가 새로 생성됨 → 사라짐) --%>
${sessionScope.t3 }<br> 	<%-- session은 유지 범위가 브라우저 종료 전까지이므로 뜸 --%>
${applicationScope.t4 }<br>	<%-- application은 유지 범위가 서버 종료 전까지이므로 뜸 --%>

</body>
</html>