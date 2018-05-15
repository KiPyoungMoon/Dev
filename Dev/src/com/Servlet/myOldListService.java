package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;
import com.DAO.OldVO;
import com.google.gson.Gson;

public class myOldListService implements command {
	DAO dbms = DAO.getDBMS();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("myOldlist service start");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		Gson gson = new Gson();
		ArrayList<OldVO> assignOldList = this.getOldList(id);
		String jsonStr = gson.toJson(assignOldList);

		response.getWriter().print(jsonStr);
	}
	
	private ArrayList<OldVO> getOldList(String famId) {
		System.out.println("myOldlist start");
		
		ArrayList<OldVO> oldList = dbms.getAssignOldList(famId);
		return oldList;
	}
}
