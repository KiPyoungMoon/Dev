package com.DAO;

public class SetFillTimeVO {
	private int id;
	private int numOfTimes;
	private String[] setTimeArr;
	private String[] setNameArr;

	public SetFillTimeVO(int id, int numOfTimes, String[] setTimeArr, String[] setNameArr) {
		this.id = id;
		this.numOfTimes = numOfTimes;
		this.setTimeArr = setTimeArr;
		this.setNameArr = setNameArr;
	}

	public int getId() {
		return id;
	}

	public int getNumOfTimes() {
		return numOfTimes;
	}

	public String[] getSetTimeArr() {
		return setTimeArr;
	}

	public String[] getSetNameArr() {
		return setNameArr;
	}

}
