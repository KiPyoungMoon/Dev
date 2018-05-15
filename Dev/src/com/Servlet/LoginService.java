package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.ManagerVO;

public class LoginService implements command {
	DAO dbms = DAO.getDBMS();
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("LoginService Start");
		
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");

		String jsonData = request.getParameter("jsonData");
		System.out.println("jsonData 1ST >> " + jsonData);
		JSONObject json = (JSONObject)JSONValue.parse(jsonData);
		
		System.out.println("command >>> " + json.get("command"));
		
		if(json.get("command").equals("user")) {
			System.out.println("user start");
			
			if(this.userLogin(json)) {
				response.getWriter().print("S");
			}
			
		}else if(json.get("command").equals("manager")) {
			System.out.println("server manager start");
			
			if(this.managerLogin(json)) {
				session.setAttribute("loginId", json.get("id"));
				System.out.println("LoginService.session.loginId >> " + session.getAttribute("loginId"));
				response.getWriter().print("success");
			}else {
				response.getWriter().print("failed");
			}
		}	
	}

	private boolean userLogin(JSONObject json) {
		ManagerVO user = new ManagerVO((String)json.get("id"), (String)json.get("pw"));
		return dbms.userLogin(user);	
	}

	private boolean managerLogin(JSONObject json) {
		ManagerVO manager = new ManagerVO((String)json.get("id"), (String)json.get("pw"));
		return dbms.login(manager);
	}
}
