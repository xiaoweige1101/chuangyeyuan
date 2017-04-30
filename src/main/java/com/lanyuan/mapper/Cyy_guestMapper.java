package com.lanyuan.mapper;

import java.util.List;

import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface Cyy_guestMapper extends BaseMapper{
	public Cyy_guestFormMap getById(int id);
	
	public Cyy_guestFormMap getByIDNo(Cyy_guestFormMap guest);

	public List<Cyy_guestFormMap> getGuestPage();
	
	public void addOrUpdateByIDNo(Cyy_guestFormMap guest);
}
