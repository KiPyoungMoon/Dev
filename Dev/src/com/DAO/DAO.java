package com.DAO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class DAO {

	private static DAO dbms;
	private Connection conn = null; // DB연결 정보를 담는 객체.
	private PreparedStatement pst = null; // SQL구문을 담는 객체
	private ResultSet rs = null; // SELECT하면 DB는 해당 내용을 담은 ResultSet타입의 객체를 반환해준다.

	private DAO() {
	}

	public static DAO getDBMS() {
		if (dbms == null) {
			dbms = new DAO();
		}
		return dbms;
	}

	public void getConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			InputStream in = this.getClass().getResourceAsStream("../../../../db.properties");
			Properties p = new Properties();
			try {
				p.load(in);
				String url = p.getProperty("url");
				String oracleUser = p.getProperty("dbid");
				String oraclePw = p.getProperty("dbpw");
				conn = DriverManager.getConnection(url, oracleUser, oraclePw);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// }
	}

	public void close() throws Exception {
		if (rs != null) {
			rs.close();
		}
		if (pst != null) {
			pst.close();
		}
		if (conn != null) {
			conn.close();
		}
	}

	public void disconnect() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean login(ManagerVO manager) {
		// TODO Auto-generated method stub
		System.out.println("DAO.login Start");
		this.getConnect();
		boolean isLogin = false;
		String sql = "SELECT PW FROM MANAGER WHERE ID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, manager.getId());
			rs = pst.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(manager.getPw())) {
					System.out.println("Login success");
					isLogin = true;
				} else {
					System.out.println("Login failed");
				}
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isLogin;
	}

	public boolean userLogin(ManagerVO user) {
		// TODO Auto-generated method stub
		System.out.println("DAO.login Start");
		System.out.println(user.getId() + " /// " + user.getPw());
		this.getConnect();
		boolean isLogin = false;
		String sql = "SELECT PW FROM MEMBER WHERE ID = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getId());
			rs = pst.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(user.getPw())) {
					System.out.println("Login success");
					isLogin = true;
				} else {

					System.out.println("Login failed");
				}
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isLogin;
	}

	public int registOld(OldVO old) {
		String sql = "INSERT INTO OLD VALUES(OLD_ID_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, old.getName());
			pst.setString(2, old.getBirth());
			pst.setString(3, old.getAddress());
			pst.setString(4, old.getTel());
			pst.setString(5, old.getFamTel());
			pst.setString(6, old.getSpecial());
			pst.setString(7, old.getFamId());
			result = pst.executeUpdate();
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id = this.getNewOld();
		result = this.firstFillTime(id);
		return result;
	}

	private int getNewOld() {
		String sql = "SELECT MAX(ID) FROM OLD";
		int id = 0;
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	public int firstFillTime(int id) {
		System.out.println("기본 복약시간 설정 DAO 시작");

		String sql = "INSERT INTO FILLTIME VALUES(?,0, NULL, NULL)";
		int result = 0;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<OldVO> oldInfoSearch(String name) {
		String sql = "SELECT * FROM OLD WHERE NAME = ? ORDER BY ID DESC";
		ArrayList<OldVO> oldList = new ArrayList<>();
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				// String nm = rs.getString(2);
				String birth = rs.getString(3);
				String address = rs.getString(4);
				String tel = rs.getString(5);
				String famTel = rs.getString(6);
				String special = rs.getString(7);
				String famId = rs.getString(8);

				oldList.add(new OldVO(id, name, birth, address, tel, famTel, special, famId));
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oldList;
	}

	public OldVO oldInfoSearch(int id) {
		String sql = "SELECT * FROM OLD WHERE ID = ?";
		OldVO oldInfo = null;
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				// int id = rs.getInt(1);
				String nm = rs.getString(2);
				String birth = rs.getString(3);
				String address = rs.getString(4);
				String tel = rs.getString(5);
				String famTel = rs.getString(6);
				String special = rs.getString(7);
				String famId = rs.getString(8);

				oldInfo = new OldVO(id, nm, birth, address, tel, famTel, special, famId);
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oldInfo;
	}

	public int modifyOld(OldVO oldInfo) {
		String sql = "UPDATE OLD SET NAME = ?, BIRTH =?, ADDRESS=?, TEL = ?, FAMTEL = ?, SPECIAL = ?, FAMID = ? WHERE ID = ?";
		int result = 0;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, oldInfo.getName());
			pst.setString(2, oldInfo.getBirth());
			pst.setString(3, oldInfo.getAddress());
			pst.setString(4, oldInfo.getTel());
			pst.setString(5, oldInfo.getFamTel());
			pst.setString(6, oldInfo.getSpecial());
			pst.setString(7, oldInfo.getFamId());
			pst.setInt(8, oldInfo.getId());
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteOldInfo(int id) {
		String sql = "DELETE FROM OLD WHERE ID = ?";
		int result = 0;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public ManagerVO getManagerInfo(String id) {
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		ManagerVO manInfo = null;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				// String id = rs.getString(1);
				// String pw = rs.getString(2);
				String birth = rs.getString(3);
				String tel = rs.getString(4);
				String name = rs.getString(5);

				manInfo = new ManagerVO(id, birth, tel, name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return manInfo;
	}

	public ArrayList<OldVO> getAssignOldList(String famId) {
		String sql = "SELECT * FROM OLD WHERE FAMID = ? ORDER BY ID ASC";
		ArrayList<OldVO> oldList = new ArrayList<>();
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, famId);
			rs = pst.executeQuery();

			while (rs.next()) {
				int oldId = rs.getInt(1);
				String nm = rs.getString(2);
				String birth = rs.getString(3);
				String address = rs.getString(4);
				String tel = rs.getString(5);
				String famTel = rs.getString(6);
				String special = rs.getString(7);
				// String famId = rs.getString(8);

				oldList.add(new OldVO(oldId, nm, birth, address, tel, famTel, special, famId));
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oldList;
	}

	public int unassigned(int id) {
		String sql = "UPDATE OLD SET FAMID = NULL WHERE ID = ?";
		int result = 0;

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int assign(String manId, int oldId) {
		System.out.println("assignDAO start");
		String sql = "UPDATE OLD SET FAMID = ? WHERE ID = ?";
		int result = 0;

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, manId);
			pst.setInt(2, oldId);
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public boolean isManDuplicate(String id) {
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = ?";
		boolean result = false;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					result = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int regManager(ManagerVO manInfo) {
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?)";
		int result = 0;

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, manInfo.getId());
			pst.setString(2, manInfo.getPw());
			pst.setString(3, manInfo.getBirth());
			pst.setString(4, manInfo.getTel());
			pst.setString(5, manInfo.getName());
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/*
	 * public int getSensOld(String mac) { String sql =
	 * "SELECT ID FROM SENSOR WHERE MAC = ?"; int id = 0; this.getConnect(); try {
	 * pst = conn.prepareStatement(sql); pst.setString(1, mac); rs =
	 * pst.executeQuery(); if (rs.next()) { id = rs.getInt(1); } this.close(); }
	 * catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (Exception e) { // TODO Auto-generated catch
	 * block e.printStackTrace(); } return id; }
	 */

	public int insertTHVal(int id, String temperature, String humidity) {
		System.out.println("온습도 저장 DAO 시작");
		String sql = "INSERT INTO TH_LOG VALUES(TH_LOG_IDX_SEQ.NEXTVAL, ?, ?, ?)";
		int result = 0;

		this.getConnect();
		try {
			System.out.println("id >> " + id + " // temperature >> " + temperature + " // humidity >> " + humidity);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, temperature);
			pst.setString(3, humidity);
			result = pst.executeUpdate();
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public fillTimeVO getFillTime(String oldId, String day) {
		int id = Integer.parseInt(oldId);
		int idx = 0;

		String[] timeArr = new String[3];
		for (int i = 0; i < timeArr.length; i++) {
			timeArr[i] = "";
		}

		String sql = "SELECT CHK FROM CHK_FILL WHERE ID = ? AND DAY = ?";

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, day);
			rs = pst.executeQuery();

			while (rs.next()) {
				timeArr[idx++] = rs.getString(1);
			}
			this.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new fillTimeVO(timeArr[0], timeArr[1], timeArr[2]);
	}

	public ArrayList<liveLogVO> getLiveLog(String oldId) {
		String sql = "SELECT ROWNUM AS RNUM, A.SEN_LAST, A.KINDS FROM (SELECT SEN_LAST.SEN_LAST, SENSOR.KINDS FROM SEN_LAST, SENSOR WHERE SEN_LAST.MAC = SENSOR.MAC AND SEN_LAST.ID = ?	ORDER BY SEN_LAST DESC) A WHERE ROWNUM <=5";
		ArrayList<liveLogVO> liveLogList = new ArrayList<>();
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, oldId);
			rs = pst.executeQuery();
			while (rs.next()) {
				String sen_last = rs.getString(2);
				String kinds = rs.getString(3);
				liveLogList.add(new liveLogVO(sen_last, kinds));
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return liveLogList;
	}

	public THLogVO getTHLog(String oldId) {
		String sql = "SELECT ROWNUM AS RNUM, A.TEMP, A.HUMI FROM (SELECT TEMP, HUMI FROM TH_LOG WHERE ID = ?) A WHERE ROWNUM <=1";
		int id = Integer.parseInt(oldId);
		THLogVO THLog = null;
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				String temperature = rs.getString(2);
				String humidity = rs.getString(3);
				THLog = new THLogVO(temperature, humidity);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return THLog;
	}

	public macInfoVO getMacInfo(String mac) {
		String sql = "SELECT ID, KINDS FROM SENSOR WHERE MAC = ?";
		macInfoVO macInfo = null;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, mac);
			rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String kinds = rs.getString(2);
				macInfo = new macInfoVO(id, kinds);
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return macInfo;
	}

	public int insertChkFill(int id, String date, String time) {
		String sql = "INSERT INTO CHK_FILL VALUES(CHK_FILL_TDX_SEQ.NEXTVAL, ?, ?, ?)";
		int result = 0;
		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, time);
			pst.setString(3, date);
			result = pst.executeUpdate();
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<OldVO> getSenLast(ArrayList<OldVO> oldList) {
		System.out.println("getSenLast DAO 시작");

		String idStr = "";
		ArrayList<OldVO> oldSenLast = new ArrayList<>();
		for (int i = 0; i < oldList.size(); i++) {
			if (i == 0) {
				idStr += oldList.get(i).getId();
			} else {
				idStr += "," + oldList.get(i).getId();
			}
		}

		String sql = "SELECT ID, SEN_LAST FROM (SELECT ID, SEN_LAST FROM (SELECT ID, SEN_LAST, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY SEN_LAST DESC) rn FROM SEN_LAST) a WHERE rn = 1) WHERE ID IN("
				+ idStr + ") ORDER BY SEN_LAST";

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String sen_last = rs.getString(2);
				oldSenLast.add(new OldVO(id, sen_last));
			}
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oldSenLast;
	}

	public int insertLiveChk(int id, String mac, String fullTime) {
		System.out.println("insertLiveChk DAO start");

		String sql = "INSERT INTO SEN_LAST VALUES(SEN_LAST_IDX_SEQ.NEXTVAL, ?,?,? )";
		int result = 0;
		this.getConnect();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, fullTime);
			pst.setString(3, mac);
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public SetFillTimeVO getFillSetTime(String oldId) {
		System.out.println("복약 설정시간 dao 시작");
		String sql = "SELECT * FROM FILLTIME WHERE ID = ?";
		int id = Integer.parseInt(oldId);
		SetFillTimeVO setFillTime = null;

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				String setTime = rs.getString(3);
				String fillName = rs.getString(4);
				String[] setTimeArr = null;
				String[] fillNameArr = null;
				if (rs.getInt(2) > 0) {
					setTimeArr = setTime.split(" ");
					fillNameArr = fillName.split(" ");
				}
				setFillTime = new SetFillTimeVO(rs.getInt(1), rs.getInt(2), setTimeArr, fillNameArr);
			}
			System.out.println("while문 다 돌아감!!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return setFillTime;
	}

	public int updateSetFillTime(SetFillTimeVO setFillTime) {
		System.out.println("복약시간 설정 서비스 DAO 시작");
		String sql = "UPDATE FILLTIME SET NUMOFTIMES = ?, SETTIME = ?, FILLNAME = ? WHERE ID = ?";
		String setTimeStr = "";
		String setNamestr = "";
		int result = 0;

		for (int i = 0; i < setFillTime.getSetTimeArr().length; i++) {
			if (i == setFillTime.getSetTimeArr().length - 1) {
				setTimeStr += setFillTime.getSetTimeArr()[i];
				setNamestr += setFillTime.getSetNameArr()[i];
			} else {
				setTimeStr += setFillTime.getSetTimeArr()[i] + " ";
				setNamestr += setFillTime.getSetNameArr()[i] + " ";
			}
		}

		this.getConnect();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, setFillTime.getNumOfTimes());
			pst.setString(2, setTimeStr);
			pst.setString(3, setNamestr);
			pst.setInt(4, setFillTime.getId());
			result = pst.executeUpdate();

			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int insertMacInfo(macInfoVO macInfo) {
		System.out.println("센서등록 DAO 시작");
		String sql = "INSERT INTO SENSOR VALUES(?, ?, ?)";
		int result = 0;
		this.getConnect();
		/*System.out.println(macInfo.getMac());
		System.out.println(macInfo.getId());
		System.out.println(macInfo.getKinds());*/
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, macInfo.getMac());
			pst.setInt(2, macInfo.getId());
			pst.setString(3, macInfo.getKinds());
			result = pst.executeUpdate();
			
			this.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}