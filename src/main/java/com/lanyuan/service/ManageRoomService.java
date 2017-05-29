package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.mapper.Cyy_budgetMapper;
import com.lanyuan.mapper.Cyy_buildingMapper;
import com.lanyuan.mapper.Cyy_guestMapper;
import com.lanyuan.mapper.Cyy_roomMapper;

@Service
public class ManageRoomService implements IManageRoomService {

	@Inject
	private Cyy_roomMapper roomMapper;
	
	@Inject
	private Cyy_guestMapper guestMapper;
	
	@Inject
	private Cyy_buildingMapper buildingMapper;
	
	@Inject
	private Cyy_budgetMapper budgetMapper;
	
	@Override
	public Cyy_buildingFormMap getBuilding(int buildingId) {
		return buildingMapper.getById(buildingId);
	}
	
	@Override
	public Cyy_roomFormMap getById(int id) {
		return roomMapper.getById(id);
	}
	
	@Override
	public List<Cyy_roomFormMap> getRoomList() {
		List<Cyy_roomFormMap> roomList = roomMapper.getRoomPage();
		
		for (Cyy_roomFormMap room : roomList) {
			Integer guestId = room.getInt("currentGuestId");
			Integer buildingId = room.getInt("buildingId");
			
			if (guestId != null) {
				Cyy_guestFormMap guest = guestMapper.getById(guestId.intValue());
				room.put("guestName", guest.getStr("name"));
			} else {
				room.put("guestName", "----");
			}
			
			Cyy_buildingFormMap building = buildingMapper.getById(buildingId.intValue());
			room.put("buildingName", building.getStr("buildingName"));
			
			System.out.println("lastRentTime:" + room.getDate("lastRentTime"));
		}
		
		return roomList;
	}

	@Override
	public void addRoom(String buildingName, String roomName, String roomPrice, String desc) throws ParameterException {
		Cyy_buildingFormMap building = new Cyy_buildingFormMap();
		building.put("buildingName", buildingName);
		Cyy_buildingFormMap buildingFormMap = buildingMapper.getByBuildingName(building);
		
		Cyy_roomFormMap roomParam = new Cyy_roomFormMap();
		roomParam.put("id", buildingFormMap.getInt("id").intValue());
		roomParam.put("roomName", roomName);
		Cyy_roomFormMap room = roomMapper.getRoom(roomParam);
		
		if (room != null) {
			throw new ParameterException("已经存在buildingName:" + buildingName + ", roomName:" + roomName);
		}
		
		room = new Cyy_roomFormMap();
		room.put("buildingId", buildingFormMap.getInt("id").intValue());
		room.put("roomName", roomName);
		room.put("roomPrice", roomPrice);
		room.put("detail", desc);
		
		roomMapper.addOrUpdateByRoomName(room);
	}
	
	@Override
	public void deleteByRoomroomId(int id) {
		roomMapper.deleteByRoomroomId(id);
	}
	
	public void shouzu(int userId, int guestId, int roomId, int rentMoney, int waterMoney, int electMoney, String detail) {
		
		Cyy_budgetFormMap budgetFormMap = new Cyy_budgetFormMap();
		budgetFormMap.set("guestId", guestId);
		budgetFormMap.set("roomId", roomId);
		budgetFormMap.set("waterMoney", waterMoney);
		budgetFormMap.set("electMoney", electMoney);
		budgetFormMap.set("rentMoney", 100);
		budgetFormMap.set("userId", userId);
		budgetFormMap.set("detail", detail);
		
		budgetMapper.addOrUpdateById(budgetFormMap);
	}
}
