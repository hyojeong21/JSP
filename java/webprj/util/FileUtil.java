package webprj.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUtil {
	
	// 파일다운로드 메서드 정의
	// 파라미터로는 req, resp, 폴더명, 원래 파일명, 저장 파일명
	// 이렇게 받아서, 파일에 스트림을 생성해서 읽고, 이를 resp 객체를 통해 사용자의 브라우저에 write해준다
	public static void download(HttpServletRequest req, 
			HttpServletResponse resp, String directory,
			String ofile, String sfile) {
		String sDir = req.getServletContext().getRealPath(directory);
		
		System.out.println(sDir);
		
		// File 객체 생성
		try {
			File file = new File(sDir, sfile);
			InputStream is = new FileInputStream(file);
			
			// 브라우저별로 한글 깨지는 현상 적용 코드
			String client = req.getHeader("User-Agent");	// 브라우저 타입 get
			if(client.indexOf("WOW64") == -1) {
				ofile = new String(ofile.getBytes("UTF-8"),"ISO-8859-1");
			} else {
				ofile = new String(ofile.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			// 파일 다운로드용 응답 헤더 설정..
			resp.reset();	// 응답 리셋..
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition",
					"attachment; filename=\"" + ofile + "\"");
			resp.setHeader("Content-Length",""+file.length());
			
			// 서버와 브라우저간의 출력 스트림 생성
			OutputStream os = resp.getOutputStream();
			
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
	}
	
	
	// 멀티파일 업로드 메서드 작성
	// request 객체로부터 parts 객체를 get한 후에 Part 객체로 하니씩 루프를 돌면서 파일을 업로드한다
	// 업로드된 파일명을 담은 List를 리턴하도록 정의한다
	public static ArrayList<String> multiUploadFile(HttpServletRequest req,
			String sDirectory) throws ServletException, IOException {
		ArrayList<String> listFileName = new ArrayList<String>();
		// 멀티 업로드시엔 Parts 객체를 얻어낸다
		Collection<Part> parts = req.getParts();
		
		for(Part part : parts) {
			if(!part.getName().equals("ofile")) {
				continue;
			}
			
			String partHeader = part.getHeader("content-disposition");
			String[] phArr=partHeader.split("filename=");
			String orgFileName = phArr[1].trim().replace("\"", "");
			if(!orgFileName.isEmpty()) {
				// 파일을 지정된 폴더에 쓴다
				part.write(sDirectory + File.separator + orgFileName);
			}
			
			// 업로드된 파일명을 list에 add한다
			listFileName.add(orgFileName);
		}
		
		return listFileName;
	}

	
	
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
		
		// UUID.randomUUID()는 UUID 객체를 리턴함
		// 근데 파일명으로 쓰려면 String이 필요함 (파일 이름은 반드시 문자열이어야 하니까..)
		// 그래서 뒤에 toString() 붙이기
		String uuid = UUID.randomUUID().toString();
		String newFileName = uuid + ext;
		
		// String now = new SimpleDateFormat("yyyyMMdd_Hmss").format(new Date());
		// 파일명에 날짜 값을 더해서 새 파일명 생성
		// String newFileName = now + ext;
		// File 객체를 이용
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		
		oldFile.renameTo(newFile);	// 파일명 변경
		return newFileName;
	}
	
}