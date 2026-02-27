<%@page import="java.net.URLEncoder"%>
<%@page import="webprj.dtos.file.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@page import="webprj.daos.file.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>File List</h2>
<a href="fileUploadMain.jsp">파일등록1</a>
<a href="multifileUploadMain.jsp">파일등록2</a>

<%
MyFileDAO dao = new MyFileDAO();
List<MyFileDTO> fileList =dao.myFileList();
dao.close();

for(MyFileDTO dto : fileList) {
%>
<li><%=dto.getIdx() %> :
<%=dto.getTitle() %> :
<%=dto.getCate() %> :
<%=dto.getOfile() %> :
<%=dto.getSfile() %> :
<%=dto.getPostdate() %> :
<a href="download.jsp?oName=<%=URLEncoder.encode(dto.getOfile(),"UTF-8")%>&sName=<%=URLEncoder.encode(dto.getSfile(),"UTF-8") %>">
[다운로드]
</a>
</li>
<%
}
%>

</body>
</html>