package com.lanyuan.entity.chuangyeyuan;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

@TableSeg(tableName = "c_room", id = "id")
public class C_roomFormMap extends FormMap<String, Object> {

	private static final long serialVersionUID = 1L;

	private int id;

	private String buildingName;

	private String roomName;

	private String detail;

	private String createTime;

	private String updateTime;

	private int count;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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
