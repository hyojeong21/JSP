<%@page import="java.sql.PreparedStatement"%>
<%@page import="webprj.common.JDBCPooler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- id를 fs로, name도 hello로, 비밀번호는 0000으로 업데이트 해보자. 조건절도 사용하자 -->
<%
JDBCPooler jdbc = new JDBCPooler();

String sql = "UPDATE member SET id = ?, pass = ?, name =? WHERE id = ?";

jdbc.pstmt = jdbc.conn.prepareStatement(sql);

jdbc.pstmt.setString(1, "fs");
jdbc.pstmt.setString(2, "fs");
jdbc.pstmt.setString(3, "서효정");
jdbc.pstmt.setString(4, "hyojeong");

jdbc.pstmt.executeUpdate();

jdbc.close();
%>

</body>
</html>