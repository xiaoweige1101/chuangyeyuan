package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_roomMapper extends BaseMapper {
	public Cyy_roomFormMap getById(int id);
	
	public Cyy_roomFormMap getRoom(String buildingName, String roomName);
	
	public List<Cyy_roomFormMap> getRoomPage();
	
	public void addOrUpdateByRoomNum(Cyy_roomFormMap roomFormMap);
	
	public void deleteByRoomNum(String roomNum);
}
