<%@page import="webprj.util.BoardPage"%>
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
// DB 작업 담당 객체 생성. 이 객체가 게시글 개수와 리스트 조회 작업을 함
BoardDAO dao = new BoardDAO();

// 검색어 파라미터 Map 작업 로직
// 검색 조건을 담는 박스 생성
Map<String, Object> param = new HashMap<String, Object>();
// 요청값 받기
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
// 검색어 있을 때만 Map에 넣기
if (searchWord != null) {
   param.put("searchField", searchField);
   param.put("searchWord", searchWord);
}

// 검색된 개수와 목록을 리턴받는다
int totalCount = dao.selectCount(param);

// 페이징에 관련된 로직 처리한다.
// 먼저, 페이지블락과, 페이지당 목록 개수를 web.xml로부터 얻어낸다
// application.getInitParameter(): web.xml에 설정한 값 가져오는 기능
// 한 페이지에 몇 개 글을 보여줄지
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
// 페이지 번호 몇 개씩 묶을지
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
// 전체 페이지 수 계산
int totalPage = (int)Math.ceil(((double)totalCount / pageSize)); // 글 전체 개수 get한 후 페이지 수 연산

out.println(pageSize + " : " + blockPage + " : " + totalPage);

// 현재 페이지를 확인한다
int pageNum = 1;	// 만약 신규글 작성한 후엔 페이지 요청 번호가 없기 때문에 가장 최신글 페이지인 1번을 기본값으로 설정한다.
String pageTemp = request.getParameter("pageNum");
// pageNum 값이 있으면 그 값 사용. 없으면 1페이지
if(pageTemp != null && !pageTemp.equals("")) {
	pageNum = Integer.parseInt(pageTemp);
}

// 요청된 페이지 번호에 따른 글 범위 연산
int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;

// DAO에 넘겨줄 페이지 정보 세팅 (Map에 저장 (DAO로 전달))
param.put("start", start);
param.put("end", end);

// 게시글 리스트 조회
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
   <h2>글 목록 페이지 - 현재 페이지<%=pageNum %>(전체:<%=totalPage %>)</h2>
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
   if (boardLists.isEmpty()) {      // DB에 글이 하나도 없다면
   %>
   <tr>
      <td colspan = "5" align = "center">
         등록된 게시글이 없습니다
      </td>
   </tr>
   <%
   } else {   // DB에 글이 존재한다면, 글 번호와 함께 글 목록을 출력해야 함
            // 글들은 list에 담겨 있으니 순서대로 출력해주면 되지만,
            // 글 번호는 DB와 List에 뿌려지는 번호와는 차이가 있기 마련임.
            // 때문에 실제 DB에서 가져온 글 개수를 변수에 담고 이를 글 번호로 이용함
            // 이렇게 하면 편차가 발생하지 않음
      int virtualNum = 0;         // 가상 번호 생성
      
      // 페이지 처리시 글번호 synch 하기(?)
      int countNum = 0;
      
      for (BoardDTO dto : boardLists) {   // 게시글 하나씩 꺼내기
//         virtualNum = totalCount--;    // 글 번호 세팅
			virtualNum = totalCount - (((pageNum -1)*pageSize)+countNum++);
   %>
      <tr align = "center">
         <td><%=virtualNum %></td>   <!-- 글 번호 td 출력 -->
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
   
   <%-- 이건 jsp 주석임 --%>
   
   <table border="1" width="90%">
   		<tr align = "center">
   			<td>
   				<%=BoardPage.pagingStr(totalCount, 
		   		pageSize, blockPage, pageNum,
		   		request.getRequestURI()) %>	<!-- request.getRequestURI(): 현재 페이지 주소 -->
   			</td>
   			<td>
            	<button type = "button" onclick = "location.href = 'write.jsp'">
               	글쓰기
            	</button>
         	</td>
        <tr>
	</table>
</body>
</html>