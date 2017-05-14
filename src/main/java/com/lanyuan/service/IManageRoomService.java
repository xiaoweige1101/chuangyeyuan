package com.lanyuan.service;

import java.util.List;

import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.exception.ParameterException;

public interface IManageRoomService {

	public List<Cyy_roomFormMap> getRoomList();
	
	public void addRoom(String buildingName, String roomName, String roomPrice, String desc) throws ParameterException;
	
	public void deleteByRoomroomId(int id);
	
	public Cyy_roomFormMap getById(int id);
	
	public Cyy_buildingFormMap getBuilding(int buildingId);
}
