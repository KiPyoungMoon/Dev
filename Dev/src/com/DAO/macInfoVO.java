package com.DAO;

public class macInfoVO {

	private String mac;
	private int id;
	private String kinds;

	public macInfoVO(int id, String kinds) {
		this.id = id;
		this.kinds = kinds;
	}
	public macInfoVO(String mac,int id, String kinds) {
		this.mac = mac;
		this.id = id;
		this.kinds = kinds;
	}

	public int getId() {
		return id;
	}

	public String getKinds() {
		return kinds;
	}
	public String getMac() {
		return mac;
	}
	
}
