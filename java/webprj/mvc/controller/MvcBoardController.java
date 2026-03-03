package webprj.mvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webprj.board1.daos.mvc.MVCDAO;
import webprj.board1.dtos.mvc.MVCDTO;
import webprj.util.BoardPage;

public class MvcBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		MVCDAO dao = new MVCDAO();
		
		// 검색어 필드 파라미터 get/set
		Map<String, Object> map = new HashMap<String, Object>();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchField != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map);
		
		// 페이징 처리 시작
		// 페이지당 목록 개수 및 페이지 그룹 개수 get
		ServletContext ctx = getServletContext();
		int pageSize = Integer.parseInt(ctx.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(ctx.getInitParameter("PAGES_PER_BLOCK"));
		
		// 기본값 페이지 번호 초기화
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		
		if(pageTemp != null && !pageTemp.equals("")) {	// 요청된 페이지 정보가 존재한다면
			pageNum = Integer.parseInt(pageTemp);
		}
		
		// 목록에 출력될 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		// 페이지별 목록 개수 산출했으니 DB에서 글들 get
		List<MVCDTO> list = dao.selectList(map);
		
		// 페이징 처리 문자열 get
		String pageStr = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/mvcboard/list.do");
		
		// view에서 필요한 데이터는 모두 도출했으니, 뷰어에 데이터 전달함
		map.put("pagingStr", pageStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		System.out.println(list.size());
		
		req.setAttribute("boardLists", list);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("/mvcboard/list.jsp").forward(req, resp);
	}
	
}