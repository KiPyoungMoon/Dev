package com.Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.SetFillTimeVO;
import com.Servlet.command;

public class setFillTimeService implements command {
	DAO dbms = DAO.getDBMS();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("복약시간 설정 서비스 시작");

		request.setCharacterEncoding("euc-kr");
		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);

		int id = Integer.parseInt((String) json.get("id"));
		int numOfTimes = (int) ((long)json.get("numOfTimes"));
		JSONArray setTimeJsonArr = (JSONArray) json.get("setTimeArr");
		JSONArray setNameJsonArr = (JSONArray) json.get("setNameArr");
		String[] setTimeArr = new String[setTimeJsonArr.size()];
		String[] setNameArr = new String[setNameJsonArr.size()];

		for (int i = 0; i < setTimeJsonArr.size(); i++) {
			setTimeArr[i] = (String) setTimeJsonArr.get(i);
			setNameArr[i] = (String) setNameJsonArr.get(i);
		}

		SetFillTimeVO setFillTime = new SetFillTimeVO(id, numOfTimes, setTimeArr, setNameArr);

		this.updateSetFillTime(setFillTime);
	}

	private void updateSetFillTime(SetFillTimeVO setFillTime) {
		System.out.println("복약시간 설정 서비스 method 시작");
		if (dbms.updateSetFillTime(setFillTime) > 0) {
			System.out.println("복약시간 설정 업데이트 완료");
		} else {
			System.out.println("복약시간 설정 업데이트 실패");
		}
	}
}
