<%@page import="webprj.board1.dtos.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="webprj.board1.daos.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 이 페이지에서는, 검색어의 파라미터를 받아서, 글 목록을 리턴하는 메서드에 연결을 해줘야 한다
// 이를 위해서는 자신이 자신을 요청하도록 해야 하며, (list -> list로 submit)
// 파라미터를 받아서 Map으로 만들어 보내는 로직도 작성해야 한다.
BoardDAO dao = new BoardDAO();

// 검색어 파라미터 Map 작업 로직
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

// 검색된 개수와 목록을 리턴받는다
int totalCount = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 로그인/아웃, 게시판 리스트로 보내는 조각 페이지 include -->
	<jsp:include page="../Common/link.jsp"/>
	<h2>글 목록 페이지</h2>
	<!-- 검색폼 table -->
	<form method = "get">
		<table border = "1" width = "90%">
			<tr>
				<td align = "center">
					<select name = "searchField">
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type = "text" name = "searchWord" size = "20">
					<input type = "submit" value = "검색하기">
				</td>
			</tr>
		</table>
	</form>
	<!-- 검색폼 끝 -->
	
	<!-- 게시글 목록 테이블 시작 -->
	<table border = "1" width = "90%">
		<tr>
			<th width = "10%">번호</th>
			<th width = "50%">제목</th>
			<th width = "15%">작성자</th>
			<th width = "10%">조회수</th>
			<th width = "15%">작성일</th>
		</tr>
	
	<!-- 리스트 출력 시작.. 게시물이 있을 때와 없을 때를 모두 확인해야 함 -->
	<%
	if (boardLists.isEmpty()) {		// DB에 글이 하나도 없다면
	%>
	<tr>
		<td colspan = "5" align = "center">
			등록된 게시글이 없습니다
		</td>
	</tr>
	<%
	} else {	// DB에 글이 존재한다면, 글 번호와 함께 글 목록을 출력해야 함
				// 글들은 list에 담겨 있으니 순서대로 출력해주면 되지만,
				// 글 번호는 DB와 List에 뿌려지는 번호와는 차이가 있기 마련임.
				// 때문에 실제 DB에서 가져온 글 개수를 변수에 담고 이를 글 번호로 이용함
				// 이렇게 하면 편차가 발생하지 않음
		int virtualNum = 0;
		for (BoardDTO dto : boardLists) {
			virtualNum = totalCount--; 	// 글 번호 세팅
	%>
		<tr align = "center">
			<td><%=virtualNum %></td>	<!-- 글 번호 td 출력 -->
			<td>
				<a href = "content.jsp?num=<%=dto.getNum() %>">
					<%=dto.getTitle() %>
				</a>
			</td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getVisitcount() %></td>
			<td><%=dto.getPostdate() %></td>
		</tr>
	<%
		}
	}
	%>
	</table>
	
	<!-- 글쓰기 테이블 작성 -->
	<table border = "1" width = "90%">
		<tr align = "right">
			<td>
				<button type = "button" onclick = "location.href = 'write.jsp'">
					글쓰기
				</button>
			</td>
		</tr>
	</table>
	
</body>
</html>