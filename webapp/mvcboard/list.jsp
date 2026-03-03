<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 첨부형 게시판</h2>
<!-- 검색폼 -->
<form action="">
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

<!-- 목록 테이블 -->
<table border = "1" width = "90%">
      <tr>
         <th width = "10%">번호</th>
         <th width = "*">제목</th>
         <th width = "15%">작성자</th>
         <th width = "10%">조회수</th>
         <th width = "15%">작성일</th>
         <th width = "8%">첨부</th>
      </tr>
      
<!-- 글이 하나도 없는 경우를 대비해서.. -->
<c:choose>
	<c:when test="${empty boardLists }">
		<tr>
			<td colspan="6">
				등록된 게시물이 없음
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<!-- 루프를 통해 데이터를 출력해준다 -->
		<c:forEach var="dto" items="${boardLists }" varStatus="loop"> 
			<tr align="center">
				<td>
					${map.totalCount - (((map.pageNum - 1)*map.pageSize) + loop.index) }
				</td>
				<td align="left">
					<a href="/mvcboard/view.do?idx=${dto.idx }">${dto.title }</a>
				</td>
				<td>
				 	${dto.name }
				</td>
				<td>
					${dto.visitcount }
				</td>
				<td>
					${dto.postdate }
				</td>
				<!-- 첨부파일 표시 -->
				<c:if test="${not empty dto.ofile }">
					<td>
						<a href="download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">[Down]</a>
					</td>
				</c:if>
				<c:if test="${empty dto.ofile }">
					<td>
						없음
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<!-- 페이지 index 처리 -->
<table border="1" width="90%">
	<tr align="center">
		<td>
			${map.pagingStr }
		</td>
	</tr>
</table>

</body>
</html>