package com.lanyuan.vo.chuangyeyuan;

import com.lanyuan.vo.BaseVo;

public class C_RoomBaseVo extends BaseVo {

	private static final long serialVersionUID = 1L;

	private int id;

	private String buildingName;

	private String roomName;

	private String detail;

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

}
