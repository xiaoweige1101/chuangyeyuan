package com.lanyuan.mapper;

import com.lanyuan.entity.RoomFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_guestMapper extends BaseMapper{
	public RoomFormMap getById(int id);
	
	public RoomFormMap getByRoomNum(String roomNum);
	
	public void addOrUpdateByRoomNum(RoomFormMap roomFormMap);
	
	public void deleteByRoomNum(String roomNum);
}
