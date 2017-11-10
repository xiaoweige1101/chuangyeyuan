package com.lanyuan.mapper.chuangyeyuan;

import java.util.List;

import com.lanyuan.entity.chuangyeyuan.C_roomFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface C_roomMapper extends BaseMapper {
	public void saveOrUpdate(C_roomFormMap room);
	
	public void deleteById(int id);
	
	public List<C_roomFormMap> getList(int pageNo, int pageSize);
	
	public List<C_roomFormMap> getListByCondition(String keyword, int pageNo, int pageSize);
}
