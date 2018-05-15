package com.DAO;

import java.util.ArrayList;

public class AssignInfoVO {

	private ManagerVO manInfo;
	private ArrayList<OldVO> oldInfo;

	public AssignInfoVO(ManagerVO manInfo, ArrayList<OldVO> oldInfo) {
			this.manInfo = manInfo;
			this.oldInfo = oldInfo;
		}

	public ManagerVO getManInfo() {
		return manInfo;
	}

	public void setManInfo(ManagerVO manInfo) {
		this.manInfo = manInfo;
	}

	public ArrayList<OldVO> getOldInfo() {
		return oldInfo;
	}

	public void setOldInfo(ArrayList<OldVO> oldInfo) {
		this.oldInfo = oldInfo;
	}

}
