package ch10_board;

import oracleDB.DBManager;

import java.sql.Timestamp;
import java.util.*;

public class BoardDAO {
    //게시글 검색 결과 or 검색 없는 그냥 목록
    public List<BoardItem> getBoardItems(String keyField, String keyWord, int start, int end) {
        DBManager db = new DBManager();
        final String sql;

        List<Map<String, Object>> resultList;
        if(keyField.isEmpty()){ //검색없이 전체 리스트 표시
            sql = "select * " +
                    "from (select ROWNUM as RNUM, BT1.* " +
                           "from (select * " +
                                 "from board " +
                                 "order by ref desc, pos) " +
                            "BT1) " +
                    "where RNUM between ? and ?";
            resultList = db.executeSelect(sql, start, end);
        }
        else{ //검색 결과 리스트 표시
            if(isInvalidKeyField(keyField))
                throw new IllegalArgumentException(keyField + " is not valid");
            sql = "select * " + 
                    "from (select ROWNUM as RNUM, BT1.* " +
                           "from (select * " +
                                  "from board " +
                                  "order by ref desc, pos) " +
                            "BT1 " +
                            "where " + keyField + " like ?) " +
                    "where RNUM between ? and ?";
            resultList = db.executeSelect(sql, keyWord, start, end);
        }
        return parseBoardItemsFrom(resultList);
    }

    private boolean isInvalidKeyField(String keyField) {
        final Set<String> VALID_KEYFIELDS = Collections.unmodifiableSet(Set.of("name","subject","content"));
        //injection 방지(유효한 keyField만 쿼리에 삽입)
        if(!VALID_KEYFIELDS.contains(keyField)) {
            return true;
        }
        return false;
    }

    //게시글 1개의 조회수 증가
    public boolean upCount(int num){
        DBManager db = new DBManager();
        int result = db.executeUpdate("update board set count = count + 1 where num = ?", num);
        return result==1;
    }
    
    //게시글 1개의 상세 정보
    public BoardItem getBoardItem(int num) {
        DBManager db = new DBManager();
        List<Map<String, Object>> resultList = db.executeSelect("select * from board where num = ?", num);
        return parseBoardItemFrom(resultList);
    }

    public void updateBoard(BoardItem upBean) {
        DBManager db = new DBManager();
        int result = db.executeUpdate(
                "update board set name=?, subject=?, content=? where num = ?", 
                upBean.getName(), defaultIfNullOrEmpty(upBean.getSubject(),"제목없음"), upBean.getContent(), upBean.getNum());
        
    }

    public boolean insertBoard(BoardItem postBean) {
        DBManager db = new DBManager();
        int result = db.executeUpdate(
                "insert into board(num,name,subject,content,pass,ip) values(SEQ_BOARD.nextval, ?,?,?,?,?)",
                postBean.getName(), postBean.getSubject(), postBean.getContent(), postBean.getPass(), postBean.getIp());
        return result==1;
    }

    //-------------------------------유틸함수------------------------------------------------
    //게시글 리스트 파싱
    public List<BoardItem> parseBoardItemsFrom(List<Map<String, Object>> resultList) {
        ArrayList<BoardItem> boardItems = new ArrayList<>();
        for (Map<String, Object> map : resultList) {
            BoardItem boardItem = new BoardItem();
            boardItem.setNum(((Number)map.get("NUM")).intValue());
            boardItem.setName(((String)map.get("NAME")));
            boardItem.setSubject(((String)map.get("SUBJECT")));
            boardItem.setRegdate(((Timestamp)map.get(("REGDATE"))));
            boardItem.setCount(((Number)map.get("COUNT")).intValue());
            boardItems.add(boardItem);
        }
        return boardItems;
    }

    public int getTotalRecord(String keyWord, String keyField) {
        int totalRecord = 0;
        DBManager db = new DBManager();
        List<Map<String, Object>> result;
        if(keyWord==null||keyWord.isEmpty()) {
            result = db.executeSelect("select count(num) as count from board");
        }
        else{
            if(isInvalidKeyField(keyField))
                throw new IllegalArgumentException(keyField + " is not valid");
            result = db.executeSelect("select count(num) as count from board where "+keyField+"  like ?", "%"+keyWord+"%");
        }
        totalRecord = ((Number)result.get(0).get("COUNT")).intValue();
        return totalRecord;
    }
    
    //게시글 1개 상세정보 파싱
    private BoardItem parseBoardItemFrom(List<Map<String, Object>> resultList) {
        BoardItem boardItem = new BoardItem();
        for(String key:resultList.get(0).keySet()){
            Object data = resultList.get(0).get(key);
            if(data !=null){
                switch (key.toLowerCase()){
                    case "num" -> boardItem.setNum(((Number)data).intValue());
                    case "name" -> boardItem.setName(((String)data));
                    case "subject" -> boardItem.setSubject(((String)data));
                    case "content" -> boardItem.setContent(((String)data));
                    case "pos" -> boardItem.setPos(((Number)data).intValue());
                    case "ref" -> boardItem.setRef(((Number)data).intValue());
                    case "depth" -> boardItem.setDepth(((Number)data).intValue());
                    case "regdate" -> boardItem.setRegdate(((Timestamp)data));
                    case "pass" -> boardItem.setPass(((String)data));
                    case "ip" -> boardItem.setIp(((String)data));
                    case "count" -> boardItem.setCount(((Number)data).intValue());
                    case "filename" -> boardItem.setFilename(((String)data));
                    case "filesize" -> boardItem.setFilesize(((Number)data).intValue());
                }
            }
        }
        return boardItem;
    }
    //문자열이 비었으면 기본값을 리턴하는 유틸
    public String defaultIfNullOrEmpty(String str, String defaultValue) {
        return  str == null||str.isEmpty()?defaultValue:str;
    }
    //--------------------------------------------------------------------------------------------
}
