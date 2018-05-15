package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.OldVO;
import com.google.gson.Gson;

public class alamTimeService implements command {

	DAO dbms = DAO.getDBMS();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("알람시간 서비스 시작");
		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		String famId = (String) json.get("id");

		ArrayList<OldVO> oldList = this.getOldList(famId);
		// 관리자에 배정된 노인 아이디 읽어왔음.
		ArrayList<OldVO> oldSenLast = this.getSenLast(oldList);

		Gson gson = new Gson();
		String gsonStr = gson.toJson(oldSenLast);
		System.out.println("노인의 마지막 반응시간 gsonStr >> " + gsonStr);

		response.getWriter().print(gsonStr);
	}

	private ArrayList<OldVO> getSenLast(ArrayList<OldVO> oldList) {
		System.out.println("노인별 마지막 반응시간 메소드 시작");
		ArrayList<OldVO> oldSenLast = dbms.getSenLast(oldList);
		return oldSenLast;
	}

	private ArrayList<OldVO> getOldList(String famId) {
		System.out.println("myOldlist start"); 

		ArrayList<OldVO> oldList = dbms.getAssignOldList(famId);
		return oldList;
	}
}
