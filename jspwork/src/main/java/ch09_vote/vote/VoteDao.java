package ch09_vote.vote;

import oracleDB.DBConnectionMgr;
import oracleDB.DBManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class VoteDao {
    private DBConnectionMgr pool = DBConnectionMgr.getInstance();
    Connection con;
    PreparedStatement pstmt;
    Statement stmt;
    ResultSet rs;
    String sql;

    // 설문 등록하기
    public boolean voteInsert(VoteList vlist, VoteItem vitem) {
        boolean flag = false;

        try {
            con = pool.getConnection();
            sql = "insert into votelist values(seq_vote.nextval, ?, ?, ?, default, ?, default)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, vlist.getQuestion());
            pstmt.setString(2, vlist.getSdate());
            pstmt.setString(3, vlist.getEdate());
            pstmt.setInt(4, vlist.getType());
            //System.out.println("sdate: " + vlist.getSdate() + " edate: " + vlist.getEdate());
            int result = pstmt.executeUpdate();

            int result2 = 0;
            if(result == 1) {
                sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
                pstmt = con.prepareStatement(sql);
                String[] item = vitem.getItem();
                for(int i=0; i<item.length; i++) {
                    if(item[i] == null || item[i].equals(""))
                        break;

                    pstmt.setInt(1, i);
                    pstmt.setString(2, item[i]);
                    result2 = pstmt.executeUpdate();
                }
            }
            if(result2 == 1) {
                flag = true;
            } else {
                con.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con);
        }
        return flag;
    }

    public List<VoteList> getList(){
        List<VoteList> alist = new ArrayList<>();
        DBManager db = new DBManager();
        sql = "select * from VOTELIST order by num desc";
        List<Map<String, Object>> resultList = db.executeSelect(sql);
        for(Map<String, Object> resultMap : resultList) {
            VoteList voteList = parseVoteListFromMap(resultMap);
            alist.add(voteList);
        }
        return alist;
    }

    //설문폼의 질문과 type 가져오기
    public VoteList getVote(int num){
        DBManager db = new DBManager();
        if(num == 0) num = getMaxNum();
        List<Map<String, Object>> resultList = db.executeSelect("select * from VOTELIST where num = ?", num);
        Map<String, Object> resultMap = resultList.get(0);
        return parseVoteListFromMap(resultMap);
    }
    
    //목록 중 가장 num이 큰 번호 얻어오기
    public int getMaxNum(){
        DBManager db = new DBManager();
        List<Map<String, Object>> resultList = db.executeSelect("select max(num) as num from VOTELIST");
        Map<String, Object> resultMap = resultList.get(0);
        return ((Number)resultMap.get("NUM")).intValue();
    }
    
    //설문폼의 item 가져오기
    public ArrayList<String> getItem(int num){
        ArrayList<String> alist = new ArrayList<>();
        DBManager db = new DBManager();
        if(num == 0) num = getMaxNum();
        List<Map<String,Object>> resultList = db.executeSelect("select item from VOTEITEM where listnum = ?", num);
        for(Map<String,Object> resultMap : resultList) {
            alist.add(resultMap.get("ITEM").toString());
        }
        return alist;
    }
    
    //VoteList 파싱
    private VoteList parseVoteListFromMap(Map<String, Object> resultMap) {
        VoteList voteList = new VoteList();
        voteList.setNum(((Number) resultMap.get("NUM")).intValue());
        voteList.setQuestion((String) resultMap.get("QUESTION"));
        voteList.setSdate(resultMap.get("SDATE").toString());
        voteList.setEdate(resultMap.get("EDATE").toString());
        voteList.setType(((Number)resultMap.get("TYPE")).intValue());
        voteList.setActive(((Number)resultMap.get("ACTIVE")).intValue());
        return voteList;
    }
    
    //투표(count 증가)
    public boolean updateCount(int num, String[] itemnum){
        boolean flag = false;
        DBManager db = new DBManager();
        if(num == 0) num = getMaxNum();
        for(String item : itemnum) {
            //item이 없으면 break
            if(item == null || item.equals(""))
                break;
            int result = db.executeUpdate(
                    "update voteitem set count = count+1 where listnum = ? and item = ?", num, item);
            if(result > 0)
                flag = true;
        }
        return flag;
    }
    
    //listnum의 전체 카운트 가져오기
    public int sumCount(int listnum){
        int count = 0;
        DBManager db = new DBManager();
        if(listnum == 0) listnum = getMaxNum();
        List<Map<String, Object>> resultList = db.executeSelect("select sum(count) as SUM from voteitem where listnum = ?", listnum);
        for(Map<String, Object> resultMap : resultList) {
            count += ((Number)resultMap.get("SUM")).intValue();
        }
        return count;
    }
    
    //listnum의 각각의 item의 카운트 가져오기
    public ArrayList<VoteItem> getView(int listnum){
        ArrayList<VoteItem> itemList = new ArrayList<>();
        DBManager db = new DBManager();
        if(listnum == 0) listnum = getMaxNum();
        List<Map<String, Object>> resultList = db.executeSelect("select item, count from voteitem where listnum = ?", listnum);
        for(Map<String, Object> resultMap : resultList) {
            VoteItem voteItem = new VoteItem();
            voteItem.setItem(new String[]{resultMap.get("ITEM").toString()});
            voteItem.setCount(((Number)resultMap.get("COUNT")).intValue());
            itemList.add(voteItem);
        }
        return itemList;
    }
}
