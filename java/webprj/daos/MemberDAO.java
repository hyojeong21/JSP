package webprj.daos;

import webprj.common.JDBCPooler;
import webprj.dtos.MemberDTO;

// DAO는 DB 작업 담당 클래스, DTO는 데이터 담는 객체
// MemberDAO가 DBCPooler를 상속함 (그래서 바로 사용 가능)
public class MemberDAO extends JDBCPooler{
   
   // 파라미터로 받은 ID, Pass에 해당하는 row get해서 DTO에 set한 후 return 하도록 메서드 정의
   public MemberDTO getMemberDTO(String id, String pass) {
      String sql = "Select id, pass, name, regidate" 
            + " from member where id = ? and pass = ?";
      
      MemberDTO dto = null;   // 처음에는 회원 정보 없고 로그인 성공하면 생성됨
      try {
         pstmt = conn.prepareStatement(sql);   // conn → SQL 준비 → pstmt 생성
         // ? 값 세팅
         pstmt.setString(1, id);
         pstmt.setString(2, pass);
         
         // 쿼리 실행
         rs = pstmt.executeQuery();
         
         while(rs.next()) {   // id, pass가 맞다면 (로그인 성공이면 1행만 존재)
            // DTO 객체 생성 및 데이터 셋업
            dto = new MemberDTO();
            // DTO에 값 넣기
            dto.setId(id);
            dto.setPass(pass);
            dto.setName(rs.getString("name"));
            dto.setReg_date(rs.getDate("regidate"));
         }
         
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      return dto;
   }
   
}