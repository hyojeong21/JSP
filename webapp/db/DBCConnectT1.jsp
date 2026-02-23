<%@page import="webprj.common.JDBCPooler"%>
<%@page import="webprj.common.JDBCConnectTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JDBC 연결 테스트</h2>
<%
// JDBCConnectTest1 jdbc = new JDBCConnectTest1();		// 생성자에 연결 설정했으니, 성공 or 오류임
// out.println("DB에 잘 연결됨 " + jdbc);

JDBCPooler pooler = new JDBCPooler();
pooler.close();
%>
</body>
</html>