package com.lanyuan.entity.chuangyeyuan;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

@TableSeg(tableName = "c_room_status", id = "id")
public class C_room_statusFormMap extends FormMap<String, Object> {

	private static final long serialVersionUID = 1L;

	private int id;

	private int roomId;

	private String liveStatus;

	private int currentBudgetId;

	private String createTime;

	private String updateTime;

	private int count;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(String liveStatus) {
		this.liveStatus = liveStatus;
	}

	public int getCurrentBudgetId() {
		return currentBudgetId;
	}

	public void setCurrentBudgetId(int currentBudgetId) {
		this.currentBudgetId = currentBudgetId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
