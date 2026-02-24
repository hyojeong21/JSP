<%@page import="webprj.daos.MemberDAO"%>
<%@page import="webprj.dtos.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- MemberDTO 객체 생성 (MemberDTO dto = new MemberDTO(); 이것과 동일) -->
<!-- useBean: 객체 생성 -->
<jsp:useBean id="dto" class="webprj.dtos.MemberDTO"/>
<!-- request에 들어온 값을 dto에 자동으로 넣어라 -->
<!-- setProperty: 폼 값 자동 세팅 -->
<jsp:setProperty property="*" name="dto"/>

<%
// 이 페이지에서는 요청 파라미터를 DAO의 메서드에 전달하고,
// 올바른 사용자면 session영역에 정보를 setup하고 이전 페이지로 redirect하고,
// 올바르지 않은 사용자인 경우엔 바로 redirect한다
// String id = request.getParameter("user_id");
// String pass = request.getParameter("user_pw");

// DAO 객체 생성 및 메서드 호출 (DAO 호출: DB 조회)
// id + pass로 DB 조회
dto = new MemberDAO().getMemberDTO(dto.getId(), dto.getPass());
if(dto == null) {   // 로그인 실패
   response.sendRedirect("loginForm.jsp");
} else {   // 로그인 성공
   // 세션 영역에 사용자 정보 셋업
   session.setAttribute("userId", dto.getId());
   session.setAttribute("userPass", dto.getPass());
   session.setAttribute("userName", dto.getName());
   session.setAttribute("reg_date", dto.getReg_date());
   
   response.sendRedirect("loginForm.jsp");
}
%>