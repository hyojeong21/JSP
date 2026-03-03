package webprj.servlets.upload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webprj.daos.file.MyFileDAO;
import webprj.dtos.file.MyFileDTO;
import webprj.util.FileUtil;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class MultiProcess
 */
@WebServlet("/updown/multiProcess.do")
@MultipartConfig(
		// 업로드 가능한 개별 파일의 크기 설정
		maxFileSize = 1024 * 1024 * 10,	// 10M
		maxRequestSize = 1024 * 1024 * 100	// 한 번에 전송 가능한 파일의 전체 크기 100M
)


public class MultiProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {

		String sDirectory = getServletContext().getRealPath("NAS");
		File folder = new File(sDirectory);
		if(!folder.exists())folder.mkdir();
		
		ArrayList<String> listFileName = 
				FileUtil.multiUploadFile(request, sDirectory);
		
		for(String originName : listFileName) {
			// 이름 변경
			String savedFileName = FileUtil.renameFile(sDirectory, originName);
			insertMyFile(request, originName, savedFileName);
		}
		response.sendRedirect("fileList.jsp");
	}

	
	private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
		// 파일 제목 get
		String title = req.getParameter("title");
		String[] cateArray = req.getParameterValues("cate");
		// 카테고리 항목 get.. 없는 경우도 처리할 것
		StringBuilder sb = new StringBuilder();
		if (cateArray == null) {
			sb.append("선택한 항목 없음");
		} else {
			for (String s : cateArray) {
				sb.append(s + " ");
			}
		}
		// DTO 세팅
		MyFileDTO dto = new MyFileDTO();
		dto.setTitle(title);
		dto.setCate(sb.toString());
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
	}
	
}
