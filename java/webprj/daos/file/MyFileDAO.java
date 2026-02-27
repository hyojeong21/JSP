package webprj.daos.file;

import java.util.ArrayList;
import java.util.List;

import webprj.common.JDBCPooler;
import webprj.dtos.file.MyFileDTO;

public class MyFileDAO extends JDBCPooler {
	
	// 파일 리스트에서 사용할 파일 목록 리턴하는 메서드 정의
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> lists = new ArrayList<MyFileDTO>();
		
		String sql = "Select * from myfile Order by idx desc";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				lists.add(dto);
			}
		} catch (Exception e) {
			
		}
		return lists;
	}

	public int insertFile(MyFileDTO dto) {
		int res = 0;
		String sql = "Insert into myfile ("
				+ "idx, title, cate, ofile, sfile) values ("
				+ "SEQ_BOARD_NUM.NEXTVAL,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getOfile());
			pstmt.setString(4, dto.getSfile());
			
			res = pstmt.executeUpdate();
			
			System.out.println(res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
}