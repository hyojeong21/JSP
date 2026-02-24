<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "IsLoggedIn.jsp" %>
    
<jsp:useBean id="dto" class="webprj.board1.dtos.BoardDTO"/>
<jsp:useBean id="dao" class="webprj.board1.daos.BoardDAO"/>    
<jsp:setProperty property="*" name="dto"/>

<%
	// 이 페이지는 파라미터로 오는 데이터와 세션에 담겨진 ID 값을 찾아서 DTO 세팅 후
	// DAO의 insert 모듈(메서드)와 연결해서 insert한 후 결과값을 가지고
	// 올바른 값(1)이 리턴되면 list.jsp로 redirect 해주고 아닌 경우엔, alert를
	// 띄운 후 writeForm.jsp로 되돌리도록 한다.
	
	dto.setId(session.getAttribute("userId").toString());

	if(dao.insertWrite(dto) == 1) {		// 데이터가 입력 완료됐다면..
		JSFunction.alertLocation("글 작성 완료", "list.jsp", out);
	} else {
		JSFunction.alertBack("글 작성에 문제 발생함", out);
	}

	// out.println(dto);
%>