package com.lanyuan.mapper.chuangyeyuan;

import java.util.List;

import com.lanyuan.entity.chuangyeyuan.C_guestFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface C_guestMapper extends BaseMapper {
	public void saveOrUpdate(C_guestFormMap guest);
	
	public void deleteByGuestId(int guestId);
	
	public List<C_guestFormMap> getList(int pageNo, int pageSize);
	
	public List<C_guestFormMap> getListByPartName(String partName, int pageNo, int pageSize);
	
}
