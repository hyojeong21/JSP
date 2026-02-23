<%@page import="java.sql.ResultSet"%>
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

<%
JDBCPooler pooler = new JDBCPooler();

PreparedStatement pstmt = pooler.conn.prepareStatement("Select * from member");

ResultSet rs = pstmt.executeQuery();

while(rs.next()) {
	String id = rs.getString("id");
	String pass = rs.getString("pass");
	String name = rs.getString("name");
%>
	<%=id %> : <%= name %> : <%=pass %>
<%
}

pooler.close();
%>

</body>
</html>