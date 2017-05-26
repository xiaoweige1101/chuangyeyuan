package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_budgetMapper extends BaseMapper{
	public Cyy_budgetFormMap getById(int id);
	
	public List<Cyy_budgetFormMap> getBudgetList();
	
	public Cyy_budgetFormMap getBudgetByRommId(int roomId);
	
	public void addOrUpdateById(Cyy_budgetFormMap budgetFormMap);
	
	public void deleteByRoomName(String roomName);
}
