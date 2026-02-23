<%@page import="webprj.common.JDBCPooler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원추가 테스트 페이지</title>
</head>
<body>

<%
JDBCPooler pooler = new JDBCPooler();
String id = "hyojeong";
String pass = "1234";
String name = "테스트회원1";

String sql = "Insert into member values (?, ?, ?, sysdate)";	// 동적으로 바뀌는 건 ? 로 작성. 밑에서 set~ 로 추가함

pooler.pstmt = pooler.conn.prepareStatement(sql);

pooler.pstmt.setString(1, id);
pooler.pstmt.setString(2, pass);
pooler.pstmt.setString(3, name);

int res = pooler.pstmt.executeUpdate();
out.println(res + "행이 입력됨");

pooler.close();
%>

</body>
</html>