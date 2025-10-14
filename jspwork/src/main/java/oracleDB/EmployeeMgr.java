package oracleDB;

import java.sql.*;
import java.util.ArrayList;

public class EmployeeMgr {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:free";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public EmployeeMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmployeeBean> getEmpList() {
		ArrayList<EmployeeBean> alist = new ArrayList<EmployeeBean>();
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from employee";
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				EmployeeBean bean = new EmployeeBean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setEmail(rs.getString("email"));
				bean.setDept_code(rs.getString("dept_code"));
				bean.setJob_code(rs.getString("job_code"));
				bean.setSalary(rs.getInt("salary"));
				alist.add(bean);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return alist;
	}
}




