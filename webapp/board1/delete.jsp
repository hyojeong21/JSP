<%@page import="webprj.util.JSFunction"%>
<%@page import="webprj.board1.daos.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DAO 생성 -->
<jsp:useBean id="dao" class="webprj.board1.daos.BoardDAO"/>

<%
/* 게시글 번호 받기 */
int num = Integer.parseInt(request.getParameter("num"));

/* 삭제 실행 */
int res = dao.deleteArticle(num);

dao.close();

if (res == 1) {
    response.sendRedirect("list.jsp");	// 삭제 성공 → 목록 이동
} else {
	JSFunction.alertBack("삭제 실패", out);
}
%>