package ch12_ajax.ajaxReply;

import oracleDB.DBManager;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReplyDao {
    public List<Reply> getReplies(int id){
        DBManager db = new DBManager();
        List<Map<String, Object>> result = db.executeSelect("select * from reply where REF = ? order by no desc", id);
        return parseRepliesFrom(result);
    }
    
    public int insertReply(Reply reply){
        DBManager db = new DBManager();
        int result = db.executeUpdate("insert into reply values(SEQ_REPLY.NEXTVAL, ?, ?, ?, sysdate)", 
                reply.getContent(), reply.getRef(), reply.getName());
        return result;
    }
    
    //-------------------------------------------------------------------------------------------------------
    

    private List<Reply> parseRepliesFrom(List<Map<String, Object>> result) {
        List<Reply> replies = new ArrayList<Reply>();
        for(Map<String, Object> resultMap : result) {
            Reply reply = new Reply();
            for(String key : resultMap.keySet()) {
                switch(key.toLowerCase()) {
                    case "no" -> reply.setNo(((Number)resultMap.get(key)).intValue());
                    case "content" -> reply.setContent(resultMap.get(key).toString());
                    case "ref" -> reply.setRef(((Number)resultMap.get(key)).intValue());
                    case "name" -> reply.setName(resultMap.get(key).toString());
                    case "redate" -> reply.setRedate((Timestamp) resultMap.get(key));
                }
            }
            replies.add(reply);
        }
        return replies;
    }
}
