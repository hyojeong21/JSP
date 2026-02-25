<%@page import="webprj.util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:include>: 다른 JSP 파일을 현재 JSP 안에 실행 결과 형태로 포함시키는 액션 태그. 공통 화면을 재사용할 때 사용 --%>
<jsp:include page="IsLoggedIn.jsp"/>
<jsp:useBean id="dao" class="webprj.board1.daos.BoardDAO"/>
<jsp:useBean id="dto" class="webprj.board1.dtos.BoardDTO"/>

<jsp:setProperty property="*" name="dto"/>

<%
int res = dao.updateArticle(dto);
dao.close();

if (res == 1) {
	response.sendRedirect("content.jsp?num="+dto.getNum());
} else {
	JSFunction.alertBack("수정 실패", out);
}
%>