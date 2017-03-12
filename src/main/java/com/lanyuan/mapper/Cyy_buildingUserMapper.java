package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.Cyy_buildingUserFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_buildingUserMapper extends BaseMapper{
	public Cyy_buildingUserFormMap getById(int id);
	
	public List<Cyy_buildingUserFormMap> getByBuildingId(int buildingId);
	
	public void deleteById(int id);
}
