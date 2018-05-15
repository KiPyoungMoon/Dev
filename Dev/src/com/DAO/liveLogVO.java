package com.DAO;

public class liveLogVO {
	private String sen_last;
	private String kinds;
	
	public liveLogVO(String sen_last, String kinds) {
		this.sen_last = sen_last;
		this.kinds = kinds;
	}

	public String getSen_last() {
		return sen_last;
	}

	public String getKinds() {
		return kinds;
	}
	
}
