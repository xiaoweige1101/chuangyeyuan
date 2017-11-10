package com.lanyuan.vo;

import java.io.Serializable;
import java.util.Date;

public class BaseVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;

	private Date create_time;

	private Date update_time;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

}
