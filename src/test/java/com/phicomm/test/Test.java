package com.phicomm.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lanyuan.service.BudgetService;

public class Test {

	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring-application.xml");
		// UserService userService = (UserService) ac.getBean("userService");
		System.out.println(ac);

		System.out.println("=====我==是==分==割==线=====");
		
		BudgetService budgetService = (BudgetService) ac.getBean("budgetService");
		
		budgetService.addBudget(null);
		
	}
}

