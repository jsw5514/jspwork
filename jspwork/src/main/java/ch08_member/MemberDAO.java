package ch08_member;

import oracleDB.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

public class MemberDAO {
    private DBConnectionMgr manager = DBConnectionMgr.getInstance();
    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    public boolean checkId(String id){
        boolean flag = false;
        try {
            con = manager.getConnection();
            final String sql = "select id from member where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            flag = rs.next();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return flag;
    }
    
    public boolean insertMember(Member member){
        boolean flag = false;
        try {
            con = manager.getConnection();
            final String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPwd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());
            pstmt.setString(5, member.getBirthday());
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getZipcode());
            pstmt.setString(8, member.getAddress());
            pstmt.setString(9, member.getDetailAddress());
            pstmt.setString(10, String.join(" ", member.getHobby()));
            pstmt.setString(11, member.getJob());
            
            flag = pstmt.executeUpdate() == 1;
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return flag;
    }
}
