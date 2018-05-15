package com.DAO;

public class ManagerVO {
	private String id;
	private String pw;
	private String birth;
	private String tel;
	private String name;
	
	public ManagerVO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public ManagerVO(String id, String birth, String tel, String name) {
		this.id = id;
		this.birth = birth;
		this.tel = tel;
		this.name = name;
	}
	public ManagerVO(String id, String pw, String birth, String tel, String name) {
		this.id = id;
		this.pw = pw;
		this.birth = birth;
		this.tel = tel;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
