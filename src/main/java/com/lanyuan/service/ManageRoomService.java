package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
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
	
}
