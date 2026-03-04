package webprj.mvc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webprj.board1.daos.mvc.MVCDAO;
import webprj.board1.dtos.mvc.MVCDTO;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * 이 메서드는 idx 파라미터를 기준으로 DAO에서 글 상세에 대한 DTO를 넘겨받고,
	 * 이를 view.jsp(viewer)가 표현할 수 있도록 가공해서 데이터를 심고 viewer를 호출하는 로직을 작성한다
	 */
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MVCDAO dao = new MVCDAO();
		String idx = request.getParameter("idx");
		MVCDTO dto = dao.selectView(idx);
		dao.close();
		
		// 줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		// 첨부파일 가공
		String ext = null, fileName = dto.getSfile();
		if(fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mimeStr = {"png","jpg","gif"};
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage = false;
		if (mimeList.contains(ext)) {
			isImage = true;
		}
		
		// 데이터 set
		request.setAttribute("dto", dto);
		request.setAttribute("isImage", isImage);
		request.getRequestDispatcher("/mvcboard/view.jsp").forward(request, response);
		}

}