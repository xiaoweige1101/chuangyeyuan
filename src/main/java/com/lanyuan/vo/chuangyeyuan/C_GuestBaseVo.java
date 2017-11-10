package com.lanyuan.vo.chuangyeyuan;

import com.lanyuan.vo.BaseVo;

public class C_GuestBaseVo extends BaseVo {

	private static final long serialVersionUID = 1L;

	private String idNO;

	private String name;

	private String sex;

	private String phoneNumber;

	private String detail;

	public String getIdNO() {
		return idNO;
	}

	public void setIdNO(String idNO) {
		this.idNO = idNO;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
