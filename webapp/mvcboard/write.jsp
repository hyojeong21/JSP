<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
</head>
<body>

<h2>MVC3 게시판 - 글쓰기 페이지</h2>

<form action = "write.do" method = "post" enctype="multipart/form-data">
	<table border = "1" width = "90%">
		<tr>
			<td>작성자</td>
			<td>
				<input type = "text" name = "name" style = "width: 90%">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type = "text" name = "title" style = "width: 90%">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea style = "width: 90%; height: 500px;" name = "content"></textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<input type="file" name="ofile" multiple="multiple">
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" style="width: 100px">
			</td>
		</tr>
		<tr>
			<td colspan = "2" align = "center">
				<button type = "submit">작성 완료</button>
				<button type = "button">다시 입력</button>
				<button type = "button" onclick = "location.href = 'list.do'">목록 보기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>