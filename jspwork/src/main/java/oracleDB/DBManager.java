package oracleDB;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.*;

/**
 * <h3>DB 관리자 클래스</h3>
 * <b>이름:</b> DBManager<hr>
 * <b>설명:</b> JDBC 기반으로 SQL 쿼리를 실행시키는 클래스<br>
 *      DB 정보는 config.properties 파일에서 불러옴<br>
 *      <p style="color: #FBCEB1">
 *          <b>필요한 프로퍼티</b><br>
 *          db.driverClassName = JDBC 드라이버 클래스<br>
 *          db.url = DB URL <br>
 *          db.username = DB 계정 유저명<br>
 *          db.password = DB 계정 비밀번호<br>
 *      </p>
 *      <hr>
 * <b>의존성(Gradle Kotlin DSL 기준, 버전명은 유동적으로 사용할것):</b><hr>
 *      //Oracle JDBC 드라이버<br>
 *      implementation("com.oracle.database.jdbc:ojdbc8:19.17.0.0")<br><hr>
 *      //HikariCP(커넥션 풀)<br>
 *      implementation("com.zaxxer:HikariCP:5.1.0")<br> 
 */
public class DBManager {
    private static volatile HikariDataSource dataSource = null;

    public DBManager() {
        //커넥션 풀 초기화
        if(dataSource == null){
            synchronized(DBManager.class){
                Properties prop = new Properties();
                try{
                    try(FileInputStream fis = new FileInputStream("config.properties")){
                        prop.load(fis);
                    }
                } catch (IOException e) {
                    throw new RuntimeException("DB 설정파일을 불러오는데 실패했습니다. config.properties 파일을 확인해주세요.",e);
                }

                try {
                    Class.forName(prop.getProperty("db.driverClassName"));
                }
                catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                HikariConfig config = new HikariConfig();
                config.setJdbcUrl(prop.getProperty("db.url"));
                config.setUsername(prop.getProperty("db.username"));
                config.setPassword(prop.getProperty("db.password"));
                config.setMaximumPoolSize(10);

                dataSource = new HikariDataSource(config);
            }
        }
    }

    /**
     * select문 실행용 메서드 
     * @param sql 실행할 SQL문
     * @param parms PreparedStatement에 바인딩할 파라미터
     * @return 결과 리스트<br>
     *         각 행을 Map으로 변환(컬럼명이 키, 컬럼 순서 유지)한 뒤 
     *         변환된 Map을 List의 요소로 삽입<br>
     *         <span style="color:yellow">getObject를 이용해서 값을 꺼내므로 값을 각 JDBC 사양에 맞게 캐스팅해야함</span>
     */
    public List<Map<String, Object>> executeSelect(String sql, Object... parms) {
        List<Map<String,Object>> resultList = new ArrayList<>();
        try(Connection con = dataSource.getConnection()) {
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                for (int i = 0; i < parms.length; i++) {
                    pstmt.setObject(i + 1, parms[i]);
                }
                try (ResultSet rs = pstmt.executeQuery()) {
                    ResultSetMetaData metaData = rs.getMetaData();
                    while (rs.next()){
                        Map<String,Object> rowMap = new LinkedHashMap<>();
                        for (int i = 1; i <= metaData.getColumnCount(); i++) {
                            rowMap.put(metaData.getColumnName(i), rs.getObject(i));
                        }
                        resultList.add(rowMap);
                    }
                }
            }
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
        return resultList;
    }
    
    /**
     * update, insert, delete 실행용 메서드 
     * @param sql 실행할 SQL문
     * @param parms PreparedStatement에 바인딩할 파라미터
     * @return 결과 리스트<br>
     *         각 행을 Map으로 변환(컬럼명이 키, 컬럼 순서 유지)한 뒤 이 Map을 List의 요소로 삽입
     */    
    public int executeUpdate(String sql, Object... parms) {
        int result = 0;
        try(Connection con = dataSource.getConnection()) {
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                for (int i = 0; i < parms.length; i++) {
                    pstmt.setObject(i + 1, parms[i]);
                }
                result = pstmt.executeUpdate();
            }
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
        return result;
    }
}
