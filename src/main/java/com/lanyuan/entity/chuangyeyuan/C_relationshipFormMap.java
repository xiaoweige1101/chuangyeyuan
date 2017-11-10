package com.lanyuan.entity.chuangyeyuan;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

@TableSeg(tableName = "c_relationship", id = "id")
public class C_relationshipFormMap extends FormMap<String, Object> {

	private static final long serialVersionUID = 1L;

	private int id;

	private int roomId;

	private int guestId;

	private int monthRent;

	private int granteeMoney;

	private String startDate;

	private String detail;

	private int isDelete;

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

	public int getGuestId() {
		return guestId;
	}

	public void setGuestId(int guestId) {
		this.guestId = guestId;
	}

	public int getMonthRent() {
		return monthRent;
	}

	public void setMonthRent(int monthRent) {
		this.monthRent = monthRent;
	}

	public int getGranteeMoney() {
		return granteeMoney;
	}

	public void setGranteeMoney(int granteeMoney) {
		this.granteeMoney = granteeMoney;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
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
