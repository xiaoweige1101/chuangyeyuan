package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.RoomFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_buildingMapper extends BaseMapper {
	public List<Cyy_buildingFormMap> getBuildingPage(Cyy_buildingFormMap buildingFormMap);
	
	public Cyy_buildingFormMap getById(int id);
	
	public Cyy_buildingFormMap getByBuildingName(String buildingName);
	
	public void addOrUpdateByBuildingName(Cyy_buildingFormMap buildingName);
	
	public void deleteByBuildingName(String buildingName);
}
