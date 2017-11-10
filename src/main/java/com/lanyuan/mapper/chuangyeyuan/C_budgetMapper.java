package com.lanyuan.mapper.chuangyeyuan;

import java.util.List;

import com.lanyuan.entity.chuangyeyuan.C_budgetFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface C_budgetMapper extends BaseMapper {
	public List<C_budgetFormMap> getListByRoomId(int roomId, int pageNo, int pageSize);
	
	public List<C_budgetFormMap> getListByGuestId(int guestId, int pageNo, int pageSize);
	
	public List<C_budgetFormMap> getList(int pageNo, int pageSize);
	
	public void saveOrUpdate(C_budgetFormMap budget);
	
}
