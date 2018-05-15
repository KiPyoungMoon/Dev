package com.DAO;

import java.util.ArrayList;

public class OldListVO {
	private ArrayList<OldVO> OldList = new ArrayList<>();

	public OldListVO(ArrayList<OldVO> oldList) {
		super();
		OldList = oldList;
	}

	public ArrayList<OldVO> getOldList() {
		return OldList;
	}

	public void setOldList(ArrayList<OldVO> oldList) {
		OldList = oldList;
	}	
}
