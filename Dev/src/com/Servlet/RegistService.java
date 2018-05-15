package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.OldVO;

public class RegistService implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("RegistService start");

		DAO dbms = DAO.getDBMS();
		request.setCharacterEncoding("UTF-8");
		
		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);

		System.out.println("name >> " + json.get("name"));

		OldVO old = new OldVO((String) json.get("name"), (String) json.get("birth"), (String) json.get("address"),
				(String) json.get("tel"), (String) json.get("famTel"), (String) json.get("special"),
				(String) json.get("famId"));
		
		if (dbms.registOld(old) > 0) {
			response.getWriter().print(200);
		} else {
			response.getWriter().print(404);
		}
	}
}