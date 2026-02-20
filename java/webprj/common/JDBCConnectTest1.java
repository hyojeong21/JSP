package webprj.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCConnectTest1 {

	/*
	 * JAVA JDBC 순서는 아래와 같음
	 * 1. Class.forName()을 이용해서 JDBC Driver를 로드한다.
	 * 2. 로드된 Driver에 계정 정보를 넣어서 Connection 객체를 얻어낸다.
	 * 이때 사용하는 객체가 DriverManager라는 인터페이스이다.
	 * 3. 얻어낸 Connection을 이용해서 쿼리를 주고 받는다.(SQL package API 이용)
	 * 
	 */
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	// 생성자에 Connection 객체를 get하도록 정의
	public JDBCConnectTest1() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");	// 이 Driver 이름은 고정임
			// 드라이버가 로드되면, Connection 연결 작업 시작..
			// 이때 어떤 계정을 연결할지 정보를 줘야 함
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "fs";
			String password = "fs";
			conn = DriverManager.getConnection(url, id, password);
			System.out.println("DB 연결 성공함..");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 반드시 DB를 사용한 후엔 모든 리소스를 close 해야 함
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}