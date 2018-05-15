package com.Servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;
import com.DAO.macInfoVO;
import com.DAO.timeVO;

public class getValueService implements command {
	DAO dbms = DAO.getDBMS();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 먼저 mac값과 kind를 꺼낸다.
		// mac값으로 센서 판별 후 해당 센서에 맞는 작업 실행.
		System.out.println("getValue service start");

		request.setCharacterEncoding("euc-kr");
		String data = request.getParameter("data");
		System.out.println("data >> " + data);

		String[] dataArr = new String[4];
		dataArr = data.split(" ");
		System.out.println(Arrays.deepToString(dataArr));

		String mac = dataArr[0];
		macInfoVO macInfo = this.getMacInfo(mac);
		System.out.println("종류 >> " + macInfo.getKinds());

		if (macInfo.getKinds().equals("약통")) {
			System.out.println("약통 값 입력 확인");
			if (dataArr[1].equals("st")) {
				System.out.println("약통 접속");
			} else if (dataArr[1].equals("T")) {
				System.out.println("무게 감소 확인");
				timeVO getTime = new timeVO();
				if (this.insertChkFill(macInfo.getId(), getTime) > 0) {
					System.out.println("복약시간 저장 완료");
				}
			} else if (dataArr[1].equals("F")) {
				System.out.println("무게 증가 확인");
			}
		} else if (macInfo.getKinds().equals("온습도")) {
			String temperature = dataArr[1];
			String humidity = dataArr[2];
			if (this.insertTHVal(macInfo.getId(), temperature, humidity) > 0) {
				System.out.println("온/습도 저장 완료");
			}
		} else { // 약통 제외 센서는 모두 sen_last에 들어가므로 그냥 통합.
			System.out.println("생활반응 값 입력 확인");
			timeVO getTime = new timeVO();
			if (macInfo.getKinds().equals("전류센서")) {
				System.out.println("전류센서값 들어왔다.");
				if (dataArr[1].equals("ON")) {
					System.out.println("켜짐");
				} else if (dataArr[1].equals("OFF")) {
					System.out.println("꺼짐");
				} else if (dataArr[1].equals("st")) {
					System.out.println("접속됨");
				}
			}
			if (this.insertLiveChk(macInfo.getId(), mac, getTime) > 0) {
				System.out.println("생활반응 시간 저장 완료");
			}
		}
	}

	private int insertLiveChk(int id, String mac, timeVO getTime) {
		System.out.println("생활반응시간 저장 메소드 시작");
		return dbms.insertLiveChk(id, mac, getTime.getfullTime());
	}

	private int insertChkFill(int id, timeVO getTime) {
		System.out.println("복약시간 저장 메소드 시작");
		// 노인 아이디, 날짜, 시간 전달.
		int result = dbms.insertChkFill(id, getTime.getDay(), getTime.getTime());
		return result;
	}

	private macInfoVO getMacInfo(String mac) {
		// 넘겨받은 mac값으로 노인의 id와 센서 종류를 가져오는 메소드
		System.out.println("getMac's Info method start");
		macInfoVO macInfo = dbms.getMacInfo(mac);
		return macInfo;
	}

	private int insertTHVal(int id, String temperature, String humidity) {
		System.out.println("온습도 저장 메소드 시작");
		int reuslt = dbms.insertTHVal(id, temperature, humidity);
		return reuslt;
	}
}
