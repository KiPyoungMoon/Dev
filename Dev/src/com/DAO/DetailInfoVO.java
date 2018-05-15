package com.DAO;

import java.util.ArrayList;

public class DetailInfoVO {
	private fillTimeVO fillTime;
	private ArrayList<liveLogVO> liveLogList;
	private THLogVO tHLog;
	private SetFillTimeVO setFillTime;

	public DetailInfoVO(fillTimeVO fillTime, ArrayList<liveLogVO> liveLogList, THLogVO tHLog,
			SetFillTimeVO setFillTime) {
		this.fillTime = fillTime;
		this.liveLogList = liveLogList;
		this.tHLog = tHLog;
		this.setFillTime = setFillTime;
	}

	public fillTimeVO getFillTime() {
		return fillTime;
	}

	public ArrayList<liveLogVO> getLiveLogList() {
		return liveLogList;
	}

	public THLogVO gettHLog() {
		return tHLog;
	}

	public SetFillTimeVO getSetFillTime() {
		return setFillTime;
	}
}
