package webprj.mvc.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webprj.util.FileUtil;

public class FileDownController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파일 다운로드에 필요한 파라미터를 받아서, 다운로드 해주는 클래스의 메서드에 연결해준다
		String ofile = req.getParameter("ofile");
		String sfile = req.getParameter("sfile");
		String idx = req.getParameter("idx");
		
		// 파일 다운로드 클래스 호출
		FileUtil.download(req, resp, "/NAS", ofile, sfile);
	}
	
}