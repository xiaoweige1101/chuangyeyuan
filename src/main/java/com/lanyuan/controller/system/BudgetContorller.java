package com.lanyuan.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.Cyy_budgetFormMap;
import com.lanyuan.entity.Cyy_guestFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.exception.SystemException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.BudgetService;
import com.lanyuan.util.Common;

@Controller
@RequestMapping("/budget")
public class BudgetContorller extends BaseController {
	
	@Autowired
	private BudgetService budgetService;
	
	/**********租客管理************/
	@RequestMapping("/list")
	public String listGuest(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/budget/list";
	}
	
	@ResponseBody
	@RequestMapping("/findByPage")
	public PageView findByPage(String pageNow, String pageSize,String column,String sort) throws Exception {
		
		try {
			Cyy_budgetFormMap budgetFormMap = getFormMap(Cyy_budgetFormMap.class);
			budgetFormMap = toFormMap(budgetFormMap, pageNow, pageSize, budgetFormMap.getStr("orderby"));
			budgetFormMap.put("column", column);
			budgetFormMap.put("sort", sort);
			
			List<Cyy_budgetFormMap> budgetList = budgetService.getBudgetList();
			
			pageView.setRecords(budgetList);
			pageView.setOrderby(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pageView;
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/guest/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="房客管理-新增房客")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	public String addEntity(HttpServletRequest request, HttpServletResponse response) {
		try {
			String guestName = request.getParameter("cyy_guest.name");
			String IDNo = request.getParameter("cyy_guest.IDNo");
			String sex = request.getParameter("cyy_guest.sex");
			String granteeMoney = request.getParameter("cyy_guest.granteeMoney");
			String phonenumber = request.getParameter("cyy_guest.phonenumber");
			String detail = request.getParameter("cyy_guest.detail");
			
			Cyy_guestFormMap guest = new Cyy_guestFormMap();
			guest.set("name", guestName);
			guest.set("IDNo", IDNo);
			guest.set("sex", sex);
			guest.set("granteeMoney", granteeMoney);
			guest.set("phonenumber", phonenumber);
			guest.set("detail", detail);
			
//			guestService.addGuest(guest);
		} catch (ParameterException e) {
			throw new ParameterException("大楼名称和房间名称已经存在");
		} catch (Exception e) {
			e.printStackTrace();
			throw new SystemException("添加账号异常");
		}
		return "success";
	}
	
	//删除Guest
	@ResponseBody
	@RequestMapping("/deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
//			guestService.deleteById(Integer.parseInt(id));
		}
		return "success";
	}
	
}