package webprj.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCPooler {

   public Connection conn;
   public Statement stmt;
   public PreparedStatement pstmt;
   public ResultSet rs;

   public JDBCPooler() {
      try {
         // 커넥션풀 DataSource 얻기..
         Context initCtx = new InitialContext();
         // java:comp/env 찾기
         Context ctx = (Context) initCtx.lookup("java:comp/env");
         // DataSource 찾기
         DataSource source = (DataSource) ctx.lookup("dbpc_myoracle");
         
         // 실제 DB 연결 가져오기
         conn = source.getConnection();

         System.out.println("DB 컨넥션 풀 연결 성공" + conn);
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }

   public void close() {
      try {
         if (rs != null)
            rs.close();
         if (pstmt != null)
            pstmt.close();
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
   }
}