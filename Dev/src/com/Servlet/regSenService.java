package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.macInfoVO;

public class regSenService implements command {
	DAO dbms = DAO.getDBMS();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("regist Sensor Service");
		request.setCharacterEncoding("UTF-8");

		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		System.out.println("입력받은 값 확인 >> " + json.get("data").toString());
		JSONObject jsonForm = (JSONObject) json.get("data");
		
		int result = dbms.insertMacInfo(new macInfoVO((String) jsonForm.get("mac"),
				Integer.parseInt((String) jsonForm.get("oldId")), (String) jsonForm.get("kinds")));
		if (result > 0) {
			response.getWriter().print(200);
		}else {
			response.getWriter().print(404);
		}
	}
}
