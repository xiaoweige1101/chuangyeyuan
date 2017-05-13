package com.lanyuan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.mapper.Cyy_budgetMapper;
import com.lanyuan.mapper.Cyy_guestMapper;

@Service
public class BudgetService implements IBudgetService {

	@Inject
	private Cyy_budgetMapper budgetMapper;
	
	@Override
	public List<Cyy_budgetFormMap> getBudgetList() {
		List<Cyy_budgetFormMap> guestList = budgetMapper.getBudgetList();
		
		return guestList;
	}
	
	@Override
	public void addBudget(Cyy_budgetFormMap budget) throws ParameterException {
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
