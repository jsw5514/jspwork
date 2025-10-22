package ch12_ajax.ajax01;


import com.google.gson.Gson;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AjaxServlet05", value = "/ajax5.do")
public class AjaxServlet05 extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException { }

//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }

    @Override
    public void destroy() { }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Member> members = new MemberDao().getAllMember();
        response.setContentType("application/json;charset=UTF-8");
        
//        //1. JSONArray
//        JSONArray jsonArray =  new JSONArray();
//        for (Member member : members) {
//            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("id", member.getId());
//            jsonObject.put("name", member.getName());
//            jsonObject.put("gender", member.getGender());
//            jsonObject.put("email", member.getEmail());
//            jsonArray.add(jsonObject);
//        }
//        response.getWriter().println(jsonArray);
        
        new Gson().toJson(members, response.getWriter());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { }
}