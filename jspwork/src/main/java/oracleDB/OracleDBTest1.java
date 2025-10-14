package oracleDB;

import java.sql.*;

public class OracleDBTest1 {

	public static void main(String[] args) {
		try {
			// mysql
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:free", "tjoeun", "1234");
			System.out.println("Success");

		} catch (ClassNotFoundException e) {
			System.out.println("jdbc 드라이버 없음");
		} catch (SQLException e) {
			System.out.println("db버전 혹은 사용자명, 비밀번호가 안 맞음");
		}
	}
}