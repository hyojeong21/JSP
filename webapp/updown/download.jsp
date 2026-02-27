<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 이 페이지에서는 파라미터 값으로 inputstream을 열고 응답 헤더를 설정해서
클라이언트 브라우저에 파일을 outputStream을 통해 다운시킨다.
응답 헤더 설정하는 부분은 고정적으로 사용되기 때문에 눈여겨 보자.. -->

<%
String saveDirectory = application.getRealPath("NAS");
String saveFileName = request.getParameter("sName");
String originFileName = request.getParameter("oName");

// File 객체 생성
try {
	File file = new File(saveDirectory, saveFileName);
	InputStream is = new FileInputStream(file);
	
	// 브라우저별로 한글 깨지는 현상 적용 코드
	String client = request.getHeader("User-Agent");	// 브라우저 타입 get
	if(client.indexOf("WOW64") == -1) {
		originFileName = new String(originFileName.getBytes("UTF-8"),"ISO-8859-1");
	} else {
		originFileName = new String(originFileName.getBytes("KSC5601"),"ISO-8859-1");
	}
	
	// 파일 다운로드용 응답 헤더 설정..
	response.reset();	// 응답 리셋..
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition",
			"attachment; filename=\"" + originFileName + "\"");
	response.setHeader("Content-Length",""+file.length());
	
	out.clear();	// 이거 안 해주면 예외 발생함
	
	// 서버와 브라우저간의 출력 스트림 생성
	OutputStream os = response.getOutputStream();
	
	// 이제부터는 in-out으로 파일 다운로드 시킴
	byte[] b = new byte[(int)file.length()];
	int readBuffer = 0;
	
	while((readBuffer = is.read(b))>0){
		os.write(b, 0, readBuffer);		// 배열을 데이터를 0번부터 새롭게 읽은 개수만큼만 출력
	}
	
	is.close();
	os.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>