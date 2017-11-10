package com.lanyuan.entity.chuangyeyuan;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.util.FormMap;

@TableSeg(tableName = "c_budget", id = "id")
public class C_budgetFormMap extends FormMap<String, Object> {

	private static final long serialVersionUID = 1L;

	private int id;

	private int roomId;

	private String budgetNo;

	private int waterMoney;

	private int electMoney;

	private int otherMoney;

	private int rentMoney;

	private int totalMoney;

	private String rentStartDate;

	private String rentEndDate;

	private int userId;

	private String detail;

	private String budgetTIme;

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

	public String getBudgetNo() {
		return budgetNo;
	}

	public void setBudgetNo(String budgetNo) {
		this.budgetNo = budgetNo;
	}

	public int getWaterMoney() {
		return waterMoney;
	}

	public void setWaterMoney(int waterMoney) {
		this.waterMoney = waterMoney;
	}

	public int getElectMoney() {
		return electMoney;
	}

	public void setElectMoney(int electMoney) {
		this.electMoney = electMoney;
	}

	public int getOtherMoney() {
		return otherMoney;
	}

	public void setOtherMoney(int otherMoney) {
		this.otherMoney = otherMoney;
	}

	public int getRentMoney() {
		return rentMoney;
	}

	public void setRentMoney(int rentMoney) {
		this.rentMoney = rentMoney;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public String getRentStartDate() {
		return rentStartDate;
	}

	public void setRentStartDate(String rentStartDate) {
		this.rentStartDate = rentStartDate;
	}

	public String getRentEndDate() {
		return rentEndDate;
	}

	public void setRentEndDate(String rentEndDate) {
		this.rentEndDate = rentEndDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getBudgetTIme() {
		return budgetTIme;
	}

	public void setBudgetTIme(String budgetTIme) {
		this.budgetTIme = budgetTIme;
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
