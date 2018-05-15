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
		// ���� mac���� kind�� ������.
		// mac������ ���� �Ǻ� �� �ش� ������ �´� �۾� ����.
		System.out.println("getValue service start");

		request.setCharacterEncoding("euc-kr");
		String data = request.getParameter("data");
		System.out.println("data >> " + data);

		String[] dataArr = new String[4];
		dataArr = data.split(" ");
		System.out.println(Arrays.deepToString(dataArr));

		String mac = dataArr[0];
		macInfoVO macInfo = this.getMacInfo(mac);
		System.out.println("���� >> " + macInfo.getKinds());

		if (macInfo.getKinds().equals("����")) {
			System.out.println("���� �� �Է� Ȯ��");
			if (dataArr[1].equals("st")) {
				System.out.println("���� ����");
			} else if (dataArr[1].equals("T")) {
				System.out.println("���� ���� Ȯ��");
				timeVO getTime = new timeVO();
				if (this.insertChkFill(macInfo.getId(), getTime) > 0) {
					System.out.println("����ð� ���� �Ϸ�");
				}
			} else if (dataArr[1].equals("F")) {
				System.out.println("���� ���� Ȯ��");
			}
		} else if (macInfo.getKinds().equals("�½���")) {
			String temperature = dataArr[1];
			String humidity = dataArr[2];
			if (this.insertTHVal(macInfo.getId(), temperature, humidity) > 0) {
				System.out.println("��/���� ���� �Ϸ�");
			}
		} else { // ���� ���� ������ ��� sen_last�� ���Ƿ� �׳� ����.
			System.out.println("��Ȱ���� �� �Է� Ȯ��");
			timeVO getTime = new timeVO();
			if (macInfo.getKinds().equals("��������")) {
				System.out.println("���������� ���Դ�.");
				if (dataArr[1].equals("ON")) {
					System.out.println("����");
				} else if (dataArr[1].equals("OFF")) {
					System.out.println("����");
				} else if (dataArr[1].equals("st")) {
					System.out.println("���ӵ�");
				}
			}
			if (this.insertLiveChk(macInfo.getId(), mac, getTime) > 0) {
				System.out.println("��Ȱ���� �ð� ���� �Ϸ�");
			}
		}
	}

	private int insertLiveChk(int id, String mac, timeVO getTime) {
		System.out.println("��Ȱ�����ð� ���� �޼ҵ� ����");
		return dbms.insertLiveChk(id, mac, getTime.getfullTime());
	}

	private int insertChkFill(int id, timeVO getTime) {
		System.out.println("����ð� ���� �޼ҵ� ����");
		// ���� ���̵�, ��¥, �ð� ����.
		int result = dbms.insertChkFill(id, getTime.getDay(), getTime.getTime());
		return result;
	}

	private macInfoVO getMacInfo(String mac) {
		// �Ѱܹ��� mac������ ������ id�� ���� ������ �������� �޼ҵ�
		System.out.println("getMac's Info method start");
		macInfoVO macInfo = dbms.getMacInfo(mac);
		return macInfo;
	}

	private int insertTHVal(int id, String temperature, String humidity) {
		System.out.println("�½��� ���� �޼ҵ� ����");
		int reuslt = dbms.insertTHVal(id, temperature, humidity);
		return reuslt;
	}
}
