package ch12_ajax.ajax01;


import com.google.gson.Gson;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oracleDB.DBManager;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AjaxServlet04", value = "/ajax4.do")
public class AjaxServlet04 extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        String id = request.getParameter("id");
        Member member = new MemberDao().getMember(id);
        
        System.out.println("id:"+id+" member:"+member);
        response.setContentType("application/json; charset=UTF-8");
                
//        //json-simple 사용
//        JSONObject jsonObject = new JSONObject();
//        if(member == null){
//            jsonObject.put("status","fail");
//            jsonObject.put("message","해당 ID를 찾을 수 없습니다");
//        }
//        else {
//            jsonObject.put("status","success");
//            jsonObject.put("id", member.getId());
//            jsonObject.put("name", member.getName());
//            jsonObject.put("gender", member.getGender());
//            jsonObject.put("email", member.getEmail());
//        }
//        
//        response.setContentType("application/json");
//        response.getWriter().print(jsonObject);
        
//        //json-simple 대신 GSON 사용(success만)
//        new Gson().toJson(member, response.getWriter());
        
        Gson gson = new Gson();
        Map<String,Object> result = new HashMap<>();
        if(member == null){
            result.put("status","fail");
            result.put("message","해당 ID를 찾을 수 없습니다");
        }
        else {
            result.put("status","success");
            result.put("member",member);
        }
        gson.toJson(result,response.getWriter());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}