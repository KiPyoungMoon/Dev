package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.OldVO;
import com.google.gson.Gson;

public class ModifyService implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ModifyService Start");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String jsonData = request.getParameter("jsonData");
		
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		
		System.out.println("command >> " + json.get("command") + " /// name >> "+json.get("name") + " /// oldId >> " + json.get("oldId"));
		
		if (((String)json.get("command")).equals("oldList")) {
			System.out.println("검색커맨드 호출.");
			String jsonStr = this.getList((String)json.get("name"));
			
			response.getWriter().print(jsonStr);
		}else if (((String)json.get("command")).equals("modify")) {
			System.out.println("수정커맨드 호출.");
			System.out.println("입력받은 값 확인 >> " + json.get("data").toString());
			
			int id = Integer.parseInt((json.get("oldId")+""));
			JSONObject jsonForm = (JSONObject) json.get("data");
			String name = (String)jsonForm.get("name");
			String birth = (String)jsonForm.get("birth");
			String address = (String)jsonForm.get("address");
			String tel = (String)jsonForm.get("tel");
			String famTel = (String)jsonForm.get("famTel");
			String special = (String)jsonForm.get("special");
			String famId = (String)jsonForm.get("famId");
	
			OldVO oldInfo = new OldVO(id, name, birth, address, tel, famTel, special, famId);
			
			if (this.modify(oldInfo) > 0) {
				System.out.println("old modify success");
				response.getWriter().print(200);
			}else {
				System.out.println("old modify failed");
				response.getWriter().print(404);
			}
		}
	}

	private int modify(OldVO oldInfo) {
		System.out.println("modify method start");
		DAO dbms = DAO.getDBMS();
		int result = dbms.modifyOld(oldInfo);
		return result; 
	}


	private String getList(String name) {
		System.out.println("oldList mathod Start");
		System.out.println("검색이름 >> " + name);
		
		DAO dbms = DAO.getDBMS();
		ArrayList<OldVO> oldList = new ArrayList<>();
		oldList = dbms.oldInfoSearch(name);
		
		// arraylist -> jsonArray로 바꾸자.
		Gson gson = new Gson();
		String jsonStr = gson.toJson(oldList);
		
		System.out.println("GSON's jsonStr >> " + jsonStr);
		
		return jsonStr;
		/*JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		for (int i = 0; i < oldList.size(); i++) {
			System.out.println("리턴받은 oldList Name >> " + oldList.get(i).getName());
			
			JSONObject jsonOldInfo = new JSONObject();
			jsonOldInfo.put("id", oldList.get(i).getId());
			jsonOldInfo.put("name", oldList.get(i).getName());
			jsonOldInfo.put("birth", oldList.get(i).getBirth());
			jsonOldInfo.put("address", oldList.get(i).getAddress());
			jsonOldInfo.put("tel", oldList.get(i).getTel());
			jsonOldInfo.put("famTel", oldList.get(i).getFamTel());
			jsonOldInfo.put("special", oldList.get(i).getSpecial());
			jsonOldInfo.put("famId", oldList.get(i).getFamId());
			jsonArr.add(jsonOldInfo);
		}
		jsonObj.put("oldList", oldList);
		System.out.println(jsonObj.toJSONString());*/
	}
}
