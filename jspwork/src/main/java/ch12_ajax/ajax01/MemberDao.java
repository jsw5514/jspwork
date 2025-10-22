package ch12_ajax.ajax01;

import oracleDB.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MemberDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	// id 중복 체크
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 회원가입
	public boolean insertMember(Member bean) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetail_address());
			pstmt.setString(10, String.join(" ", bean.getHobby()));
			pstmt.setString(11, bean.getJob());
			
			if(pstmt.executeUpdate() == 1)   // insert가 잘 되었으면 1반환, 그렇지 않으면 0반환
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// login
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}	
		return flag;
	}

    public Member getMember(String id) {
        DBManager db = new DBManager();
        List<Map<String, Object>> result = db.executeSelect("select id, name, gender, email from member where id=?", id);
        return parseMemberFrom(result);
    }

    public List<Member> getAllMember() {
        ArrayList<Member> members = new ArrayList<Member>();
        DBManager db = new DBManager();
        List<Map<String, Object>> result = db.executeSelect("select id, name, gender, email from member");
        return parseMembersFrom(result);
    }
    
    //-----------------------------유틸함수-------------------------------------
    private Member parseMemberFrom(List<Map<String, Object>> memberList){
        if(memberList == null || memberList.size() == 0)
            return null;
        Map<String,Object> memberMap = memberList.get(0);
        Member member = new Member();
        for(String key : memberMap.keySet()){
            switch(key.toLowerCase()){
                case "id" -> member.setId(memberMap.get(key).toString());
                case "name" -> member.setName(memberMap.get(key).toString());
                case "gender" -> member.setGender(memberMap.get(key).toString());
                case "email" -> member.setEmail(memberMap.get(key).toString());
            }
        }
        return member.getId()!=null?member:null;
    }
    private List<Member> parseMembersFrom(List<Map<String, Object>> memberList){
        if(memberList == null || memberList.size() == 0)
            return null;
        
        ArrayList<Member> members = new ArrayList<>();
        for(Map<String, Object> memberMap : memberList){
            members.add(parseMemberFrom(List.of(memberMap)));
        }
        return members;
    }
}
