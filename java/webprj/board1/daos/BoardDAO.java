package webprj.board1.daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.RowSetInternal;

import webprj.board1.dtos.BoardDTO;
import webprj.common.JDBCPooler;

public class BoardDAO extends JDBCPooler {
	
	// 조회수 증가 메서드 정의
	public void updateVisitCount(int num) {
		String sql = "Update Board "
				+ "set visitcount = visitcount + 1 where num = ?";
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
		BoardDTO dto = new BoardDTO();
		
		String sql = "Select m.name, b.* from member m inner join board b "
				+ "On m.id = b.id where num = ?";	// 공백 주의
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
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
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; 	// 리턴될 목록 수 초기화
		
		// 쿼리 작성
		String sql = "SELECT COUNT(*) FROM Board";
		
		if(map.get("searchWord") != null) {		// 검색어가 포함되어 있다면
			sql += " Where " + map.get("searchField") + " LIKE  '%" + 
		map.get("searchWord") + "%'";
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	// 검색어를 입력 했을 때에 보여질 목록을 리턴하는 메서드 작성
	// 하나 이상의 글들이 리턴되어져야 한다. 따라서 DTO 타입의 그룹이 리턴되어야 하는데 이때 사용하는 자료구조는 List 이다.
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String sql = "Select * from Board";
		
		if(map.get("searchWord") != null) {		// 검색어가 포함되어 있다면
			sql += " Where " + map.get("searchField") + " LIKE  '%" + 
		map.get("searchWord") + "%'";
		}
		
		sql += " Order by Num Desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
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
					+ " values(SEQ_BOARD_NUM.nextval,?,?,?)";
			
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
	
}