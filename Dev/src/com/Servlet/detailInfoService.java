package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.DAO.DAO;
import com.DAO.DetailInfoVO;
import com.DAO.SetFillTimeVO;
import com.DAO.THLogVO;
import com.DAO.fillTimeVO;
import com.DAO.liveLogVO;
import com.DAO.timeVO;
import com.google.gson.Gson;

public class detailInfoService implements command {
	DAO dbms = DAO.getDBMS();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("detailInfo service start");

		/*
		 * 1. 노인id를 꺼내오기 일단 1번이라고 가정 2. 해당 id의 당일의 복약시간 / 최근 센서 반응시간 5개 / 마지막 온습도 구하기 3.
		 * 해당 값 리턴해주기.
		 */
		response.setCharacterEncoding("UTF-8");
		String jsonData = request.getParameter("jsonData");
		JSONObject json = (JSONObject) JSONValue.parse(jsonData);
		String oldId = (String) json.get("id");
		System.out.println("oldId >> " + oldId);

		// 0. 현재시간 가져오기
		// String[] timeArr = this.getTime();
		// String day = timeArr[0];
		// String time = timeArr[1];
		timeVO getTime = new timeVO();
		String day = getTime.getDay();
		String time = getTime.getTime();

		// 1.복약시간 가져오기
		fillTimeVO fillTime = this.getFillTime(oldId, day);
		// 2.생활감지 가져오기
		ArrayList<liveLogVO> liveLogList = this.getLiveLog(oldId);
		// 3.온/습도 가져오기
		THLogVO THLog = this.getTHLog(oldId);
		// 4. 미리 설정된 복약시간 가져오기
		SetFillTimeVO setFillTime = this.getFillSetTime(oldId);
		

		DetailInfoVO detailInfo = new DetailInfoVO(fillTime, liveLogList, THLog, setFillTime);
		Gson gson = new Gson();

		String gsonString = gson.toJson(detailInfo);
		System.out.println("gsonString >> " + gsonString);
		response.getWriter().print(gsonString);
	}

	private SetFillTimeVO getFillSetTime(String oldId) {
		System.out.println("get Fill Set time method start");
		return dbms.getFillSetTime(oldId);
	}

	private THLogVO getTHLog(String oldId) {
		System.out.println("temperature/humidity method start");
		THLogVO THLog = dbms.getTHLog(oldId);
		return THLog;
	}

	private ArrayList<liveLogVO> getLiveLog(String oldId) {
		System.out.println("getLiveLog start");
		ArrayList<liveLogVO> liveLogList = dbms.getLiveLog(oldId);
		return liveLogList;
	}

	private fillTimeVO getFillTime(String oldId, String day) {
		System.out.println("getFillTime start");
		System.out.println("oldId >> " + oldId);
		fillTimeVO fillTime = dbms.getFillTime(oldId, day);
		return fillTime;
	}
	/*
	 * private String[] getTime() { // 현재시간 가져와서 날짜와 시간으로 쪼개서 배열 리턴.
	 * System.out.println("getTime start");
	 * 
	 * long time = System.currentTimeMillis(); SimpleDateFormat dayTime = new
	 * SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); String str = dayTime.format(new
	 * Date(time)); System.out.println("str >> " + str); String[] timeArr =
	 * str.split(" ");
	 * 
	 * for (int i = 0; i < timeArr.length; i++) { System.out.println("timeArr >> " +
	 * timeArr[i]); } return timeArr; }
	 */
}
