package webprj.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {

	// 아래의 메서드는 요청에서 전달되는 파일의 정보를 얻어낸다
	// 얻어낸 정보를 기준으로 저장될 파일 명을 새로 생성한다
	// 그리고 업로드된 파일을 지정된 서버의 폴더에 저장한다
	public static String uploadFile(HttpServletRequest request,
			String sDirectory) throws ServletException, IOException{
		// 인터넷으로 업로드된 파일의 정보를 관리하는 객체인 Part 객체를 request를 통해서 얻어낸다
		Part part = request.getPart("ofile");
		// 웹 브라우저에서 파일을 전송할때 아래의 키값으로 파일의 정보가 전송됨
		// 이 키값을 get함
		String partHeader = part.getHeader("content-disposition");
		// 위 파일 정보는 다음처럼 저장되어서 전송된다
		// name=oFile; filename="filename"
		String[] phArr=partHeader.split("filename=");
		String orgFileName = phArr[1].trim().replace("\"", ""); // " 제거
		
		if(!orgFileName.isEmpty()) {
			// 파일을 지정된 폴더에 쓴다
			part.write(sDirectory + File.separator + orgFileName);
		}
		
		return orgFileName;
		
	}
	
	// 파일명 변경 메서드 정의
	public static String renameFile(String sDirectory, String fileName) {
		// 확장자 분리
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_Hmss").format(new Date());
		// 파일명에 날짜 값을 더해서 새 파일명 생성
		String newFileName = now + ext;
		// File 객체를 이용
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		
		oldFile.renameTo(newFile);	// 파일명 변경
		return newFileName;
	}
	
}