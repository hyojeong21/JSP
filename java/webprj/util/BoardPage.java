package webprj.util;

// 이 클래스는 list에서 페이징 처리를 위한 문자열을 생성해서 리턴하는 메서드를 정의한다.

public class BoardPage {

	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";
		
		// 전체 페이지 수 계산
		int totalPages = (int)(Math.ceil(((double)totalCount / pageSize)));
		
		// 현재 블록 시작 페이지 계산
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		if (pageTemp != 1) {	// 이전 블록 출력 (첫 블록이 아니면..)
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" +
			(pageTemp - 1) + "'>[이전 블록]</a>";
		}	
		int blockCount = 1;
		
		// 페이지 번호 출력. blockPage 개수만큼 페이지 출력
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {	// 현재 페이지 강조. 현재 페이지는 링크 없이 표시
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='" + reqUrl
						+ "?pageNum="+pageTemp+"'>" +pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		// 다음 블록 출력
		if(pageTemp <= totalPages) {	// 다음 블록이 있으면..
			pagingStr += "<a href='"+reqUrl
					+ "?pageNum="+pageTemp+"'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl+"?pageNum="
			+ totalPages + "'>[마지막 페이지]</a>";
		}

		return pagingStr;
	}
	
}