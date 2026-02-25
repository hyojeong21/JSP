<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="IsLoggedIn.jsp" %>
<jsp:useBean id="dao" class="webprj.board1.daos.BoardDAO"/>
<jsp:useBean id="dto" class="webprj.board1.dtos.BoardDTO"/>

<%
// 전달되는 글번호를 기준으로 수정할 내용을 가져온다
int num = Integer.parseInt(request.getParameter("num"));
String sessionId = session.getAttribute("userId").toString();
dto =  dao.getArticle(num);
if(!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있음", out);
	return;
}
dao.close();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
</head>
<body>

<jsp:include page="../Common/link.jsp"/>
<h2>회원제 게시판 - 수정하기 폼</h2>
<form action = "editProcess.jsp" method = "post">
	<input type = "hidden" name = "num" value = "<%= dto.getNum() %>">
	<table>
		<tr>
			<td>제목</td>
			<td>
				<input type = "text" name = "title" value = "<%= dto.getTitle() %>">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name = "content" style = "width: 90%; height: 100px"><%= dto.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<button type = "submit">작성 완료</button>
				<button type = "reset">재작성</button>
				<button type = "button" onclick = "location.href = 'list.jsp'">목록 보기</button>
			</td>
		</tr>
	</table>	
</form>

</body>
</html>