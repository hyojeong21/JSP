<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 페이지</title>
</head>
<body>

<h3>파일 업로드</h3>
<span style="color: red;">${errorMessage }</span>
<form method="post" enctype="multipart/form-data" action="UploadProcess.do">
	제목: <input type="text" name="title"><br>
	카테고리:
	<input type="checkbox" name="cate" value="사진" checked="checked">사진
	<input type="checkbox" name="cate" value="과제">과제
	<input type="checkbox" name="cate" value="워드">워드
	<input type="checkbox" name="cate" value="음원">음원
	<br>
	첨부파일: <input type="file" name="ofile"><br>
	<input type="submit" value="업로드">
</form>

</body>
</html>