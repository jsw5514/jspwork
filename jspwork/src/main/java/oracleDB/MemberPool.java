package oracleDB;

import java.sql.*;

public class MemberPool {
	private DBConnectionMgr pool;
	
	public MemberPool() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			System.out.println("Error : 커넥션 연결 실패");
		}
	}
	
	public boolean loginMem(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from MEMBER where MEM_ID=? and MEM_PWD=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next() && rs.getInt(1) > 0) {
				loginCon = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        finally {
            pool.freeConnection(con);
        }
		return loginCon;
	}
	
}
