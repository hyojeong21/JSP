package webprj.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.one")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		 System.out.println(commandStr);
		
		if(commandStr.equals("/register.one")) {
			registFunc(request);
		} else if (commandStr.equals("/login.one")) {
			loginFunc(request);
		} else if (commandStr.equals("/freeboard.one")) {
			freeboardFunc(request);
		}
		
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		request.getRequestDispatcher("/serv/FrontController.jsp").forward(request, response);
	}

	private void registFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	private void loginFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	
	private void freeboardFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>게시판</h4>");
	}

}