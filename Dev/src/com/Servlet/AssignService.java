package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.AssignInfoVO;
import com.DAO.DAO;
import com.DAO.ManagerVO;
import com.DAO.OldVO;
import com.google.gson.Gson;

public class AssignService<AssignVO> implements command {
	private DAO dbms = DAO.getDBMS();
	Gson gson = new Gson();
			
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("assignmentService start");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		
		System.out.println("command >> " + json.get("command"));
		
		if (json.get("command").equals("managerInfo")) {
			System.out.println("managerInfo start");
			
			ManagerVO manInfo = this.getManagerInfo((String)json.get("id"));
			ArrayList<OldVO> assignOldList = this.getOldList((String)json.get("id"));
			
			System.out.println("assignOldList.gson.tojson >> " + gson.toJson(assignOldList));
			AssignInfoVO assignInfo = new AssignInfoVO(manInfo, assignOldList);
			
			String jsonStr = gson.toJson(assignInfo);
			System.out.println("managerInfo gsonData >> " + jsonStr);
			
			out.print(jsonStr);
			
		}else if(json.get("command").equals("Unassigned")) {
			System.out.println("unassigned start");
			int id = Integer.parseInt((json.get("id")+""));
			
			int result = this.unassigned(id);
			if (result > 0) {
				out.print(200);
			}else {
				out.print(404);
			}
			
		}else if(json.get("command").equals("searchOld")) {
			System.out.println("searchOld start");
			int id = Integer.parseInt((json.get("id")+""));
			
			OldVO oldInfo = this.getOldInfo(id);
			String jsonStr = gson.toJson(oldInfo);
			
			out.print(jsonStr);
			
		}else if (json.get("command").equals("assign")) {
			System.out.println("assign start");
			
			String manId = (String)json.get("manId");
			int oldId = Integer.parseInt((json.get("oldId")+""));
			
			System.out.println("assginInfo manId >> " + manId + " /// oldId >> " + oldId);
			int result = this.assign(manId, oldId);
			if (result > 0) {
				out.print(200);
				System.out.println("assignDB update success");
			}else {
				out.print(404);
				System.out.println("assignDB update failed");
			}
		}
	}

	private int assign(String manId, int oldId) {
		System.out.println("assign method start");
		int result = dbms.assign(manId, oldId);
		return result;
	}

	private OldVO getOldInfo(int id) {
		System.out.println("getOldInfo method start");
		OldVO oldInfo = dbms.oldInfoSearch(id);
		return oldInfo;
		
	}

	private int unassigned(int id) {
		System.out.println("unassigned method start");
		int result = dbms.unassigned(id);
		return result;
	}

	private ArrayList<OldVO> getOldList(String famId) {
		System.out.println("getAssignOldList start");
		
		ArrayList<OldVO> oldList = dbms.getAssignOldList(famId);
		return oldList;
	}

	private ManagerVO getManagerInfo(String id) {
		System.out.println("getManagerInfo start");
		
		ManagerVO manInfo = dbms.getManagerInfo(id);
		return manInfo;
	}

	
}
