package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.ManagerVO;

public class regManService implements command {
	DAO dbms = DAO.getDBMS();
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("regManager Service start");
		request.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();
		
		String jsonData = request.getParameter("jsonData");
		System.out.println("jsonData >> " + jsonData);
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		System.out.println("json.command >>> " + json.get("command"));
		
		if (json.get("command").equals("isChk")) {
			// ���λ���� ���̵� �ߺ� üũ
			System.out.println("idChk start");
			if(this.isManDuplicate((String)json.get("id"))) {
				//�ߺ��̸� true
				out.print("F");
			}else {
				// �ߺ��ƴ� ����
				out.print("S");
			}
		}else if (json.get("command").equals("regist")) {
			// ȸ������
			System.out.println("regist start");
			this.regManager(json);
		}
	}

	private int regManager(JSONObject json) {
		
		String id = (String)json.get("id");
		String pw = (String)json.get("pw");
		String birth = (String)json.get("birth");
		String tel = (String)json.get("tel");
		String name = (String)json.get("name");
		
		int result = dbms.regManager(new ManagerVO(id, pw, birth, tel, name));
		return result;
	}

	private boolean isManDuplicate(String id) {
		boolean result = dbms.isManDuplicate(id);
		return result;
	}
}
