package com.DAO;

public class OldVO {
	private int id;
	private String name;
	private String birth;
	private String address;
	private String tel;
	private String famTel;
	private String special;
	private String famId;
	private String sen_last;

	public OldVO(String name, String birth, String address, String tel, String famTel, String special, String famId) {
		this.name = name;
		this.birth = birth;
		this.address = address;
		this.tel = tel;
		this.famTel = famTel;
		this.special = special;
		this.famId = famId;
	}
	public OldVO(int id, String name, String birth, String address, String tel, String famTel, String special, String famId) {
		this.id = id;
		this.name = name;
		this.birth = birth;
		this.address = address;
		this.tel = tel;
		this.famTel = famTel;
		this.special = special;
		this.famId = famId;
	}

	public OldVO(int id, String sen_last) {
		this.id = id;
		this.sen_last = sen_last;
	}
	
	public String getSen_last() {
		return sen_last;
	}
	public void setSen_last(String sen_last) {
		this.sen_last = sen_last;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public String getBirth() {
		return birth;
	}

	public String getAddress() {
		return address;
	}

	public String getTel() {
		return tel;
	}

	public String getFamTel() {
		return famTel;
	}

	public String getSpecial() {
		return special;
	}

	public String getFamId() {
		return famId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setFamTel(String famTel) {
		this.famTel = famTel;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public void setFamId(String famId) {
		this.famId = famId;
	}
	
}
