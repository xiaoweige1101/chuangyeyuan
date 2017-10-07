package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.entity.Cyy_buildingFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.entity.Cyy_roomFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.mapper.Cyy_budgetMapper;
import com.lanyuan.mapper.Cyy_buildingMapper;
import com.lanyuan.mapper.Cyy_guestMapper;
import com.lanyuan.mapper.Cyy_roomMapper;
import com.lanyuan.mapper.UserMapper;

@Service
public class BudgetService implements IBudgetService {

	@Inject
	private Cyy_budgetMapper budgetMapper;
	
	@Inject
	private Cyy_guestMapper guestMapper;
	
	@Inject
	private UserMapper userMapper;
	
	@Inject
	private Cyy_roomMapper roomMapper;
	
	@Inject
	private Cyy_buildingMapper buildingmapper;
	
	
	@Override
	public List<Cyy_budgetFormMap> getBudgetList() {
		List<Cyy_budgetFormMap> guestList = budgetMapper.getBudgetList();
		
		for (Cyy_budgetFormMap budget : guestList) {
			int guestId = budget.getInt("guestId");
			int roomId = budget.getInt("roomId");
			int userId = budget.getInt("userId");
			
			Cyy_guestFormMap guest = guestMapper.getById(guestId);
			String guestName = guest.getStr("name");
			
			UserFormMap userFormMap = new UserFormMap();
			userFormMap.set("id", userId);
			UserFormMap user = userMapper.findUserPage(userFormMap).get(0);
			
			String userName = user.getStr("userName");
			
			Cyy_roomFormMap roomFormMap = roomMapper.getById(roomId);
			String roomName = roomFormMap.getStr("roomName");
			int buildingId = roomFormMap.getInt("buildingId");
			
			Cyy_buildingFormMap buildingFormMap = buildingmapper.getById(buildingId);
			String buildingName = buildingFormMap.getStr("buildingName");
			
			System.out.println("userName:" + userName + ",roomName:" + roomName + ",guestName:" + guestName);
			
			budget.set("guestName", guestName);
			budget.set("userName", userName);
			budget.set("room", buildingName + " - " + roomName);
		}
		
		
		return guestList;
	}
	
	
	
	@Override
	public void addBudget(Cyy_budgetFormMap budget) throws ParameterException {
		
		
		System.out.println("=========addBudget=========");
//		Cyy_guestFormMap guestFormMap = guestMapper.getByIDNo(budget);
//		
//		if (guestFormMap != null) {
//			throw new ParameterException();
//		} 
//		
//		guestMapper.addOrUpdateByIDNo(budget);
	}
	
	@Override
	public void deleteById(int id) {
//		budgetMapper.deleteBy
	}
	
}
