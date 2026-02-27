package webprj.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class B extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청에 따른 응답을 할 수 있도록 정의
		doSomething(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청에 따른 응답을 할 수 있도록 정의
		doSomething(request, response);
	}
	
	public void doSomething(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// 요청에 따른 응답을 할 수 있도록 정의
//		response.setContentType("text/html;charset=utf-8");
//				
//		// 출력객체를 얻어낸다
//		PrintWriter out = response.getWriter();
//		out.println("<html><head><title></title></head>");
//		out.println("<body><h2>");
//		out.println(request.getParameter("id"));
//		out.println("</h2></body></html>");
//				
//		out.close();
		
		
		String id = request.getParameter("id");
		String msg = "Hello " + id + "님";
		
		// 위 데이터를 request scope에 저장합니다
		request.setAttribute("id", id);
		request.setAttribute("msg", msg);
		
		request.getRequestDispatcher("/serv/greeting.jsp").forward(request, response);
		
	}
}