package com.lanyuan.mapper.chuangyeyuan;

import java.util.List;

import com.lanyuan.entity.chuangyeyuan.C_relationshipFormMap;
import com.lanyuan.mapper.base.BaseMapper;

public interface C_relationshipMapper extends BaseMapper {
	
	public void saveOrUpdate(C_relationshipFormMap relationShip);
	
	public List<C_relationshipFormMap> getList(int pageNo, int pageSize);

}
