package webprj.board1.daos.mvc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import webprj.board1.dtos.BoardDTO;
import webprj.board1.dtos.mvc.MVCDTO;
import webprj.common.JDBCPooler;

public class MVCDAO extends JDBCPooler {
	
	  // 신규 글 insert 메서드 정의
	  // 리턴값으로는 insert된 row 수를 리턴한다.
	  public int insertWrite(MVCDTO dto) {
		  int res = 0;
	      
	      try {
	         String sql = "Insert into mvcboard(idx, name, title, content, ofile, sfile, pass) "
	               + " values(MVC_SEQ.nextval,?,?,?,?,?,?)";   // SEQ_BOARD_NUM.nextval: 자동 번호 생성
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getName());
	         pstmt.setString(2, dto.getTitle());
	         pstmt.setString(3, dto.getContent());
	         pstmt.setString(4, dto.getOfile());
	         pstmt.setString(5, dto.getSfile());
	         pstmt.setString(6, dto.getPass());
	         
	         res = pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return res;
	}

	public int selectCount(Map<String, Object> map) {      // 여러 값을 하나로 묶어서 전달하기 위해 Map 사용. Object는 아무 타입이나 넣을 수 있게 하는 것
	      int totalCount = 0;    // 리턴될 목록 수 초기화
	      
	      // 쿼리 작성
	      String sql = "SELECT COUNT(*) FROM MVCBoard";
	      
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
	
	public List<MVCDTO> selectList(Map<String, Object> map) {
	      List<MVCDTO> bbs = new ArrayList<MVCDTO>();   // 게시글 여러 개 저장
	      
	      // 페이지 범위만큼 데이터 가져오기. board 전체 조회 -> 정렬 -> rownum 붙이기 -> 원하는 범위만 가져오기
	      String sql = "Select * from ( Select Tb.*, rownum rnum From ( Select * from mvcboard ";
	      // 검색 조건. 검색어가 있으면 WHERE 추가
	      if(map.get("searchWord") != null) {      // 검색어가 포함되어 있다면
	         sql += " Where " + map.get("searchField") + " LIKE  '%" + 
	      map.get("searchWord") + "%'";
	      }
	      
	      // 페이지 범위
	      sql += "	Order By idx DESC ) Tb ) where rnum Between ? And ?";
	      
	      try {
	    	  
	    	  pstmt = conn.prepareStatement(sql);
	    	  pstmt.setString(1, map.get("start").toString());	// Map에 저장된 "start" 값을 꺼내옴
	    	  pstmt.setString(2, map.get("end").toString());
	    	  
	    	  // SQL 실행 후 결과 가져오기 (조회 결과를 rs(ResultSet)에 저장)
	    	  rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            // Row가 존재한다면, 각 row를 순회하면서 컬럼 데이터를 DTO에 세팅한다
	        	MVCDTO dto = new MVCDTO();
	        	
	            dto.setIdx(rs.getString("idx"));
	            dto.setName(rs.getString("name"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setPostdate(rs.getDate("postdate"));
	            dto.setOfile(rs.getString("ofile"));
	            dto.setSfile(rs.getString("sfile"));
	            dto.setDowncount(rs.getInt("downcount"));
	            dto.setPass(rs.getString("pass"));
	            dto.setVisitcount(rs.getInt("visitcount"));
	            
	            // 세팅된 DTO를 List에 add한다
	            bbs.add(dto);
	         }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         e.printStackTrace();
	      }
	      return bbs;
	   }
	
}