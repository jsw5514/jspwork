package ch12_ajax.ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import java.io.IOException;

@WebServlet("/ajax01/ajax3.do")
public class AjaxServlet03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		/*
		// v1. 응답 데이터가 하나의 문자열 일 때
		response.setContentType("text/html; charset=UTF8");
		String responseData = "이름 : " + name + ", 나이 : " + age;
		response.getWriter().print(responseData);
		*/
		
		/*
		// v2. 응답 데이터가 여러개 일 때
		response.setContentType("text/html; charset=UTF8");
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		// v3. 응답 데이터가 여러개 일 때(JSONArray사용)
		/*
		 * JSON(JavaScript Object Notation : 자바스크립트 객체 표기법) 
		   - ajax 통신시 데이터 전송에 자주 사용되는 포맷형식 중 하나
		     > [value, value, value] => 자바스크립트에서의 배열 객체 => JSONArray
		     > {key:value, key:value} => 자바스크립트에서의 일반 객체 => JSONObject
		 */
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		// response.setContentType("text/html; charset=UTF8");  // 하나의 문자열로 반환
		response.setContentType("application/json; charset=UTF8");
		response.getWriter().print(jArr);
		*/
		
		// v4. JSONObject
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		response.setContentType("application/json; charset=UTF8");
		response.getWriter().print(jObj);
	}

}
