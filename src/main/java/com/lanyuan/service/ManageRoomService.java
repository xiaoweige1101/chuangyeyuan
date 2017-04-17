package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.exception.ParameterException;
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
		Cyy_roomFormMap room = roomMapper.getRoom(buildingName, roomName);
		
		if (room != null) {
			throw new ParameterException("已经存在buildingName:" + buildingName + ", roomName:" + roomName);
		}
		
		room = new Cyy_roomFormMap();
		room.set("buildingName", buildingName);
		room.set("roomName", roomName);
		
		roomMapper.addOrUpdateByRoomNum(room);
	}
	
}
