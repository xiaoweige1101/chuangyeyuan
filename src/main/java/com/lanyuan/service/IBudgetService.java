package com.lanyuan.service;

import java.util.List;

import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.exception.ParameterException;

public interface IBudgetService {

	public List<Cyy_budgetFormMap> getBudgetList();
	
	public void addBudget(Cyy_budgetFormMap budget) throws ParameterException;
	
	public void deleteById(int id);
}
