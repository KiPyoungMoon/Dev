package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.OldVO;
import com.google.gson.Gson;

public class DeleteService implements command {
	private DAO dbms = DAO.getDBMS();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("deleteService Start");
		response.setCharacterEncoding("UTF-8");
		
		String jsonData  = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		
		int id = Integer.parseInt((json.get("id")+""));
		if (json.get("command").equals("oldInfo")) {
			// command가 oldinfo를 구하는거면 노인 정보 구해서 출력해주자.
			System.out.println("입력받은 노인 관리번호 >> " + id);
			OldVO oldInfo = this.oldInfo(id);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(oldInfo);
			
			System.out.println("GSON's jsonStr >> " + jsonStr);
			response.getWriter().print(jsonStr);
			
		}else if (json.get("command").equals("deleteInfo")) {
			System.out.println("삭제할 노인 관리번호 >> " + id);
			int result = this.deleteInfo(id);
			
			if (result > 0) {
				response.getWriter().print("success");
			}else {
				response.getWriter().print("failed");
			}
		}
	}

	private int deleteInfo(int id) {
		//DAO dbms = DAO.getDBMS();
		int result = this.dbms.deleteOldInfo(id);

		return result;
	}

	private OldVO oldInfo(int id) {
		//DAO dbms = DAO.getDBMS();
		OldVO oldInfo = this.dbms.oldInfoSearch(id);
		
		return oldInfo;
	}
}
