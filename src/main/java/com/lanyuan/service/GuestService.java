package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.mapper.Cyy_guestMapper;

@Service
public class GuestService implements IGuestService {

	@Inject
	private Cyy_guestMapper guestMapper;
	
	@Override
	public List<Cyy_guestFormMap> getGuestList() {
		List<Cyy_guestFormMap> guestList = guestMapper.getGuestPage();
		
		return guestList;
	}
	
	@Override
	public void addGuest(Cyy_guestFormMap guest) throws ParameterException {
		Cyy_guestFormMap guestFormMap = guestMapper.getByIDNo(guest);
		
		if (guestFormMap != null) {
			throw new ParameterException();
		} 
		
		guestMapper.addOrUpdateByIDNo(guest);
	}
	
	@Override
	public void deleteById(int id) {
		guestMapper.deleteByGuestId(id);
	}
	
	@Override
	public Cyy_guestFormMap getByIDNo(String IDNo) {
		Cyy_guestFormMap guestFormMap = new Cyy_guestFormMap();
		guestFormMap.set("IDNo", IDNo);
		return guestMapper.getByIDNo(guestFormMap);
	}
}
