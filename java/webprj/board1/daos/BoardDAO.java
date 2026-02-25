package webprj.board1.daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.RowSetInternal;

import webprj.board1.dtos.BoardDTO;
import webprj.common.JDBCPooler;

// DB 연결 기능 상속. conn / pstmt / rs 바로 사용 가능
public class BoardDAO extends JDBCPooler {
   
   // 조회수 증가 메서드 정의
   public void updateVisitCount(int num) {
      String sql = "Update Board "
            + "set visitcount = visitcount + 1 where num = ?";   // 게시글 상세보기 들어갈 때 실행됨
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   // 글 상세를 리턴하는 메서드 정의
   // 글 넘버를 기준으로 join해서 작성자 정보와 글 정보 모두를 가져와서 DTO에 담고 리턴한다
   // 또한 해당 글의 visitcount도 1 증가시킨다.
   public BoardDTO getArticle(int num) {
      // 데이터 담을 객체
      BoardDTO dto = new BoardDTO();
      
      String sql = "Select m.name, b.* from member m inner join board b "
            + "On m.id = b.id where num = ?";   // 공백 주의
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            // rs → dto 저장
            dto.setNum(rs.getInt("num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setPostdate(rs.getDate("postdate"));
            dto.setId(rs.getString("id"));
            dto.setVisitcount(rs.getString("visitcount"));
            dto.setName(rs.getString("name"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return dto;
   }

   // 검색에 맞는 목록 개수를 리턴하는 메서드 작성
   // JSP에서는 검색조건에 해당하는 값을 Map으로 변환해서 DAO에 전달할 예정이다
   // 이 메서드는 검색목록 개수를 리턴하므로 리턴 타입은 int이다.
   // 검색 조건 전달하기 위해 Map 사용
   
   public int selectCount(Map<String, Object> map) {      // 여러 값을 하나로 묶어서 전달하기 위해 Map 사용. Object는 아무 타입이나 넣을 수 있게 하는 것
      int totalCount = 0;    // 리턴될 목록 수 초기화
      
      // 쿼리 작성
      String sql = "SELECT COUNT(*) FROM Board";
      
      if(map.get("searchWord") != null) {      // 검색어가 포함되어 있다면
         sql += " Where " + map.get("searchField") + " LIKE  '%" + 
      map.get("searchWord") + "%'";
      }
      
      try {
         stmt = conn.createStatement();   // SQL 실행 준비
         rs = stmt.executeQuery(sql);      // SELECT 실행
         rs.next();
         
         totalCount = rs.getInt(1);      // 결과 저장
      } catch (SQLException e) {
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      
      return totalCount;
   }
   
   // 검색어를 입력 했을 때에 보여질 목록을 리턴하는 메서드 작성
   // 하나 이상의 글들이 리턴되어져야 한다. 따라서 DTO 타입의 그룹이 리턴되어야 하는데 이때 사용하는 자료구조는 List 이다.
   public List<BoardDTO> selectList(Map<String, Object> map) {
      List<BoardDTO> bbs = new ArrayList<BoardDTO>();   // 게시글 여러 개 저장
      
      // String sql = "Select * from Board";	// 페이지 없는 리스트 조회
      // 페이지 범위만큼 데이터 가져오기. board 전체 조회 -> 정렬 -> rownum 붙이기 -> 원하는 범위만 가져오기
      String sql = "Select * from ( Select Tb.*, rownum rnum From ( Select * from board ";
      // 검색 조건. 검색어가 있으면 WHERE 추가
      if(map.get("searchWord") != null) {      // 검색어가 포함되어 있다면
         sql += " Where " + map.get("searchField") + " LIKE  '%" + 
      map.get("searchWord") + "%'";
      }
      
      // 페이지 범위
      sql += "	Order By num DESC ) Tb ) where rnum Between ? And ?";
      // sql += " Order by Num Desc";	// 페이지 없는 리스트 조회
      
      try {
         // stmt = conn.createStatement();   // SQL 실행 도구 생성
         // createStatement()는 SQL이 간단하고 값 바인딩이 없다는 특징
         // prepareStatement()는 ? 사용 가능하고 보안과 속도가 좋다는 특징
         // rs = stmt.executeQuery(sql);      // SELECT 실행 + 결과 받기
    	  
    	  pstmt = conn.prepareStatement(sql);
    	  pstmt.setString(1, map.get("start").toString());	// Map에 저장된 "start" 값을 꺼내옴
    	  pstmt.setString(2, map.get("end").toString());
    	  
    	  // SQL 실행 후 결과 가져오기 (조회 결과를 rs(ResultSet)에 저장)
    	  rs = pstmt.executeQuery();
         
         while(rs.next()) {
            // Row가 존재한다면, 각 row를 순회하면서 컬럼 데이터를 DTO에 세팅한다
            BoardDTO dto = new BoardDTO();
            dto.setNum(rs.getInt("num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setPostdate(rs.getDate("postdate"));
            dto.setId(rs.getString("id"));
            dto.setVisitcount(rs.getString("visitcount"));
            
            // 세팅된 DTO를 List에 add한다
            bbs.add(dto);
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
         e.printStackTrace();
      }
      return bbs;
   }
   
   // 신규 글 insert 메서드 정의
   // 리턴값으로는 insert된 row 수를 리턴한다.
   public int insertWrite(BoardDTO dto) {
      int res = 0;
      
      try {
         String sql = "Insert into board(num, title, id, content) "
               + " values(SEQ_BOARD_NUM.nextval,?,?,?)";   // SEQ_BOARD_NUM.nextval: 자동 번호 생성
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getTitle());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getContent());
         
         res = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return res;
   }
   
   // 게시물 수정 메서드 정의
   public int updateArticle(BoardDTO dto) {
	   int res = 0;
	  
	   String sql = "Update Board Set title = ?, content = ? Where num = ?";
		
	   try {   
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getContent());
	         pstmt.setInt(3, dto.getNum());
	         
	         res = pstmt.executeUpdate();
	   } catch (Exception e) {
	         e.printStackTrace();
	   }
	   return res;
   }
   
   // 게시물 삭제 메서드 정의
   public int deleteArticle(int num) {
	   int res = 0;		// 삭제 결과 저장 변수. 삭제 성공 → 1. 삭제 실패 → 0
	   
	   // 게시글 번호가 num인 글 삭제
	   String sql = "Delete From Board Where num = ?";
	   
	   try {
		   // SQL 실행 준비
		   pstmt = conn.prepareStatement(sql);
		   // ? 자리에 게시글 번호 넣기
	       pstmt.setInt(1, num);

	       // INSERT / UPDATE / DELETE는 전부 executeUpdate() 사용
	       res = pstmt.executeUpdate();
	   } catch (Exception e) {
	         e.printStackTrace();
	   }
	   
	   return res;
   }
   
}