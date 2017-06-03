package com.lanyuan.service;

import java.util.List;

import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.exception.ParameterException;

public interface IGuestService {

	public List<Cyy_guestFormMap> getGuestList();
	
	public void addGuest(Cyy_guestFormMap guest) throws ParameterException;
	
	public void deleteById(int id);
	
	public Cyy_guestFormMap getByIDNo(String IDNo);
}
